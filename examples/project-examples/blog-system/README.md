# 博客系统 - 完整可运行示例

🚀 **项目类型**: 完整可运行版本
⏱️ **预计时间**: 1-2 小时
🎯 **学习目标**: 获得一个可直接运行的博客系统

---

## 📋 项目概述

这是一个功能完整的博客系统，可以直接克隆、运行和部署。

**核心功能**:
- ✅ 用户注册和登录（JWT 认证）
- ✅ 文章的创建、编辑、删除
- ✅ 文章列表和详情查看
- ✅ 评论功能
- ✅ 标签和分类
- ✅ Markdown 编辑器支持
- ✅ 文章搜索和过滤

**技术栈**:
- **后端**: Node.js + Express + MongoDB
- **前端**: React + Axios
- **认证**: JWT (JSON Web Token)
- **数据库**: MongoDB (Mongoose ODM)

---

## 🚀 快速开始

### 前置要求

```bash
# 必需软件
- Node.js >= 16.x
- MongoDB >= 5.x
- npm 或 yarn
```

### 安装和运行

#### 1. 克隆项目

```bash
# 进入项目目录
cd blog-system

# 安装依赖
npm install
```

#### 2. 配置环境变量

创建 `.env` 文件：

```bash
# 服务器配置
PORT=3000
NODE_ENV=development

# 数据库配置
MONGODB_URI=mongodb://localhost:27017/blog_system

# JWT 密钥（生产环境请使用强密码）
JWT_SECRET=your-super-secret-jwt-key-change-this-in-production
JWT_EXPIRE=7d

# CORS 配置
CORS_ORIGIN=http://localhost:3001
```

#### 3. 启动 MongoDB

```bash
# macOS (使用 Homebrew)
brew services start mongodb-community

# Linux
sudo systemctl start mongod

# Windows
# 从服务管理器启动 MongoDB 服务
```

#### 4. 初始化数据库

```bash
# 运行数据库种子脚本
npm run seed
```

#### 5. 启动应用

```bash
# 开发模式（热重载）
npm run dev

# 生产模式
npm start
```

#### 6. 访问应用

```bash
# API 端点
http://localhost:3000/api

# API 文档
http://localhost:3000/api-docs
```

---

## 📁 项目结构

```
blog-system/
├── backend/                    # 后端代码
│   ├── config/
│   │   ├── db.js              # 数据库配置
│   │   └── jwt.js             # JWT 配置
│   ├── models/
│   │   ├── User.js            # 用户模型
│   │   ├── Post.js            # 文章模型
│   │   ├── Comment.js         # 评论模型
│   │   └── Category.js        # 分类模型
│   ├── controllers/
│   │   ├── authController.js  # 认证控制器
│   │   ├── postController.js  # 文章控制器
│   │   ├── commentController.js
│   │   └── categoryController.js
│   ├── routes/
│   │   ├── authRoutes.js      # 认证路由
│   │   ├── postRoutes.js      # 文章路由
│   │   └── ...
│   ├── middleware/
│   │   ├── auth.js            # 认证中间件
│   │   ├── validator.js       # 输入验证
│   │   └── errorHandler.js    # 错误处理
│   ├── utils/
│   │   └── logger.js          # 日志工具
│   └── server.js              # 服务器入口
├── frontend/                   # 前端代码（React）
│   ├── src/
│   │   ├── components/
│   │   ├── pages/
│   │   ├── services/
│   │   └── App.js
│   └── public/
├── tests/                      # 测试文件
│   ├── unit/
│   └── integration/
├── .env.example                # 环境变量示例
├── package.json
└── README.md
```

---

## 🎯 Vibe Coding 开发流程

本示例是通过 Vibe Coding Team 完整开发的，以下是完整的开发流程：

### 步骤 1: 需求分析

```bash
[vibe-architect] 我需要一个功能完整的博客系统，包括：
  - 用户认证（注册、登录、JWT）
  - 文章管理（CRUD）
  - 评论系统
  - 标签和分类
  - 搜索功能
  使用 Node.js + Express + MongoDB + React
```

**Vibe Architect 输出**:
- ✅ [需求分析文档](./design/requirements.md)
- ✅ [架构设计文档](./design/architecture.md)

---

### 步骤 2: 代码生成

