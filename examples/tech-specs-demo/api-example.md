# API 规范实施示例

> 展示如何设计和实现符合 RESTful 规范的 API

---

## API 概览

**基础 URL:** `https://api.example.com/v1`

**认证方式:** Bearer Token
```
Authorization: Bearer <jwt_token>
```

---

## 用户管理 API

### 获取用户列表

```http
GET /api/v1/users?page=1&pageSize=20&status=active
```

**请求参数:**
| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| page | integer | 否 | 页码，默认 1 |
| pageSize | integer | 否 | 每页数量，默认 20 |
| status | string | 否 | 过滤状态: active, inactive |
| sort | string | 否 | 排序字段，默认 -createdAt |

**成功响应 (200):**
```json
{
  "success": true,
  "data": [
    {
      "id": "550e8400-e29b-41d4-a716-446655440000",
      "name": "张三",
      "email": "zhangsan@example.com",
      "status": "active",
      "createdAt": "2026-01-30T10:00:00Z",
      "updatedAt": "2026-01-30T10:00:00Z"
    }
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

---

### 获取用户详情

```http
GET /api/v1/users/:id
```

**路径参数:**
| 参数 | 类型 | 说明 |
|------|------|------|
| id | UUID | 用户唯一标识 |

**成功响应 (200):**
```json
{
  "success": true,
  "data": {
    "id": "550e8400-e29b-41d4-a716-446655440000",
    "name": "张三",
    "email": "zhangsan@example.com",
    "avatar": "https://cdn.example.com/avatars/xxx.jpg",
    "status": "active",
    "createdAt": "2026-01-30T10:00:00Z",
    "updatedAt": "2026-01-30T10:00:00Z"
  }
}
```

**错误响应 (404):**
```json
{
  "success": false,
  "error": {
    "code": "NOT_FOUND",
    "message": "User not found"
  }
}
```

---

### 创建用户

```http
POST /api/v1/users
Content-Type: application/json

{
  "name": "张三",
  "email": "zhangsan@example.com",
  "password": "password123"
}
```

**请求体验证:**
| 字段 | 类型 | 必需 | 规则 |
|------|------|------|------|
| name | string | 是 | 2-50 字符 |
| email | string | 是 | 有效邮箱格式 |
| password | string | 是 | 8-100 字符，至少包含字母和数字 |

**成功响应 (201):**
```json
{
  "success": true,
  "data": {
    "id": "550e8400-e29b-41d4-a716-446655440000",
    "name": "张三",
    "email": "zhangsan@example.com",
    "status": "active",
    "createdAt": "2026-01-30T10:00:00Z"
  }
}
```

**错误响应 (400):**
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
      },
      {
        "field": "password",
        "message": "密码长度至少8位",
        "code": "PASSWORD_TOO_SHORT"
      }
    ]
  }
}
```

**错误响应 (409):**
```json
{
  "success": false,
  "error": {
    "code": "CONFLICT",
    "message": "邮箱已被注册"
  }
}
```

---

### 更新用户

```http
PATCH /api/v1/users/:id
Content-Type: application/json

{
  "name": "张三丰",
  "avatar": "https://cdn.example.com/avatars/new.jpg"
}
```

**说明:** 部分更新，只提供需要修改的字段

**成功响应 (200):**
```json
{
  "success": true,
  "data": {
    "id": "550e8400-e29b-41d4-a716-446655440000",
    "name": "张三丰",
    "email": "zhangsan@example.com",
    "avatar": "https://cdn.example.com/avatars/new.jpg",
    "updatedAt": "2026-01-30T11:00:00Z"
  }
}
```

---

### 删除用户

```http
DELETE /api/v1/users/:id
```

**成功响应 (204):**
无响应体

---

## 认证 API

### 登录

```http
POST /api/v1/auth/login
Content-Type: application/json

{
  "email": "zhangsan@example.com",
  "password": "password123"
}
```

**成功响应 (200):**
```json
{
  "success": true,
  "data": {
    "accessToken": "eyJhbGciOiJIUzI1NiIs...",
    "refreshToken": "eyJhbGciOiJIUzI1NiIs...",
    "expiresIn": 900,
    "user": {
      "id": "550e8400-e29b-41d4-a716-446655440000",
      "name": "张三",
      "email": "zhangsan@example.com"
    }
  }
}
```

**错误响应 (401):**
```json
{
  "success": false,
  "error": {
    "code": "INVALID_CREDENTIALS",
    "message": "邮箱或密码错误"
  }
}
```

---

## 后端实现示例

