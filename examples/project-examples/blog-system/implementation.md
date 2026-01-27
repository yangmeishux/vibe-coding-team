# 博客系统 - 实现指南

本文档提供博客系统的核心实现代码和关键代码片段。

---

## 📦 完整项目文件

完整的可运行代码已经包含在本项目的 `backend/` 和 `frontend/` 目录中。

**提示**: 本项目是一个完整的可运行示例，您可以直接：
1. 克隆仓库
2. 进入 `examples/project-examples/blog-system/`
3. 运行 `npm install`
4. 配置 `.env` 文件
5. 运行 `npm run dev`

---

## 🔑 核心实现

### 1. 用户模型 (backend/models/User.js)

```javascript
const mongoose = require('mongoose');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

const userSchema = new mongoose.Schema({
  username: {
    type: String,
    required: true,
    unique: true,
    trim: true,
    minlength: 3,
    maxlength: 30
  },
  email: {
    type: String,
    required: true,
    unique: true,
    lowercase: true,
    trim: true
  },
  password: {
    type: String,
    required: true,
    minlength: 6,
    select: false  // 默认查询不返回密码
  },
  avatar: String,
  bio: {
    type: String,
    maxlength: 500
  },
  role: {
    type: String,
    enum: ['user', 'admin'],
    default: 'user'
  },
  isActive: {
    type: Boolean,
    default: true
  }
}, {
  timestamps: true
});

// 索引
userSchema.index({ email: 1 }, { unique: true });
userSchema.index({ username: 1 }, { unique: true });

// 密码哈希中间件
userSchema.pre('save', async function(next) {
  if (!this.isModified('password')) return next();

  try {
    const salt = await bcrypt.genSalt(10);
    this.password = await bcrypt.hash(this.password, salt);
    next();
  } catch (error) {
    next(error);
  }
});

// 实例方法：验证密码
userSchema.methods.comparePassword = async function(candidatePassword) {
  return await bcrypt.compare(candidatePassword, this.password);
};

// 实例方法：生成 JWT
userSchema.methods.generateToken = function() {
  return jwt.sign(
    { id: this._id, role: this.role },
    process.env.JWT_SECRET,
    { expiresIn: process.env.JWT_EXPIRE || '7d' }
  );
};

module.exports = mongoose.model('User', userSchema);
```

---

### 2. 文章模型 (backend/models/Post.js)

```javascript
const mongoose = require('mongoose');

const postSchema = new mongoose.Schema({
  title: {
    type: String,
    required: true,
    trim: true,
    maxlength: 200
  },
  slug: {
    type: String,
    unique: true,
    lowercase: true
  },
  content: {
    type: String,
    required: true
  },
  excerpt: {
    type: String,
    maxlength: 500
  },
  author: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  },
  category: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Category',
    required: true
  },
  tags: [{
    type: String,
    trim: true,
    lowercase: true
  }],
  status: {
    type: String,
    enum: ['draft', 'published', 'archived'],
    default: 'draft'
  },
  featuredImage: String,
  stats: {
    views: {
      type: Number,
      default: 0
    },
    likes: {
      type: Number,
      default: 0
    },
    commentsCount: {
      type: Number,
      default: 0
    }
  },
  publishedAt: Date
}, {
  timestamps: true
});

// 索引
postSchema.index({ slug: 1 }, { unique: true });
postSchema.index({ author: 1, createdAt: -1 });
postSchema.index({ category: 1 });
postSchema.index({ tags: 1 });
postSchema.index({ status: 1, publishedAt: -1 });
postSchema.index({ title: "text", content: "text" }); // 全文搜索

// 生成 slug
postSchema.pre('save', function(next) {
  if (!this.slug) {
    this.slug = this.title
      .toLowerCase()
      .replace(/[^a-z0-9]+/g, '-')
      .replace(/^-+|-+$/g, '') +
      '-' + Date.now().toString(36);
  }
  next();
});

// 自动生成 excerpt
postSchema.pre('save', function(next) {
  if (!this.excerpt && this.content) {
    this.excerpt = this.content
      .replace(/[#*`>\-\[\]]/g, '') // 移除 Markdown 符号
      .substring(0, 300) + '...';
  }
  next();
});

module.exports = mongoose.model('Post', postSchema);
```

---

### 3. 认证中间件 (backend/middleware/auth.js)

```javascript
const jwt = require('jsonwebtoken');
const User = require('../models/User');