```bash
[@vibe-coder] 基于架构设计，实现后端 API
```

**Vibe Coder 输出**:
- ✅ 完整的后端代码
- ✅ 数据库模型
- ✅ API 端点
- ✅ 中间件

---

### 步骤 3: 代码审查

```bash
[@vibe-reviewer] 审查代码的安全性、性能和可维护性
```

**Vibe Reviewer 输出**:
- ✅ [代码审查报告](./review/code-review.md)
- ✅ 安全性检查
- ✅ 性能优化建议

---

### 步骤 4: 测试生成

```bash
[@vibe-debugger] 生成完整的测试套件
```

**Vibe Debugger 输出**:
- ✅ 单元测试
- ✅ 集成测试
- ✅ E2E 测试

---

### 步骤 5: 文档生成

```bash
[@vibe-documenter] 生成 API 文档和用户手册
```

**Vibe Documenter 输出**:
- ✅ [API 文档](./docs/API.md)
- ✅ 部署指南
- ✅ 使用手册

---

## 📚 API 文档

### 认证端点

#### POST /api/auth/register

注册新用户

**请求**:
```json
{
  "username": "john_doe",
  "email": "john@example.com",
  "password": "SecurePassword123!"
}
```

**响应** (201):
```json
{
  "success": true,
  "message": "User registered successfully",
  "data": {
    "user": {
      "id": "64abc123def456789",
      "username": "john_doe",
      "email": "john@example.com"
    },
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
  }
}
```

#### POST /api/auth/login

用户登录

**请求**:
```json
{
  "email": "john@example.com",
  "password": "SecurePassword123!"
}
```

**响应** (200):
```json
{
  "success": true,
  "message": "Login successful",
  "data": {
    "user": {
      "id": "64abc123def456789",
      "username": "john_doe",
      "email": "john@example.com"
    },
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
  }
}
```

---

### 文章端点

#### GET /api/posts

获取所有文章（支持分页和过滤）

**查询参数**:
- `page`: 页码（默认 1）
- `limit`: 每页数量（默认 10）
- `category`: 分类过滤
- `search`: 搜索关键词

**请求**:
```
GET /api/posts?page=1&limit=10&category=tech&search=react
```

**响应** (200):
```json
{
  "success": true,
  "data": {
    "posts": [
      {
        "id": "64xyz789abc123456",
        "title": "Getting Started with React",
        "content": "React is a JavaScript library...",
        "excerpt": "React is a JavaScript library for building user interfaces...",
        "author": {
          "id": "64abc123def456789",
          "username": "john_doe"
        },
        "category": {
          "id": "cat123",
          "name": "Technology"
        },
        "tags": ["react", "javascript", "frontend"],
        "createdAt": "2026-01-27T10:00:00.000Z",
        "updatedAt": "2026-01-27T10:00:00.000Z"
      }
    ],
    "pagination": {
      "currentPage": 1,
      "totalPages": 5,
      "totalItems": 50,
      "itemsPerPage": 10
    }
  }
}
```

#### GET /api/posts/:id

获取单个文章详情

**请求**:
```
GET /api/posts/64xyz789abc123456
```

**响应** (200):
```json
{
  "success": true,
  "data": {
    "post": {
      "id": "64xyz789abc123456",
      "title": "Getting Started with React",
      "content": "React is a JavaScript library...",
      "author": {
        "id": "64abc123def456789",
        "username": "john_doe",
        "avatar": "/uploads/avatars/john_doe.jpg"
      },
      "category": {
        "id": "cat123",
        "name": "Technology",
        "slug": "technology"
      },
      "tags": ["react", "javascript"],
      "comments": [
        {
          "id": "comm123",
          "content": "Great article!",
          "author": {
            "username": "jane_doe"
          },
          "createdAt": "2026-01-27T11:00:00.000Z"
        }
      ],
      "stats": {
        "views": 1250,
        "likes": 45,
        "commentsCount": 12
      },
      "createdAt": "2026-01-27T10:00:00.000Z",
      "updatedAt": "2026-01-27T10:00:00.000Z"
    }
  }
}
```

#### POST /api/posts

创建新文章（需要认证）

