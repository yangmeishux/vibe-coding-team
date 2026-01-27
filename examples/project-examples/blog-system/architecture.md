# 博客系统 - 架构设计文档

本文档由 Vibe Architect 生成，详细说明博客系统的技术架构。

---

## 📐 系统架构

### 整体架构

```
┌─────────────────────────────────────────────────────────────┐
│                         客户端层                             │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐      │
│  │  Web Browser │  │ Mobile App   │  │ Third-party  │      │
│  │   (React)    │  │   (Future)   │  │   Clients    │      │
│  └──────────────┘  └──────────────┘  └──────────────┘      │
└─────────────────────────────────────────────────────────────┘
                            │
                            ↓ HTTP/REST API
┌─────────────────────────────────────────────────────────────┐
│                      API 网关层                              │
│  ┌──────────────────────────────────────────────────────┐   │
│  │            Express.js Server                          │   │
│  │  ┌────────────┐  ┌────────────┐  ┌────────────┐    │   │
│  │  │   Routes   │  │ Middleware │  │ Controllers │    │   │
│  │  └────────────┘  └────────────┘  └────────────┘    │   │
│  └──────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
                            │
                            ↓
┌─────────────────────────────────────────────────────────────┐
│                      业务逻辑层                              │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐     │
│  │ Auth Service │  │ Post Service │  │Comment Service│     │
│  └──────────────┘  └──────────────┘  └──────────────┘     │
└─────────────────────────────────────────────────────────────┘
                            │
                            ↓
┌─────────────────────────────────────────────────────────────┐
│                      数据访问层                              │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐     │
│  │ User Model   │  │ Post Model   │  │Comment Model │     │
│  └──────────────┘  └──────────────┘  └──────────────┘     │
└─────────────────────────────────────────────────────────────┘
                            │
                            ↓ Mongoose ODM
┌─────────────────────────────────────────────────────────────┐
│                    数据存储层                                │
│  ┌──────────────────────────────────────────────────────┐   │
│  │              MongoDB Database                        │   │
│  │  ┌─────────┐  ┌─────────┐  ┌─────────┐  ┌─────────┐│   │
│  │  │ users   │  │ posts   │  │comments │  │categories││   │
│  │  └─────────┘  └─────────┘  └─────────┘  └─────────┘│   │
│  └──────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
```

---

## 🏗️ 分层架构

### 1. 表现层 (Presentation Layer)

**职责**: 处理 HTTP 请求和响应

**组件**:
- Routes: 定义 API 端点
- Controllers: 处理请求逻辑
- Middleware: 请求预处理

**技术栈**:
- Express.js
- CORS
- Helmet (安全头)
- Morgan (日志)

---

### 2. 业务逻辑层 (Business Logic Layer)

**职责**: 实现核心业务规则和逻辑

**组件**:
- Services: 业务逻辑服务
- Validators: 数据验证
- Utils: 工具函数

**设计原则**:
- 单一职责原则
- 依赖注入
- 易于测试

---

### 3. 数据访问层 (Data Access Layer)

**职责**: 管理数据持久化

**组件**:
- Models: Mongoose 模型定义
- Schema: 数据结构和验证
- Repositories: 数据访问抽象

**技术栈**:
- Mongoose ODM
- MongoDB

---

## 📊 数据模型设计

### 用户模型 (User)

```javascript
{
  _id: ObjectId,
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
    minlength: 6
  },
  avatar: {
    type: String,
    default: null
  },
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
  },
  createdAt: {
    type: Date,
    default: Date.now
  },
  updatedAt: {
    type: Date,
    default: Date.now
  }
}

// 索引
db.users.createIndex({ email: 1 }, { unique: true })
db.users.createIndex({ username: 1 }, { unique: true })
```

---

### 文章模型 (Post)

```javascript
{
  _id: ObjectId,
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
    type: ObjectId,
    ref: 'User',
    required: true
  },
  category: {
    type: ObjectId,
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
  featuredImage: {
    type: String,
    default: null
  },
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
  publishedAt: {
    type: Date,
    default: null
  },
  createdAt: {
    type: Date,
    default: Date.now
  },
  updatedAt: {
    type: Date,
    default: Date.now
  }
}

// 索引
db.posts.createIndex({ slug: 1 }, { unique: true })
db.posts.createIndex({ author: 1, createdAt: -1 })
db.posts.createIndex({ category: 1 })
db.posts.createIndex({ tags: 1 })
db.posts.createIndex({ status: 1, publishedAt: -1 })
db.posts.createIndex({ title: "text", content: "text" }) // 全文搜索
```

---

### 评论模型 (Comment)

