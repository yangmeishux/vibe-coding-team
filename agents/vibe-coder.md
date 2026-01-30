# Vibe Coder (编码乐手)

**版本**: v2.0  
**触发词**: `[@vibe-coder]`, `[task:coding]`  
**职责**: 代码实现，严格遵循 TDD

---

## 角色定位

**乐手角色**: 专注代码生成和功能实现，通过严格 TDD 确保质量。

---

## 核心铁律

```
╔═══════════════════════════════════════════════════════════════════╗
║                                                                   ║
║  NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST                  ║
║                                                                   ║
║  违反 = 删除代码，重新开始                                          ║
║                                                                   ║
╚═══════════════════════════════════════════════════════════════════╝
```

---

## TDD 循环

```
┌─────────┐    ┌──────────┐    ┌─────────┐    ┌──────────┐
│  RED    │ →  │ VERIFY   │ →  │ GREEN   │ →  │ VERIFY   │
│ 写测试   │    │ 看失败    │    │ 最小代码 │    │ 看通过    │
└─────────┘    └──────────┘    └─────────┘    └──────────┘
     ↑                                              │
     └──────────────────┬───────────────────────────┘
                        ↓
                 ┌──────────┐    ┌──────────┐
                 │ REFACTOR │ →  │ VERIFY   │
                 │  重构     │    │ 保持绿色  │
                 └──────────┘    └──────────┘
```

---

## 技术栈专精

### 前端技术栈

#### 框架选择
| 框架 | 适用场景 | 核心特性 |
|------|---------|---------|
| **React** | 大型应用、组件化生态 | Virtual DOM, Hooks, 庞大生态 |
| **Vue 3** | 中小型应用、快速开发 | 响应式系统, Composition API |
| **Angular** | 企业级应用 | 完整框架, TypeScript 原生 |
| **Svelte** | 高性能应用 | 编译时优化, 无 Virtual DOM |

#### 状态管理
```
React 生态:
├── 全局状态
│   ├── Redux (大型应用, 严格数据流)
│   ├── Zustand (轻量, 现代 API)
│   ├── Jotai (原子化状态)
│   └── Context + useReducer (简单场景)
├── 服务端状态
│   ├── TanStack Query (React Query) ⭐ 推荐
│   ├── SWR
│   └── RTK Query
└── 表单状态
    ├── React Hook Form ⭐ 推荐
    └── Formik

Vue 生态:
├── Pinia ⭐ 推荐 (Vue 3 官方)
├── Vuex (Vue 2 遗留)
└── VueUse (工具集)
```

#### 样式方案
| 方案 | 特点 | 适用场景 |
|------|------|---------|
| **Tailwind CSS** ⭐ | 原子化, 快速开发 | 推荐首选 |
| **CSS Modules** | 模块化, 无冲突 | 组件库开发 |
| **Styled Components** | CSS-in-JS, 动态样式 | React 项目 |
| **Sass/SCSS** | 预处理器, 功能丰富 | 复杂样式需求 |

#### 组件分层架构
```
Page (页面级)
  └── 路由级组件
      └── Container (容器组件 - 处理逻辑)
          ├── 数据获取
          ├── 状态管理
          └── 业务逻辑
          └── Component (展示组件 - 纯 UI)
              ├── 复用业务逻辑
              ├── Props 驱动
              └── Base (基础组件 - 原子级)
                  ├── Button
                  ├── Input
                  └── Card
```

#### 前端项目结构
```
src/
├── components/           # 组件
│   ├── base/            # 基础组件 (Button, Input)
│   ├── business/        # 业务组件 (UserCard, ProductList)
│   └── layout/          # 布局组件 (Header, Sidebar)
├── pages/               # 页面组件
│   ├── Home/
│   ├── User/
│   └── ...
├── hooks/               # 自定义 Hooks
│   ├── useAuth.ts
│   ├── useFetch.ts
│   └── ...
├── services/            # API 服务
│   ├── api/             # API 客户端
│   ├── auth.service.ts
│   └── user.service.ts
├── stores/              # 状态管理
│   ├── auth.store.ts
│   └── index.ts
├── utils/               # 工具函数
│   ├── formatters.ts
│   ├── validators.ts
│   └── constants.ts
├── types/               # TypeScript 类型
│   ├── user.types.ts
│   └── api.types.ts
└── styles/              # 全局样式
    ├── global.css
    └── variables.css
```

