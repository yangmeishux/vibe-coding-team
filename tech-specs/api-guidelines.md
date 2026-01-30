# API 设计规范 (API Guidelines)

> RESTful API 设计最佳实践，确保 API 的一致性、可用性和可维护性。

---

## 设计原则

### 1. 资源导向 (Resource-Oriented)
- 将 API 建模为资源集合
- 使用名词而非动词
- 通过 HTTP 方法表达操作

### 2. 一致性 (Consistency)
- 统一的 URL 结构
- 统一的响应格式
- 统一的错误处理

### 3. 可预测性 (Predictability)
- 符合 REST 约定
- 清晰的命名规范
- 稳定的行为

---

## URL 设计

### 基本结构

```
https://api.example.com/v1/{resource}/{id}/{sub-resource}
```

### 资源命名

| 规范 | ✅ 正确 | ❌ 错误 |
|------|--------|--------|
| 使用名词复数 | `/users` | `/user`, `/getUsers` |
| 小写字母 | `/user-profiles` | `/UserProfiles` |
| 连字符分隔 | `/order-items` | `/orderItems`, `/order_items` |
| 避免动词 | `POST /users` | `/createUser` |

### URL 示例

```
# 用户资源
GET    /api/v1/users              # 列表
GET    /api/v1/users/:id          # 详情
POST   /api/v1/users              # 创建
PUT    /api/v1/users/:id          # 全量更新
PATCH  /api/v1/users/:id          # 部分更新
DELETE /api/v1/users/:id          # 删除

# 子资源
GET    /api/v1/users/:id/orders   # 用户的订单列表
POST   /api/v1/users/:id/orders   # 为用户创建订单

# 动作 (特殊情况)
POST   /api/v1/users/:id/activate # 激活用户
POST   /api/v1/auth/login         # 登录 (非资源操作)
```

---

## HTTP 方法

### 方法语义

| 方法 | 语义 | 幂等性 | 用途 |
|------|------|--------|------|
| GET | 读取 | ✅ | 获取资源 |
| POST | 创建 | ❌ | 新建资源 |
| PUT | 全量更新 | ✅ | 替换整个资源 |
| PATCH | 部分更新 | ❌ | 修改部分字段 |
| DELETE | 删除 | ✅ | 删除资源 |

### 使用规范

#### GET - 获取资源
```
GET /api/v1/users?page=1&limit=20
GET /api/v1/users/123
GET /api/v1/users?status=active&role=admin
```

**约束:**
- 不修改服务器状态
- 支持缓存
- 可被浏览器预加载

#### POST - 创建资源
```
POST /api/v1/users
Content-Type: application/json

{
  "name": "张三",
  "email": "zhangsan@example.com"
}
```

**响应:**
- 201 Created
- Location 头指向新资源

#### PUT - 全量更新
```
PUT /api/v1/users/123
Content-Type: application/json

{
  "id": "123",
  "name": "张三",
  "email": "zhangsan@example.com",
  "status": "active"
}
```

**注意:** 必须包含资源的完整表示

#### PATCH - 部分更新
```
PATCH /api/v1/users/123
Content-Type: application/json

{
  "email": "newemail@example.com"
}
```

**适用场景:**
- 只更新部分字段
- 大资源的增量更新

#### DELETE - 删除资源
```
DELETE /api/v1/users/123
```

**响应:**
- 200 OK (返回被删除资源)
- 204 No Content (无返回体)

---

## 响应格式

### 成功响应

#### 标准格式
```json
{
  "success": true,
  "data": { ... },
  "meta": {
    "timestamp": "2026-01-30T10:00:00Z",
    "requestId": "req_123456"
  }
}
```

#### 列表响应
```json
{
  "success": true,
  "data": [
    { "id": "1", "name": "张三" },
    { "id": "2", "name": "李四" }
  ],
  "meta": {
    "page": 1,
    "pageSize": 20,
    "total": 100,
    "totalPages": 5,
    "hasNext": true,
    "hasPrev": false
  }
}
```

#### 单条数据响应
```json
{
  "success": true,
  "data": {
    "id": "123",
    "name": "张三",
    "email": "zhangsan@example.com",
    "createdAt": "2026-01-30T10:00:00Z",
    "updatedAt": "2026-01-30T10:00:00Z"
  }
}
```

### 错误响应

#### 标准格式
```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "输入验证失败",
    "details": [
      {
        "field": "email",
        "message": "邮箱格式不正确",
        "code": "INVALID_EMAIL"
      }
    ]
  },
  "meta": {
    "timestamp": "2026-01-30T10:00:00Z",
    "requestId": "req_123456"
  }
}
```

#### 错误类型