```typescript
// controllers/user.controller.ts
import { Request, Response } from 'express';
import { UserService } from '../services/user.service';
import { CreateUserDto } from '../dto/create-user.dto';
import { UpdateUserDto } from '../dto/update-user.dto';

export class UserController {
  constructor(private userService: UserService) {}

  async list(req: Request, res: Response) {
    const { page = 1, pageSize = 20, status, sort = '-createdAt' } = req.query;
    
    const result = await this.userService.findAll({
      page: Number(page),
      pageSize: Number(pageSize),
      status: status as string,
      sort: sort as string,
    });

    res.json({
      success: true,
      data: result.data,
      meta: {
        page: result.page,
        pageSize: result.pageSize,
        total: result.total,
        totalPages: Math.ceil(result.total / result.pageSize),
        hasNext: result.page < Math.ceil(result.total / result.pageSize),
        hasPrev: result.page > 1,
      },
    });
  }

  async getById(req: Request, res: Response) {
    const user = await this.userService.findById(req.params.id);
    
    if (!user) {
      return res.status(404).json({
        success: false,
        error: {
          code: 'NOT_FOUND',
          message: 'User not found',
        },
      });
    }

    res.json({
      success: true,
      data: user,
    });
  }

  async create(req: Request, res: Response) {
    try {
      const dto = CreateUserDto.parse(req.body);
      const user = await this.userService.create(dto);
      
      res.status(201).json({
        success: true,
        data: user,
      });
    } catch (error) {
      if (error.code === 'DUPLICATE_EMAIL') {
        return res.status(409).json({
          success: false,
          error: {
            code: 'CONFLICT',
            message: '邮箱已被注册',
          },
        });
      }
      throw error;
    }
  }

  async update(req: Request, res: Response) {
    const dto = UpdateUserDto.parse(req.body);
    const user = await this.userService.update(req.params.id, dto);
    
    res.json({
      success: true,
      data: user,
    });
  }

  async delete(req: Request, res: Response) {
    await this.userService.delete(req.params.id);
    res.status(204).send();
  }
}
```

---

## 路由配置

```typescript
// routes/user.routes.ts
import { Router } from 'express';
import { UserController } from '../controllers/user.controller';
import { authenticate, requireRole } from '../middleware/auth.middleware';
import { validate } from '../middleware/validation.middleware';

const router = Router();
const controller = new UserController();

// 公开路由
router.get('/', controller.list.bind(controller));
router.get('/:id', controller.getById.bind(controller));

// 需要认证
router.post(
  '/',
  authenticate,
  requireRole('admin'),
  validate(CreateUserDto),
  controller.create.bind(controller)
);

router.patch(
  '/:id',
  authenticate,
  validate(UpdateUserDto),
  controller.update.bind(controller)
);

router.delete(
  '/:id',
  authenticate,
  requireRole('admin'),
  controller.delete.bind(controller)
);

export default router;
```

---

## 错误处理中间件

```typescript
// middleware/error.middleware.ts
import { Request, Response, NextFunction } from 'express';
import { AppError } from '../errors/app.error';

export function errorHandler(
  err: Error,
  req: Request,
  res: Response,
  next: NextFunction
) {
  // 自定义应用错误
  if (err instanceof AppError) {
    return res.status(err.statusCode).json({
      success: false,
      error: {
        code: err.code,
        message: err.message,
        details: err.details,
      },
      meta: {
        timestamp: new Date().toISOString(),
        requestId: req.id,
      },
    });
  }

  // 未知错误
  console.error('Unexpected error:', err);
  res.status(500).json({
    success: false,
    error: {
      code: 'INTERNAL_SERVER_ERROR',
      message: '服务器内部错误',
    },
    meta: {
      timestamp: new Date().toISOString(),
      requestId: req.id,
    },
  });
}
```

---

## API 检查清单

### URL 设计
- [ ] 使用名词复数 (`/users`)
- [ ] 小写和下划线分隔
- [ ] 避免动词，使用 HTTP 方法

### 响应格式
- [ ] 统一的成功响应格式
- [ ] 统一的错误响应格式
- [ ] 包含元数据 (分页、时间戳等)

### HTTP 状态码
- [ ] 200 用于 GET/PUT/PATCH 成功
- [ ] 201 用于 POST 创建成功
- [ ] 204 用于 DELETE 成功
- [ ] 400 用于请求参数错误
- [ ] 401 用于未认证
- [ ] 403 用于无权限
- [ ] 404 用于资源不存在
- [ ] 409 用于资源冲突
- [ ] 422 用于验证失败

### 安全性
- [ ] 使用 HTTPS
- [ ] 认证令牌在 Header 中
- [ ] 输入验证
- [ ] 输出编码

---

**参考**: [API 规范](../../tech-specs/api-guidelines.md)
