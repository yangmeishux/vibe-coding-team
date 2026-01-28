# Python FastAPI 模板

基于 Python + FastAPI + PostgreSQL 的高性能 API 模板。

---

## 技术栈

- **语言**: Python 3.9+
- **框架**: FastAPI
- **数据库**: PostgreSQL
- **ORM**: SQLAlchemy
- **迁移**: Alembic
- **认证**: JWT (fastapi-users)
- **测试**: pytest
- **文档**: 自动生成 OpenAPI

---

## 适用场景

- 高性能 API 服务
- 异步处理场景
- 机器学习模型部署
- 数据密集型应用

---

## 项目结构

```
project/
├── app/
│   ├── api/            # API 路由
│   ├── core/           # 核心配置
│   ├── db/             # 数据库
│   ├── models/         # 数据模型
│   ├── schemas/        # Pydantic 模型
│   ├── services/       # 业务逻辑
│   └── main.py         # 应用入口
├── tests/
│   ├── unit/
│   └── integration/
├── alembic/            # 迁移文件
├── requirements.txt
└── README.md
```

---

## 快速开始

### 使用 Vibe Coding 生成

```bash
[vibe-architect] 使用 python-fastapi 模板创建项目，需要：
  - 异步任务处理
  - WebSocket 支持
  - 数据库迁移
```

---

## 特性

- ✅ 异步支持
- ✅ 自动 API 文档
- ✅ 数据验证
- ✅ 依赖注入
- ✅ 数据库迁移
- ✅ 后台任务
- ✅ WebSocket 支持