const auth = async (req, res, next) => {
  try {
    // 1. 从 header 获取 token
    const authHeader = req.headers.authorization;

    if (!authHeader || !authHeader.startsWith('Bearer ')) {
      return res.status(401).json({
        success: false,
        message: 'No token provided'
      });
    }

    const token = authHeader.split(' ')[1];

    // 2. 验证 token
    const decoded = jwt.verify(token, process.env.JWT_SECRET);

    // 3. 查找用户
    const user = await User.findById(decoded.id).select('-password');

    if (!user || !user.isActive) {
      return res.status(401).json({
        success: false,
        message: 'User not found or inactive'
      });
    }

    // 4. 附加用户信息到请求
    req.user = user;
    next();
  } catch (error) {
    if (error.name === 'JsonWebTokenError') {
      return res.status(401).json({
        success: false,
        message: 'Invalid token'
      });
    }
    if (error.name === 'TokenExpiredError') {
      return res.status(401).json({
        success: false,
        message: 'Token expired'
      });
    }
    next(error);
  }
};

// 授权中间件（检查角色）
const authorize = (...roles) => {
  return (req, res, next) => {
    if (!roles.includes(req.user.role)) {
      return res.status(403).json({
        success: false,
        message: 'Not authorized to access this resource'
      });
    }
    next();
  };
};

module.exports = { auth, authorize };
```

---

### 4. 认证控制器 (backend/controllers/authController.js)

```javascript
const User = require('../models/User');

// 注册
const register = async (req, res) => {
  try {
    const { username, email, password } = req.body;

    // 检查用户是否已存在
    const existingUser = await User.findOne({ $or: [{ email }, { username }] });
    if (existingUser) {
      return res.status(400).json({
        success: false,
        message: 'User already exists'
      });
    }

    // 创建用户
    const user = await User.create({
      username,
      email,
      password
    });

    // 生成 token
    const token = user.generateToken();

    res.status(201).json({
      success: true,
      message: 'User registered successfully',
      data: {
        user: {
          id: user._id,
          username: user.username,
          email: user.email,
          role: user.role
        },
        token
      }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message
    });
  }
};

// 登录
const login = async (req, res) => {
  try {
    const { email, password } = req.body;

    // 查找用户（包含密码字段）
    const user = await User.findOne({ email }).select('+password');
    if (!user) {
      return res.status(401).json({
        success: false,
        message: 'Invalid credentials'
      });
    }

    // 验证密码
    const isPasswordValid = await user.comparePassword(password);
    if (!isPasswordValid) {
      return res.status(401).json({
        success: false,
        message: 'Invalid credentials'
      });
    }

    // 检查用户是否激活
    if (!user.isActive) {
      return res.status(401).json({
        success: false,
        message: 'Account is inactive'
      });
    }

    // 生成 token
    const token = user.generateToken();

    res.status(200).json({
      success: true,
      message: 'Login successful',
      data: {
        user: {
          id: user._id,
          username: user.username,
          email: user.email,
          role: user.role
        },
        token
      }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message
    });
  }
};

// 获取当前用户
const getMe = async (req, res) => {
  try {
    res.status(200).json({
      success: true,
      data: {
        user: req.user
      }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message
    });
  }
};

module.exports = { register, login, getMe };
```

---

### 5. 文章控制器 (backend/controllers/postController.js)

```javascript
const Post = require('../models/Post');

// 获取所有文章（分页）
const getAllPosts = async (req, res) => {
  try {
    const {
      page = 1,
      limit = 10,
      category,
      tag,
      search,
      status = 'published'
    } = req.query;

    // 构建查询
    const query = { status };

    if (category) query.category = category;
    if (tag) query.tags = tag;
    if (search) {
      query.$text = { $search: search };
    }

    // 执行查询
    const posts = await Post.find(query)
      .populate('author', 'username avatar')
      .populate('category', 'name slug')
      .select('title excerpt author category tags stats createdAt')
      .sort({ publishedAt: -1 })
      .skip((page - 1) * limit)
      .limit(parseInt(limit))
      .lean();

    // 计算总数
    const total = await Post.countDocuments(query);

    res.status(200).json({
      success: true,
      data: {
        posts,
        pagination: {
          currentPage: parseInt(page),
          totalPages: Math.ceil(total / limit),
          totalItems: total,
          itemsPerPage: parseInt(limit)
        }
      }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message
    });
  }
};

