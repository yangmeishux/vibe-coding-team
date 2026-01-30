# 测试规范 (Testing Guidelines)

> 测试策略、方法和最佳实践，确保代码质量和可维护性。

---

## 测试原则

### 1. 自动化优先
- 所有测试自动运行
- CI/CD 集成
- 快速反馈

### 2. 测试金字塔
```
    /\
   /  \  E2E 测试 (少量)
  /----\
 /      \ 集成测试 (中等)
/--------\
/          \ 单元测试 (大量)
/------------\
```

### 3. TDD 流程
```
RED: 写失败的测试 → GREEN: 写最小代码 → REFACTOR: 重构
```

---

## 测试类型

### 单元测试 (Unit Tests)

**范围:** 单个函数/类
**目标:** 验证业务逻辑
**工具:** Jest, Vitest, pytest

```typescript
// ✅ 好的单元测试
describe('calculateTotal', () => {
  test('should calculate total with tax', () => {
    const result = calculateTotal({
      items: [{ price: 100, quantity: 2 }],
      taxRate: 0.1
    });
    expect(result).toBe(220); // (100 * 2) * 1.1
  });

  test('should handle empty cart', () => {
    const result = calculateTotal({ items: [], taxRate: 0.1 });
    expect(result).toBe(0);
  });

  test('should throw error for negative price', () => {
    expect(() => calculateTotal({
      items: [{ price: -100, quantity: 1 }],
      taxRate: 0.1
    })).toThrow('Price cannot be negative');
  });
});
```

**原则:**
- 测试行为而非实现
- 一个测试一个断言
- 避免测试私有方法

### 集成测试 (Integration Tests)

**范围:** 多个模块交互
**目标:** 验证接口契约
**工具:** Supertest, React Testing Library

```typescript
// API 集成测试
describe('POST /api/users', () => {
  test('should create user successfully', async () => {
    const response = await request(app)
      .post('/api/users')
      .send({
        name: '张三',
        email: 'zhangsan@example.com'
      })
      .expect(201);

    expect(response.body.data).toMatchObject({
      name: '张三',
      email: 'zhangsan@example.com'
    });

    // 验证数据库
    const user = await db.users.findById(response.body.data.id);
    expect(user).toBeDefined();
  });

  test('should return 400 for invalid email', async () => {
    await request(app)
      .post('/api/users')
      .send({
        name: '张三',
        email: 'invalid-email'
      })
      .expect(400);
  });
});
```

### E2E 测试 (End-to-End Tests)

**范围:** 完整用户流程
**目标:** 验证业务场景
**工具:** Cypress, Playwright

```typescript
// E2E 测试
describe('User Registration Flow', () => {
  test('user can register and login', async ({ page }) => {
    // 注册
    await page.goto('/register');
    await page.fill('[name="email"]', 'test@example.com');
    await page.fill('[name="password"]', 'password123');
    await page.click('button[type="submit"]');
    
    await expect(page).toHaveURL('/login');
    await expect(page.locator('.success-message')).toBeVisible();

    // 登录
    await page.fill('[name="email"]', 'test@example.com');
    await page.fill('[name="password"]', 'password123');
    await page.click('button[type="submit"]');
    
    await expect(page).toHaveURL('/dashboard');
  });
});
```

---

## TDD 最佳实践

### RED 阶段

```typescript
// 1. 写一个失败的测试
test('should calculate discount for premium users', () => {
  const result = calculateDiscount({
    amount: 100,
    userType: 'premium'
  });
  expect(result).toBe(20); // 20% 折扣
});

// 运行测试，确认失败
// Expected: 20, Received: undefined
```

### GREEN 阶段

```typescript
// 2. 写最小代码通过测试
function calculateDiscount({ amount, userType }: DiscountParams): number {
  if (userType === 'premium') {
    return amount * 0.2;
  }
  return 0;
}

// 运行测试，确认通过
```

### REFACTOR 阶段

```typescript
// 3. 重构，保持测试绿色
const DISCOUNTS = {
  premium: 0.2,
  gold: 0.15,
  silver: 0.1
};

function calculateDiscount({ amount, userType }: DiscountParams): number {
  const rate = DISCOUNTS[userType] || 0;
  return amount * rate;
}
```

---

## 测试文件组织

### 位置策略