| HTTP 状态 | 错误码 | 场景 |
|-----------|--------|------|
| 400 | BAD_REQUEST | 请求格式错误 |
| 400 | VALIDATION_ERROR | 参数验证失败 |
| 401 | UNAUTHORIZED | 未认证 |
| 403 | FORBIDDEN | 无权限 |
| 404 | NOT_FOUND | 资源不存在 |
| 409 | CONFLICT | 资源冲突 |
| 422 | UNPROCESSABLE_ENTITY | 业务逻辑错误 |
| 429 | TOO_MANY_REQUESTS | 请求频率限制 |
| 500 | INTERNAL_SERVER_ERROR | 服务器内部错误 |
| 503 | SERVICE_UNAVAILABLE | 服务不可用 |

---

## HTTP 状态码

### 2xx - 成功

| 状态码 | 使用场景 | 响应体 |
|--------|---------|--------|
| 200 OK | GET, PUT, PATCH 成功 | 资源数据 |
| 201 Created | POST 创建成功 | 新资源 |
| 204 No Content | DELETE 成功, PUT/PATCH 无返回 | 空 |

### 3xx - 重定向

| 状态码 | 使用场景 |
|--------|---------|
| 301 Moved Permanently | 永久重定向 |
| 304 Not Modified | 缓存有效 |

### 4xx - 客户端错误

| 状态码 | 使用场景 |
|--------|---------|
| 400 Bad Request | 请求格式错误 |
| 401 Unauthorized | 缺少认证信息 |
| 403 Forbidden | 权限不足 |
| 404 Not Found | 资源不存在 |
| 409 Conflict | 资源冲突 (如重复创建) |
| 422 Unprocessable Entity | 验证失败 |
| 429 Too Many Requests | 频率限制 |

### 5xx - 服务器错误

| 状态码 | 使用场景 |
|--------|---------|
| 500 Internal Server Error | 服务器内部错误 |
| 502 Bad Gateway | 网关错误 |
| 503 Service Unavailable | 服务不可用 |
| 504 Gateway Timeout | 网关超时 |

---

## 查询参数

### 分页

```
GET /api/v1/users?page=1&pageSize=20
GET /api/v1/users?offset=0&limit=20
```

**响应:**
```json
{
  "data": [...],
  "meta": {
    "page": 1,
    "pageSize": 20,
    "total": 100,
    "totalPages": 5
  }
}
```

### 过滤

```
GET /api/v1/users?status=active&role=admin
GET /api/v1/users?createdAt[gte]=2026-01-01
GET /api/v1/users?name[like]=张
```

**操作符:**
- `[eq]`: 等于 (默认)
- `[ne]`: 不等于
- `[gt]`: 大于
- `[gte]`: 大于等于
- `[lt]`: 小于
- `[lte]`: 小于等于
- `[like]`: 模糊匹配
- `[in]`: 在列表中

### 排序

```
GET /api/v1/users?sort=-createdAt,name
```

**说明:**
- `createdAt`: 升序
- `-createdAt`: 降序
- 多字段用逗号分隔

### 字段选择

```
GET /api/v1/users?fields=id,name,email
```

---

## 请求/响应规范

### Content-Type

**请求:**
- `Content-Type: application/json` (默认)
- `Content-Type: multipart/form-data` (文件上传)

**响应:**
- `Content-Type: application/json` (默认)
- `Content-Type: text/csv` (CSV 导出)

### 日期格式

使用 ISO 8601 格式:
```
2026-01-30T10:30:00Z
2026-01-30T10:30:00+08:00
```

### 字段命名

| 位置 | 格式 | 示例 |
|------|------|------|
| URL | snake_case | `/user_profiles` |
| JSON | camelCase | `userProfile` |
| 查询参数 | snake_case | `created_at` |

---

## 认证与安全

### 认证方式

#### Bearer Token
```
Authorization: Bearer <jwt_token>
```

#### API Key
```
X-API-Key: <api_key>
```

### 安全措施

- 强制 HTTPS
- 请求频率限制
- CORS 配置
- 输入验证
- SQL 注入防护
- XSS 防护

---

## 版本控制

### URL 版本
```
/api/v1/users
/api/v2/users
```

### 版本策略

| 变更类型 | 处理方式 |
|---------|---------|
| 新增字段 | 当前版本 |
| 新增端点 | 当前版本 |
| 废弃字段 | 当前版本 + 标记 |
| 变更行为 | 新版本 |
| 删除端点 | 新版本 |

---

## API 文档

### OpenAPI 规范

使用 OpenAPI 3.0 自动生成文档:

```yaml
openapi: 3.0.0
info:
  title: User API
  version: 1.0.0

paths:
  /users:
    get:
      summary: 获取用户列表
      parameters:
        - name: page
          in: query
          schema:
            type: integer
            default: 1
      responses:
        200:
          description: 成功
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/UserList'
```

---

**最后更新**: 2026-01-30