**请求头**:
```
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

**请求**:
```json
{
  "title": "Getting Started with Node.js",
  "content": "Node.js is a JavaScript runtime...",
  "category": "64cat123",
  "tags": ["nodejs", "javascript", "backend"],
  "status": "published"
}
```

**响应** (201):
```json
{
  "success": true,
  "message": "Post created successfully",
  "data": {
    "post": {
      "id": "64new123",
      "title": "Getting Started with Node.js",
      "slug": "getting-started-with-nodejs",
      "author": {
        "id": "64abc123def456789",
        "username": "john_doe"
      },
      "createdAt": "2026-01-27T12:00:00.000Z"
    }
  }
}
```

#### PUT /api/posts/:id

更新文章（需要认证和权限）

**请求头**:
```
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

**请求**:
```json
{
  "title": "Updated: Getting Started with Node.js",
  "content": "Updated content...",
  "tags": ["nodejs", "javascript", "backend", "express"]
}
```

**响应** (200):
```json
{
  "success": true,
  "message": "Post updated successfully",
  "data": {
    "post": {
      "id": "64new123",
      "title": "Updated: Getting Started with Node.js",
      "updatedAt": "2026-01-27T13:00:00.000Z"
    }
  }
}
```

#### DELETE /api/posts/:id

删除文章（需要认证和权限）

**请求头**:
```
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

**响应** (204):
```
No Content
```

---

### 评论端点

#### POST /api/posts/:postId/comments

添加评论（需要认证）

**请求**:
```json
{
  "content": "Great article! Thanks for sharing."
}
```

**响应** (201):
```json
{
  "success": true,
  "message": "Comment added successfully",
  "data": {
    "comment": {
      "id": "comm456",
      "content": "Great article! Thanks for sharing.",
      "author": {
        "id": "64abc123def456789",
        "username": "john_doe"
      },
      "post": {
        "id": "64xyz789abc123456",
        "title": "Getting Started with React"
      },
      "createdAt": "2026-01-27T14:00:00.000Z"
    }
  }
}
```

---

## 🧪 测试

### 运行测试

```bash
# 运行所有测试
npm test

# 运行单元测试
npm run test:unit

# 运行集成测试
npm run test:integration

# 生成测试覆盖率报告
npm run test:coverage
```

### 测试覆盖

- ✅ 单元测试：所有模型和服务
- ✅ 集成测试：所有 API 端点
- ✅ E2E 测试：关键用户流程
- ✅ 性能测试：API 响应时间
- ✅ 安全测试：认证和授权

---

## 📦 部署

### Docker 部署

```bash
# 构建镜像
docker-compose build

# 启动服务
docker-compose up -d

# 查看日志
docker-compose logs -f
```

### 手动部署

详见 [部署指南](./docs/deployment.md)

---

## 🔒 安全特性

- ✅ JWT 认证
- ✅ 密码哈希（bcrypt）
- ✅ 输入验证和清理
- ✅ CORS 配置
- ✅ 速率限制
- ✅ XSS 防护
- ✅ SQL 注入防护
- ✅ CSRF 防护

---

## 📈 性能优化

- ✅ 数据库索引优化
- ✅ 查询优化
- ✅ 响应压缩
- ✅ 静态资源缓存
- ✅ 分页和懒加载
- ✅ Redis 缓存（可选）

---

## 🤝 贡献

欢迎贡献！请查看 [贡献指南](../../CONTRIBUTING.md)

---

## 📝 License

MIT License

---

## 🎯 学习要点

通过这个完整示例，您可以学习：

1. ✅ **完整的 Vibe Coding 工作流程**
   - 从需求到部署的完整流程
   - Agent 协作的最佳实践

2. ✅ **真实项目结构**
   - 前后端分离架构
   - RESTful API 设计
   - 数据库设计和建模

3. ✅ **安全性最佳实践**
   - JWT 认证实现
   - 输入验证和清理
   - 常见安全漏洞防护

4. ✅ **测试驱动开发**
   - 单元测试
   - 集成测试
   - E2E 测试

---

## 🚀 下一步

- 📖 学习简化示例: [TODO API](../todo-api/README.md)
- 🎨 学习前端示例: [任务管理 UI](../task-ui/README.md)
- 🎬 观看视频演示: [视频脚本](../../resources/video-demos/demo-scripts.md)

---

**项目类型**: 完整可运行版本
**最后更新**: 2026-01-27
**维护者**: Vibe Coding Team Community