```
# 同目录策略 (推荐)
src/
├── components/
│   └── Button/
│       ├── Button.tsx
│       └── Button.test.tsx

# 独立目录策略
src/
├── components/
│   └── Button.tsx
└── tests/
    └── components/
        └── Button.test.tsx
```

### 命名规范

| 类型 | 命名 | 示例 |
|------|------|------|
| 单元测试 | `*.test.ts` | `utils.test.ts` |
| 集成测试 | `*.integration.test.ts` | `api.integration.test.ts` |
| E2E 测试 | `*.e2e.ts` | `login.e2e.ts` |

---

## Mock 和 Stub

### 何时使用 Mock

```typescript
// ✅ 正确 - 外部依赖
jest.mock('../services/email', () => ({
  sendEmail: jest.fn().mockResolvedValue(undefined)
}));

// ✅ 正确 - 当前时间
jest.useFakeTimers().setSystemTime(new Date('2026-01-30'));

// ❌ 错误 - Mock 测试逻辑
const mockCalculate = jest.fn();
// 不要 mock 被测函数
```

### Mock 最佳实践

```typescript
// 使用 MSW (Mock Service Worker) 模拟 API
import { rest } from 'msw';
import { setupServer } from 'msw/node';

const server = setupServer(
  rest.get('/api/user', (req, res, ctx) => {
    return res(ctx.json({ id: '1', name: 'Test' }));
  })
);

beforeAll(() => server.listen());
afterEach(() => server.resetHandlers());
afterAll(() => server.close());
```

---

## 覆盖率目标

| 类型 | 目标 | 必须达到 |
|------|------|---------|
| 行覆盖率 | 80% | 70% |
| 函数覆盖率 | 80% | 70% |
| 分支覆盖率 | 70% | 60% |

### 覆盖率配置

```json
{
  "coverageThreshold": {
    "global": {
      "branches": 70,
      "functions": 80,
      "lines": 80,
      "statements": 80
    }
  }
}
```

---

## 测试数据管理

### Fixture

```typescript
// fixtures/users.ts
export const mockUser = {
  id: '1',
  name: '张三',
  email: 'zhangsan@example.com',
  createdAt: new Date('2026-01-30')
};

export const mockUsers = [
  mockUser,
  { id: '2', name: '李四', email: 'lisi@example.com', createdAt: new Date() }
];
```

### 工厂函数

```typescript
// factories/user.ts
import { faker } from '@faker-js/faker';

export function createUser(overrides?: Partial<User>): User {
  return {
    id: faker.string.uuid(),
    name: faker.person.fullName(),
    email: faker.internet.email(),
    createdAt: faker.date.past(),
    ...overrides
  };
}

// 使用
const user = createUser({ name: '特定名称' });
```

---

## 异步测试

```typescript
// ✅ 正确 - async/await
test('should fetch user', async () => {
  const user = await fetchUser('123');
  expect(user.name).toBe('张三');
});

// ✅ 正确 - resolves/rejects
test('should resolve with user', () => {
  expect(fetchUser('123')).resolves.toMatchObject({
    name: '张三'
  });
});

// ✅ 正确 - 超时控制
test('should timeout after 5s', async () => {
  await expect(fetchUser('123')).rejects.toThrow('timeout');
}, 5000);
```

---

## 常见反模式

### ❌ 测试实现细节

```typescript
// 错误 - 测试具体实现
test('should call save method', () => {
  const save = jest.spyOn(user, 'save');
  user.updateName('New Name');
  expect(save).toHaveBeenCalled();
});

// 正确 - 测试行为
test('should update name', async () => {
  const updated = await user.updateName('New Name');
  expect(updated.name).toBe('New Name');
});
```

### ❌ 测试多个场景

```typescript
// 错误 - 一个测试多个断言
test('user', () => {
  expect(user.name).toBe('张三');
  expect(user.email).toBe('test@example.com');
  expect(user.age).toBe(25);
});

// 正确 - 分离测试
test('should have correct name', () => {
  expect(user.name).toBe('张三');
});
```

---

## CI/CD 集成

```yaml
# .github/workflows/test.yml
name: Test

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '20'
          
      - name: Install dependencies
        run: npm ci
        
      - name: Run tests
        run: npm test -- --coverage
        
      - name: Upload coverage
        uses: codecov/codecov-action@v3
```

---

**最后更新**: 2026-01-30