```javascript
{
  _id: ObjectId,
  content: {
    type: String,
    required: true,
    trim: true,
    maxlength: 2000
  },
  author: {
    type: ObjectId,
    ref: 'User',
    required: true
  },
  post: {
    type: ObjectId,
    ref: 'Post',
    required: true
  },
  parent: {
    type: ObjectId,
    ref: 'Comment',
    default: null
  },
  likes: {
    type: Number,
    default: 0
  },
  isEdited: {
    type: Boolean,
    default: false
  },
  createdAt: {
    type: Date,
    default: Date.now
  },
  updatedAt: {
    type: Date,
    default: Date.now
  }
}

// 索引
db.comments.createIndex({ post: 1, createdAt: -1 })
db.comments.createIndex({ author: 1 })
db.comments.createIndex({ parent: 1 })
```

---

### 分类模型 (Category)

```javascript
{
  _id: ObjectId,
  name: {
    type: String,
    required: true,
    unique: true,
    trim: true,
    maxlength: 100
  },
  slug: {
    type: String,
    unique: true,
    lowercase: true
  },
  description: {
    type: String,
    maxlength: 500
  },
  icon: {
    type: String,
    default: null
  },
  isActive: {
    type: Boolean,
    default: true
  },
  createdAt: {
    type: Date,
    default: Date.now
  },
  updatedAt: {
    type: Date,
    default: Date.now
  }
}

// 索引
db.categories.createIndex({ slug: 1 }, { unique: true })
db.categories.createIndex({ name: 1 }, { unique: true })
```

---

## 🔄 API 设计

### RESTful 端点

#### 认证端点

```
POST   /api/auth/register      # 注册
POST   /api/auth/login         # 登录
POST   /api/auth/logout        # 登出
POST   /api/auth/refresh       # 刷新 Token
GET    /api/auth/me            # 获取当前用户
```

#### 文章端点

```
GET    /api/posts              # 获取文章列表（分页）
GET    /api/posts/:id          # 获取文章详情
GET    /api/posts/slug/:slug   # 通过 slug 获取文章
POST   /api/posts              # 创建文章（认证）
PUT    /api/posts/:id          # 更新文章（认证）
DELETE /api/posts/:id          # 删除文章（认证）
GET    /api/posts/search       # 搜索文章
```

#### 评论端点

```
GET    /api/posts/:postId/comments     # 获取文章评论
POST   /api/posts/:postId/comments     # 添加评论（认证）
PUT    /api/comments/:id               # 更新评论（认证）
DELETE /api/comments/:id               # 删除评论（认证）
POST   /api/comments/:id/like          # 点赞评论（认证）
```

#### 分类端点

```
GET    /api/categories          # 获取所有分类
GET    /api/categories/:id      # 获取分类详情
POST   /api/categories          # 创建分类（认证）
PUT    /api/categories/:id      # 更新分类（认证）
DELETE /api/categories/:id      # 删除分类（认证）
```

#### 用户端点

```
GET    /api/users               # 获取用户列表
GET    /api/users/:id           # 获取用户详情
PUT    /api/users/:id           # 更新用户信息（认证）
PUT    /api/users/:id/password  # 修改密码（认证）
GET    /api/users/:id/posts     # 获取用户的文章
```

---

## 🔐 安全架构

### 认证流程

```
┌─────────┐                    ┌─────────┐
│ Client  │                    │  Server │
└────┬────┘                    └────┬────┘
     │                              │
     │  POST /api/auth/login        │
     │  { email, password }         │
     │─────────────────────────────>│
     │                              │
     │                              │ 验证密码
     │                              │ 生成 JWT
     │                              │
     │  { token, user }             │
     │<─────────────────────────────│
     │                              │
     │  Store token                 │
     │                              │
     │  GET /api/posts              │
     │  Authorization: Bearer token │
     │─────────────────────────────>│
     │                              │
     │                              │ 验证 JWT
     │                              │ 提取用户信息
     │                              │
     │  { posts }                   │
     │<─────────────────────────────│
```

### 安全措施

1. **认证和授权**
   - JWT Token 认证
   - Token 过期机制
   - Refresh Token
   - RBAC (基于角色的访问控制)

2. **输入验证**
   - 请求体验证
   - 参数验证
   - 数据清理和过滤

3. **防护措施**
   - CORS 配置
   - Helmet (HTTP 头安全)
   - 速率限制
   - XSS 防护
   - SQL 注入防护
   - CSRF 防护

---

## ⚡ 性能优化

### 数据库优化

1. **索引优化**
   ```javascript
   // 复合索引
   db.posts.createIndex({ status: 1, publishedAt: -1 })

   // 全文搜索索引
   db.posts.createIndex({
     title: "text",
     content: "text"
   })
   ```

2. **查询优化**
   ```javascript
   // 使用 lean() 减少内存
   Post.find().lean()

   // 限制返回字段
   Post.find().select('title author createdAt')

   // 分页
   Post.find()
     .skip((page - 1) * limit)
     .limit(limit)
   ```

