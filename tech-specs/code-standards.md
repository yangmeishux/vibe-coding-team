# 代码规范 (Code Standards)

> 统一的代码风格和质量标准，确保代码可读性、可维护性和一致性。

---

## 命名规范

### 通用原则

| 类型 | 规范 | 示例 |
|------|------|------|
| 清晰 | 名称应清晰表达用途 | `getUserById` ✅ `getData` ❌ |
| 准确 | 使用准确的术语 | `calculateTotal` ✅ `doMath` ❌ |
| 一致 | 保持命名风格一致 | `getUser`, `getOrder` ✅ |

### 语言特定规范

#### JavaScript / TypeScript

| 类型 | 规范 | 示例 |
|------|------|------|
| 变量 | camelCase | `userName`, `isActive` |
| 常量 | UPPER_SNAKE_CASE | `MAX_RETRY_COUNT` |
| 函数 | camelCase | `getUserById()`, `handleSubmit()` |
| 类 | PascalCase | `UserService`, `OrderController` |
| 接口 | PascalCase | `User`, `OrderDetails` |
| 类型别名 | PascalCase | `UserID`, `OrderStatus` |
| 枚举 | PascalCase | `OrderStatus.PENDING` |
| 私有成员 | _camelCase | `_internalMethod()` |
| 文件 | camelCase | `userService.ts` |
| React 组件 | PascalCase | `UserCard.tsx` |

#### Python

| 类型 | 规范 | 示例 |
|------|------|------|
| 变量 | snake_case | `user_name`, `is_active` |
| 常量 | UPPER_SNAKE_CASE | `MAX_RETRY_COUNT` |
| 函数 | snake_case | `get_user_by_id()`, `handle_submit()` |
| 类 | PascalCase | `UserService`, `OrderController` |
| 私有成员 | _snake_case | `_internal_method()` |
| 文件 | snake_case | `user_service.py` |

#### Go

| 类型 | 规范 | 示例 |
|------|------|------|
| 变量 | camelCase | `userName`, `isActive` |
| 常量 | camelCase | `maxRetryCount` |
| 导出 | PascalCase | `GetUserById()`, `UserService` |
| 未导出 | camelCase | `internalMethod()` |
| 文件 | snake_case | `user_service.go` |
| 包名 | 短命名 | `user`, `order` |

---

## 代码组织

### 文件组织原则

```
相关代码放在一起
├── 按功能组织 > 按类型组织
├── 单一职责原则
└── 避免循环依赖
```

### 项目结构示例

#### 前端项目
```
src/
├── components/          # 组件
│   ├── Button/
│   │   ├── Button.tsx
│   │   ├── Button.test.tsx
│   │   └── Button.module.css
│   └── Card/
├── features/            # 功能模块
│   └── auth/
│       ├── components/
│       ├── hooks/
│       └── services/
├── hooks/               # 全局 hooks
├── services/            # API 服务
├── utils/               # 工具函数
└── types/               # 类型定义
```

#### 后端项目
```
src/
├── controllers/         # 控制器
├── services/            # 业务逻辑
├── repositories/        # 数据访问
├── models/              # 数据模型
├── middleware/          # 中间件
├── utils/               # 工具函数
└── config/              # 配置
```

---

## 代码风格

### 缩进与空格

- 使用 2 个空格缩进
- 不使用 Tab
- 运算符前后加空格
- 逗号后加空格

```typescript
// ✅ 正确
const result = a + b;
const arr = [1, 2, 3];
if (condition) {
  doSomething();
}

// ❌ 错误
const result=a+b;
const arr=[1,2,3];
if(condition){
  doSomething();
}
```

### 行长

- 最大行长度: 100 字符
- 长表达式换行

```typescript
// ✅ 正确
const result = await fetchUserData(userId, {
  includeProfile: true,
  includeOrders: false
});

// ❌ 错误
const result = await fetchUserData(userId, { includeProfile: true, includeOrders: false, cache: true });
```

### 分号

- JavaScript/TypeScript: 使用分号
- 自动分号插入可能导致意外行为

```typescript
// ✅ 正确
const name = 'John';
const age = 30;

// ❌ 错误
const name = 'John'
const age = 30
```

### 引号

- 字符串使用单引号
- HTML 属性使用双引号

```typescript
// ✅ 正确
const name = 'John';
const html = '<div class="container"></div>';

// ❌ 错误
const name = "John";
```

---

## 注释规范

### 注释原则

- 解释"为什么"而非"是什么"
- 注释应简洁明了
- 及时更新注释
- 避免冗余注释

### 文件头注释

```typescript
/**
 * 用户服务
 * 
 * 处理用户相关的业务逻辑，包括：
 * - 用户注册、登录
 * - 用户信息管理
 * - 权限验证
 * 
 * @module services/user
 * @author Vibe Coding Team
 * @since 2026-01-30
 */
```

### 函数注释

```typescript
/**
 * 根据 ID 获取用户信息
 * 
 * @param userId - 用户唯一标识
 * @param options - 查询选项
 * @param options.includeProfile - 是否包含用户资料
 * @returns 用户对象，未找到返回 null
 * @throws DatabaseError 数据库查询失败
 * 
 * @example
 * ```typescript
 * const user = await getUserById('123', { includeProfile: true });
 * if (user) {
 *   console.log(user.name);
 * }
 * ```
 */
async function getUserById(
  userId: string,
  options?: { includeProfile?: boolean }
): Promise<User | null> {
  // 实现
}
```

### 行内注释