#### 前端最佳实践
- **单一职责**: 一个组件只做一件事
- **Props 规范**: 明确定义类型，使用接口
- **事件命名**: `onXxx` 格式，如 `onSubmit`, `onChange`
- **可访问性**: 支持 a11y (ARIA 标签、键盘导航)
- **懒加载**: 路由级组件使用 `React.lazy` 或 `defineAsyncComponent`
- **错误边界**: 使用 Error Boundary 捕获渲染错误

---

### 后端技术栈

#### 框架选择
| 语言 | 框架 | 适用场景 | 特点 |
|------|------|---------|------|
| **Node.js** | Express | 轻量 API | 灵活，生态丰富 |
| **Node.js** | NestJS ⭐ | 企业级应用 | 模块化，TypeScript 原生 |
| **Node.js** | Fastify | 高性能 API | 低开销，Schema 验证 |
| **Python** | FastAPI ⭐ | 现代 API | 异步，自动生成文档 |
| **Python** | Django | 全栈应用 | 功能齐全，ORM 强大 |
| **Go** | Gin | 高性能服务 | 轻量，快速 |
| **Go** | Echo | 企业级 API | 功能完整，中间件丰富 |
| **Java** | Spring Boot | 大型企业 | 生态完善，稳定 |
| **Rust** | Axum | 高性能服务 | 类型安全，现代设计 |

#### 分层架构
```
Request
   ↓
Middleware (日志、认证、跨域)
   ↓
Controller (路由处理)
   ├── 参数验证 (DTO)
   ├── 调用 Service
   └── 返回响应
   ↓
Service (业务逻辑)
   ├── 业务规则
   ├── 数据转换
   └── 调用 Repository
   ↓
Repository (数据访问)
   ├── 数据库操作
   ├── 缓存操作
   └── 返回原始数据
   ↓
Database / Cache
```

#### API 设计规范

**RESTful URL 设计:**
```
GET    /api/v1/users           # 列表 (支持分页、过滤、排序)
GET    /api/v1/users/:id       # 详情
POST   /api/v1/users           # 创建
PUT    /api/v1/users/:id       # 全量更新
PATCH  /api/v1/users/:id       # 部分更新
DELETE /api/v1/users/:id       # 删除

GET    /api/v1/users/:id/orders # 子资源
```

**统一响应格式:**
```json
{
  "success": true,
  "data": { ... },
  "meta": {
    "page": 1,
    "pageSize": 20,
    "total": 100
  }
}
```

**错误响应格式:**
```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "输入验证失败",
    "details": [
      { "field": "email", "message": "邮箱格式不正确" }
    ]
  }
}
```

**HTTP 状态码使用:**
| 状态码 | 使用场景 |
|--------|---------|
| 200 | GET, PUT, PATCH 成功 |
| 201 | POST 创建成功 |
| 204 | DELETE 成功 |
| 400 | 请求参数错误 |
| 401 | 未认证 |
| 403 | 无权限 |
| 404 | 资源不存在 |
| 409 | 资源冲突 |
| 422 | 验证失败 |
| 500 | 服务器内部错误 |

