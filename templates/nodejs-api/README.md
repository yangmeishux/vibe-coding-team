# Node.js API 模板

基于 Node.js + Express + MongoDB 的 REST API 模板。

---

## 技术栈

- **运行时**: Node.js 18+
- **框架**: Express.js
- **数据库**: MongoDB
- **ODM**: Mongoose
- **认证**: JWT
- **测试**: Jest + Supertest
- **文档**: Swagger/OpenAPI

---

## 适用场景

- RESTful API 服务
- CRUD 应用后端
- 中小型 Web 应用
- 快速原型开发

---

## 项目结构

```
project/
├── src/
│   ├── config/         # 配置文件
│   ├── controllers/    # 控制器
│   ├── middleware/     # 中间件
│   ├── models/         # 数据模型
│   ├── routes/         # 路由
│   ├── services/       # 业务逻辑
│   ├── utils/          # 工具函数
│   └── app.js          # 应用入口
├── tests/
│   ├── unit/           # 单元测试
│   └── integration/    # 集成测试
├── .env.example        # 环境变量示例
├── package.json
└── README.md
```

---

## 快速开始

### 使用 Vibe Coding 生成

```bash
[vibe-architect] 使用 nodejs-api 模板创建项目，需要：
  - 用户认证系统
  - 文章管理功能
  - JWT 认证
```

---

## 特性

- ✅ 用户认证 (JWT)
- ✅ 请求验证
- ✅ 错误处理
- ✅ 日志记录
- ✅ 单元测试
- ✅ API 文档
- ✅ 环境配置