```typescript
// ✅ 正确 - 解释为什么
// 使用缓存避免频繁查询数据库
const user = await cache.get(`user:${id}`) || await fetchUser(id);

// ❌ 错误 - 解释是什么
// 获取用户
const user = await getUser(id);
```

---

## TypeScript 规范

### 类型定义

```typescript
// ✅ 正确 - 明确类型
interface User {
  id: string;
  name: string;
  email: string;
  createdAt: Date;
}

// ❌ 错误 - 使用 any
interface User {
  id: any;
  name: any;
}
```

### 函数参数

```typescript
// ✅ 正确 - 使用接口或类型别名
interface CreateUserParams {
  name: string;
  email: string;
  age?: number;
}

function createUser(params: CreateUserParams): User {
  // 实现
}

// ❌ 错误 - 参数过多
function createUser(
  name: string,
  email: string,
  age: number,
  phone: string,
  address: string
): User {
  // 实现
}
```

### 返回值类型

```typescript
// ✅ 正确 - 明确返回值类型
async function getUser(id: string): Promise<User | null> {
  // 实现
}

// ❌ 错误 - 隐式返回类型
async function getUser(id: string) {
  // 实现
}
```

### 枚举 vs 联合类型

```typescript
// ✅ 推荐 - 使用联合类型
 type OrderStatus = 'pending' | 'processing' | 'completed' | 'cancelled';

// 仅在需要时使枚举
 enum OrderStatus {
   PENDING = 'pending',
   PROCESSING = 'processing',
   COMPLETED = 'completed',
   CANCELLED = 'cancelled'
 }
```

---

## 错误处理

### 使用异常而非返回码

```typescript
// ✅ 正确
async function getUser(id: string): Promise<User> {
  const user = await db.users.findById(id);
  if (!user) {
    throw new NotFoundError(`User ${id} not found`);
  }
  return user;
}

// ❌ 错误
async function getUser(id: string): Promise<User | null> {
  const user = await db.users.findById(id);
  return user; // 调用方需要检查 null
}
```

### 错误类型化

```typescript
class AppError extends Error {
  constructor(
    message: string,
    public code: string,
    public statusCode: number
  ) {
    super(message);
    this.name = 'AppError';
  }
}

class NotFoundError extends AppError {
  constructor(resource: string) {
    super(`${resource} not found`, 'NOT_FOUND', 404);
    this.name = 'NotFoundError';
  }
}

class ValidationError extends AppError {
  constructor(message: string) {
    super(message, 'VALIDATION_ERROR', 400);
    this.name = 'ValidationError';
  }
}
```

---

## 函数设计

### 单一职责

```typescript
// ✅ 正确 - 每个函数只做一件事
function validateEmail(email: string): boolean {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}

function createUser(email: string, password: string): Promise<User> {
  // 只负责创建用户
}

// ❌ 错误 - 做多件事
function registerUser(email: string, password: string): Promise<User> {
  // 验证邮箱
  // 检查邮箱是否已存在
  // 创建用户
  // 发送欢迎邮件
  // 记录日志
}
```

### 参数数量

```typescript
// ✅ 正确 - 最多 3 个参数
function createUser(params: CreateUserParams): User;

// ❌ 错误 - 参数过多
function createUser(
  name: string,
  email: string,
  password: string,
  phone: string,
  address: string,
  age: number
): User;
```

### 默认参数

```typescript
// ✅ 正确
function fetchUsers(options: FetchOptions = {}): Promise<User[]> {
  const { page = 1, limit = 20, sort = 'createdAt' } = options;
  // 实现
}

// ❌ 错误
function fetchUsers(page?: number, limit?: number): Promise<User[]> {
  const actualPage = page || 1;
  const actualLimit = limit || 20;
  // 实现
}
```

---

## 最佳实践

### DRY (Don't Repeat Yourself)

```typescript
// ✅ 正确 - 提取公共逻辑
function formatCurrency(amount: number, currency: string = 'CNY'): string {
  return new Intl.NumberFormat('zh-CN', {
    style: 'currency',
    currency
  }).format(amount);
}

// 多处使用
const price1 = formatCurrency(100);
const price2 = formatCurrency(200, 'USD');

// ❌ 错误 - 重复代码
const price1 = new Intl.NumberFormat('zh-CN', {
  style: 'currency',
  currency: 'CNY'
}).format(100);

const price2 = new Intl.NumberFormat('zh-CN', {
  style: 'currency',
  currency: 'CNY'
}).format(200);
```

### 提前返回

```typescript
// ✅ 正确 - 提前返回减少嵌套
function processUser(user: User | null): void {
  if (!user) {
    return;
  }
  
  if (!user.isActive) {
    return;
  }
  
  // 处理逻辑
}

// ❌ 错误 - 深层嵌套
function processUser(user: User | null): void {
  if (user) {
    if (user.isActive) {
      // 处理逻辑
    }
  }
}
```

### 使用常量

```typescript
// ✅ 正确
const MAX_RETRY_ATTEMPTS = 3;
const DEFAULT_PAGE_SIZE = 20;

// ❌ 错误 - 魔法数字
if (attempts > 3) {
  return fetchData(20);
}
```

---

## 代码审查清单

### 提交前自查

- [ ] 代码符合命名规范
- [ ] 无 console.log/debugger
- [ ] 所有测试通过
- [ ] 类型检查通过
- [ ] 无未使用的变量/导入
- [ ] 错误已处理
- [ ] 注释清晰有用

### 代码审查关注

- [ ] 代码是否符合规范
- [ ] 是否遵循单一职责
- [ ] 错误处理是否完善
- [ ] 是否有重复代码
- [ ] 命名是否清晰
- [ ] 测试是否充分

---

**最后更新**: 2026-01-30