// 获取单个文章
const getPostById = async (req, res) => {
  try {
    const post = await Post.findById(req.params.id)
      .populate('author', 'username avatar bio')
      .populate('category', 'name description')
      .populate({
        path: 'comments',
        populate: { path: 'author', select: 'username avatar' },
        options: { sort: { createdAt: -1 } }
      });

    if (!post) {
      return res.status(404).json({
        success: false,
        message: 'Post not found'
      });
    }

    // 增加浏览量
    post.stats.views += 1;
    await post.save();

    res.status(200).json({
      success: true,
      data: { post }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message
    });
  }
};

// 创建文章
const createPost = async (req, res) => {
  try {
    const { title, content, category, tags, status = 'draft' } = req.body;

    const post = await Post.create({
      title,
      content,
      category,
      tags,
      status,
      author: req.user._id,
      publishedAt: status === 'published' ? new Date() : null
    });

    await post.populate('author', 'username email');
    await post.populate('category', 'name slug');

    res.status(201).json({
      success: true,
      message: 'Post created successfully',
      data: { post }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message
    });
  }
};

// 更新文章
const updatePost = async (req, res) => {
  try {
    const post = await Post.findById(req.params.id);

    if (!post) {
      return res.status(404).json({
        success: false,
        message: 'Post not found'
      });
    }

    // 检查权限
    if (post.author.toString() !== req.user._id.toString() && req.user.role !== 'admin') {
      return res.status(403).json({
        success: false,
        message: 'Not authorized to update this post'
      });
    }

    // 更新字段
    const { title, content, category, tags, status } = req.body;

    if (title) post.title = title;
    if (content) post.content = content;
    if (category) post.category = category;
    if (tags) post.tags = tags;
    if (status) {
      post.status = status;
      if (status === 'published' && !post.publishedAt) {
        post.publishedAt = new Date();
      }
    }

    await post.save();
    await post.populate('author', 'username email');
    await post.populate('category', 'name slug');

    res.status(200).json({
      success: true,
      message: 'Post updated successfully',
      data: { post }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message
    });
  }
};

// 删除文章
const deletePost = async (req, res) => {
  try {
    const post = await Post.findById(req.params.id);

    if (!post) {
      return res.status(404).json({
        success: false,
        message: 'Post not found'
      });
    }

    // 检查权限
    if (post.author.toString() !== req.user._id.toString() && req.user.role !== 'admin') {
      return res.status(403).json({
        success: false,
        message: 'Not authorized to delete this post'
      });
    }

    await post.deleteOne();

    res.status(204).send();
  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message
    });
  }
};

module.exports = {
  getAllPosts,
  getPostById,
  createPost,
  updatePost,
  deletePost
};
```

---

### 6. 路由定义 (backend/routes/postRoutes.js)

```javascript
const express = require('express');
const router = express.Router();
const postController = require('../controllers/postController');
const { auth } = require('../middleware/auth');

// 公开端点
router.get('/', postController.getAllPosts);
router.get('/:id', postController.getPostById);

// 需要认证的端点
router.post('/', auth, postController.createPost);
router.put('/:id', auth, postController.updatePost);
router.delete('/:id', auth, postController.deletePost);

module.exports = router;
```

---

### 7. Express 应用配置 (backend/app.js)

```javascript
const express = require('express');
const cors = require('cors');
const helmet = require('helmet');
const morgan = require('morgan');
const compression = require('compression');
const mongoose = require('mongoose');

// 路由
const authRoutes = require('./routes/authRoutes');
const postRoutes = require('./routes/postRoutes');
const commentRoutes = require('./routes/commentRoutes');
const categoryRoutes = require('./routes/categoryRoutes');

// 错误处理中间件
const errorHandler = require('./middleware/errorHandler');

const app = express();

// 安全中间件
app.use(helmet());

// CORS 配置
app.use(cors({
  origin: process.env.CORS_ORIGIN || '*',
  credentials: true
}));

// 压缩
app.use(compression());

// 日志
if (process.env.NODE_ENV === 'development') {
  app.use(morgan('dev'));
}

// Body 解析
app.use(express.json({ limit: '10mb' }));
app.use(express.urlencoded({ extended: true }));

// API 路由
app.use('/api/auth', authRoutes);
app.use('/api/posts', postRoutes);
app.use('/api/comments', commentRoutes);
app.use('/api/categories', categoryRoutes);

// 健康检查
app.get('/health', (req, res) => {
  res.status(200).json({
    success: true,
    message: 'Server is healthy'
  });
});

// 404 处理
app.use('*', (req, res) => {
  res.status(404).json({
    success: false,
    message: 'Route not found'
  });
});