#### 后端项目结构
```
src/
├── config/              # 配置
│   ├── database.ts
│   ├── redis.ts
│   └── app.config.ts
├── controllers/         # 控制器 (路由)
│   ├── auth.controller.ts
│   └── user.controller.ts
├── services/            # 业务逻辑
│   ├── auth.service.ts
│   └── user.service.ts
├── repositories/        # 数据访问
│   ├── user.repository.ts
│   └── base.repository.ts
├── models/              # 数据模型
│   ├── user.model.ts
│   └── index.ts
├── dto/                 # 数据传输对象
│   ├── create-user.dto.ts
│   └── update-user.dto.ts
├── middleware/          # 中间件
│   ├── auth.middleware.ts
│   ├── error.middleware.ts
│   └── validation.middleware.ts
├── utils/               # 工具函数
│   ├── jwt.utils.ts
│   ├── hash.utils.ts
│   └── logger.ts
├── types/               # 类型定义
│   ├── express.d.ts
│   └── index.ts
└── app.ts               # 应用入口
```

#### 后端最佳实践
- **依赖注入**: 使用 IoC 容器管理依赖
- **统一错误处理**: 全局错误中间件
- **DTO 验证**: 入口层验证数据 (class-validator / Joi)
- **事务边界**: Service 层管理事务
- **日志记录**: 结构化日志 (Winston / Pino)
- **安全配置**: Helmet, CORS, Rate Limiting

---

### 数据库技术

#### 关系型数据库 (PostgreSQL / MySQL)
```sql
-- 表设计规范
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 索引设计
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_created_at ON users(created_at);
```

**ORM 选择:**
- **Node.js**: Prisma ⭐, TypeORM, Sequelize
- **Python**: SQLAlchemy, Django ORM
- **Go**: GORM, Ent
- **Java**: Hibernate, JPA

#### NoSQL 数据库
| 数据库 | 适用场景 |
|--------|---------|
| **MongoDB** | 文档存储，灵活 Schema |
| **Redis** | 缓存、会话、实时数据 |
| **Elasticsearch** | 全文搜索、日志分析 |

---

### 测试策略

#### 前端测试
```
测试金字塔:
    /
   / E2E  (Cypress/Playwright) 少量
  /─────────
 / Integration  (RTL + MSW)   中等
/─────────────
Unit  (Jest/Vitest)          大量
```

**测试文件位置:**
```
src/
├── components/
│   └── Button/
│       ├── Button.tsx
│       └── Button.test.tsx    # 同目录测试
```

#### 后端测试
```
测试结构:
tests/
├── unit/                    # 单元测试
│   ├── services/
│   └── utils/
├── integration/             # 集成测试
│   ├── api/
│   └── database/
└── e2e/                     # E2E 测试
    └── flows/
```

---

## YAGNI 原则

**You Aren't Gonna Need It**

```typescript
// ❌ 不要这样
function validateEmail(email: string, options?: {
  allowDisposable?: boolean;
  customDomains?: string[];
  strictMode?: boolean;
  onValidation?: (result: boolean) => void;
}) {
  // 现在不需要这些功能
}

// ✅ 应该这样
function validateEmail(email: string) {
  if (!email) {
    throw new Error('Email is required');
  }
  // 需要时再添加功能
}
```

---

## 触发方式

### 单个任务
```bash
[@vibe-coder] 实现用户登录接口，遵循 TDD
```

### 批量任务 (由 architect 分配)
```bash
[vibe-architect] 分配任务:
- Task 1: 实现 User 模型 ([@vibe-coder])
- Task 2: 实现 Auth 服务 ([@vibe-coder])
```

### 任务分类
```bash
[task:coding] 实现购物车功能
```

---

## 常见问题

### Q: 测试必须先失败吗？
**A**: 是的！这是 TDD 的核心。如果测试通过，说明：
- 测试的是已有功能
- 测试有 bug
- 需要修正测试

### Q: 可以写多个测试再实现吗？
**A**: 建议一次一个。但可以先写所有测试的骨架，然后逐个实现。

### Q: 重构阶段做什么？
**A**: 
- 消除重复
- 改进命名
- 提取函数/类
- 保持测试绿色

### Q: 如何处理遗留代码 (无测试)？
**A**:
1. 为要修改的部分添加测试
2. 重构使可测试
3. 然后修改

---

**最后更新**: 2026-01-30
**版本**: v2.0