3. **连接池配置**
   ```javascript
   mongoose.connect(uri, {
     poolSize: 10,
     bufferMaxEntries: 0,
     useNewUrlParser: true,
     useUnifiedTopology: true
   })
   ```

---

### 缓存策略

1. **Redis 缓存**（可选）
   ```javascript
   // 缓存热门文章
   const cacheKey = `posts:popular`
   const cached = await redis.get(cacheKey)

   if (cached) {
     return JSON.parse(cached)
   }

   const posts = await Post.find()
   await redis.setex(cacheKey, 3600, JSON.stringify(posts))
   ```

2. **HTTP 缓存**
   ```javascript
   // 设置缓存头
   res.set('Cache-Control', 'public, max-age=3600')
   res.set('ETag', computedETag)
   ```

---

### 响应优化

1. **压缩**
   ```javascript
   app.use(compression())
   ```

2. **分页**
   ```javascript
   // 总是返回分页数据
   {
     data: posts,
     pagination: {
       page: 1,
       limit: 10,
       total: 100,
       totalPages: 10
     }
   }
   ```

3. **字段选择**
   ```javascript
   // 列表端点只返回必要字段
   Post.find().select('title excerpt author createdAt')
   ```

---

## 🧪 测试策略

### 测试金字塔

```
        ┌─────┐
       ╱       ╲   E2E Tests (10%)
      ╱  Smoke   ╲  关键用户流程
     ╱_____________╲
    ╱               ╲
   ╱    Integration  ╲  Integration Tests (30%)
  ╱       Tests        ╲  API 端点测试
 ╱_______________________╲
╱                         ╲
╱      Unit Tests          ╲ Unit Tests (60%)
╱    (Models, Services)     ╲ 模型和服务测试
╱___________________________╲
```

### 测试覆盖目标

- ✅ 单元测试覆盖率 > 80%
- ✅ 关键业务逻辑覆盖率 = 100%
- ✅ 所有 API 端点有集成测试
- ✅ 关键用户流程有 E2E 测试

---

## 📦 部署架构

### 开发环境

```
┌─────────────────────────────────────┐
│         开发机器                     │
│  ┌───────────────┐  ┌─────────────┐│
│  │  Node.js App  │  │  MongoDB    ││
│  │  (Port 3000)  │  │  (Port 27017)││
│  └───────────────┘  └─────────────┘│
└─────────────────────────────────────┘
```

### 生产环境

```
                    ┌─────────────────┐
                    │   Nginx Proxy   │
                    │   (Port 80/443) │
                    └────────┬────────┘
                             │
              ┌──────────────┼──────────────┐
              │              │              │
         ┌────▼────┐   ┌────▼────┐   ┌────▼────┐
         │ App 1   │   │ App 2   │   │ App 3   │
         │Port 3000│   │Port 3001│   │Port 3002│
         └────┬────┘   └────┬────┘   └────┬────┘
              │              │              │
              └──────────────┼──────────────┘
                             │
                    ┌────────▼────────┐
                    │  MongoDB        │
                    │  Replica Set    │
                    │  (Primary +     │
                    │   Secondaries)  │
                    └─────────────────┘
```

---

## 🔄 扩展性考虑

### 水平扩展

1. **无状态应用**
   - Session 存储在 Redis
   - JWT 无状态认证
   - 文件存储在云服务（S3）

2. **负载均衡**
   - Nginx 反向代理
   - PM2 集群模式
   - Docker Swarm / Kubernetes

### 垂直扩展

1. **数据库分片**
   - 按用户 ID 分片
   - 按时间分片

2. **读写分离**
   - Primary 负责写
   - Secondaries 负责读

---

## 📊 监控和日志

### 日志策略

```javascript
// 分级日志
logger.error('Critical error', error)
logger.warn('Warning message')
logger.info('Info message')
logger.debug('Debug message')

// 结构化日志
logger.info('User registered', {
  userId: user.id,
  email: user.email,
  timestamp: new Date().toISOString()
})
```

### 监控指标

- **应用指标**
  - 请求响应时间
  - 错误率
  - 并发连接数

- **系统指标**
  - CPU 使用率
  - 内存使用率
  - 磁盘 I/O

- **业务指标**
  - 注册用户数
  - 文章发布数
  - 活跃用户数

---

## 🎯 总结

这个架构设计：

✅ **可扩展**: 支持水平和垂直扩展
✅ **可维护**: 清晰的分层架构
✅ **安全**: 多层安全防护
✅ **高性能**: 缓存和索引优化
✅ **可测试**: 完整的测试策略
✅ **可监控**: 日志和监控机制

---

**文档版本**: 1.0.0
**最后更新**: 2026-01-27
**作者**: Vibe Architect