// 错误处理
app.use(errorHandler);

module.exports = app;
```

---

### 8. 服务器入口 (backend/server.js)

```javascript
require('dotenv').config();
const mongoose = require('mongoose');
const app = require('./app');

const PORT = process.env.PORT || 3000;
const MONGODB_URI = process.env.MONGODB_URI || 'mongodb://localhost:27017/blog_system';

// 连接数据库
mongoose.connect(MONGODB_URI, {
  useNewUrlParser: true,
  useUnifiedTopology: true
})
.then(() => {
  console.log('✅ MongoDB connected successfully');
})
.catch((error) => {
  console.error('❌ MongoDB connection error:', error.message);
  process.exit(1);
});

// 启动服务器
const server = app.listen(PORT, () => {
  console.log(`
╔════════════════════════════════════════╗
║   🚀 Blog System API Server           ║
║                                        ║
║   Port: ${PORT}                         ║
║   Env:  ${process.env.NODE_ENV || 'development'}                      ║
║   Time: ${new Date().toLocaleString()}    ║
╚════════════════════════════════════════╝
  `);
});

// 处理未捕获的异常
process.on('unhandledRejection', (err) => {
  console.error('❌ Unhandled Rejection:', err);
  server.close(() => process.exit(1));
});

process.on('uncaughtException', (err) => {
  console.error('❌ Uncaught Exception:', err);
  process.exit(1);
});

module.exports = server;
```

---

## 🧪 测试示例

### 单元测试 (tests/models/User.test.js)

```javascript
const User = require('../../models/User');
const mongoose = require('mongoose');

describe('User Model', () => {
  beforeAll(async () => {
    await mongoose.connect('mongodb://localhost:27017/test', {
      useNewUrlParser: true,
      useUnifiedTopology: true
    });
  });

  afterAll(async () => {
    await mongoose.connection.dropDatabase();
    await mongoose.connection.close();
  });

  it('should create a user with valid data', async () => {
    const userData = {
      username: 'testuser',
      email: 'test@example.com',
      password: 'password123'
    };

    const user = await User.create(userData);

    expect(user.username).toBe('testuser');
    expect(user.email).toBe('test@example.com');
    expect(user.password).not.toBe('password123'); // 应该被哈希
  });

  it('should hash password before saving', async () => {
    const user = await User.create({
      username: 'testuser2',
      email: 'test2@example.com',
      password: 'password123'
    });

    const isMatch = await user.comparePassword('password123');
    expect(isMatch).toBe(true);
  });

  it('should generate JWT token', async () => {
    const user = await User.create({
      username: 'testuser3',
      email: 'test3@example.com',
      password: 'password123'
    });

    const token = user.generateToken();
    expect(token).toBeDefined();
    expect(typeof token).toBe('string');
  });
});
```

---

## 📦 Package.json 配置

```json
{
  "name": "blog-system",
  "version": "1.0.0",
  "description": "A complete blog system with Vibe Coding Team",
  "main": "backend/server.js",
  "scripts": {
    "start": "node backend/server.js",
    "dev": "nodemon backend/server.js",
    "test": "jest --coverage",
    "test:unit": "jest --testPathPattern=tests/unit",
    "test:integration": "jest --testPathPattern=tests/integration",
    "seed": "node backend/scripts/seed.js"
  },
  "dependencies": {
    "express": "^4.18.2",
    "mongoose": "^7.0.0",
    "bcryptjs": "^2.4.3",
    "jsonwebtoken": "^9.0.0",
    "dotenv": "^16.0.0",
    "cors": "^2.8.5",
    "helmet": "^7.0.0",
    "morgan": "^1.10.0",
    "compression": "^1.7.4",
    "express-validator": "^6.15.0"
  },
  "devDependencies": {
    "nodemon": "^2.0.22",
    "jest": "^29.5.0",
    "supertest": "^6.3.3"
  }
}
```

---

## 📝 总结

以上是博客系统的核心实现代码。完整的项目包含：

✅ **完整的后端代码**
- 用户认证系统（JWT）
- 文章管理 API
- 评论系统
- 分类和标签

✅ **数据库模型**
- User、Post、Comment、Category 模型
- 索引优化
- 数据验证

✅ **安全性**
- JWT 认证
- 密码哈希
- 输入验证
- CORS 配置

✅ **测试**
- 单元测试
- 集成测试
- 覆盖率报告

---

**文档版本**: 1.0.0
**最后更新**: 2026-01-27
**作者**: Vibe Coder + Vibe Architect
