# Vibe Coding Team 核心原则与铁律

> 本文档定义 Vibe Coding Team 的核心原则和执行铁律。
> 
> **重要**: Violating the letter of the rules is violating the spirit of the rules.

---

## 五大铁律 (Iron Laws)

```
╔═══════════════════════════════════════════════════════════════════════════╗
║                                                                           ║
║  铁律 1: NO CODING WITHOUT DESIGN VALIDATION                              ║
║          没有设计验证，不开始编码                                          ║
║                                                                           ║
║  铁律 2: NO IMPLEMENTATION WITHOUT DETAILED PLAN                          ║
║          没有详细计划，不开始实现                                          ║
║                                                                           ║
║  铁律 3: NO PRODUCTION CODE WITHOUT A FAILING TEST                        ║
║          没有失败的测试，不写生产代码                                      ║
║                                                                           ║
║  铁律 4: NO FIXES WITHOUT ROOT CAUSE INVESTIGATION                        ║
║          没有根因分析，不尝试修复                                          ║
║                                                                           ║
║  铁律 5: NO TASK COMPLETION WITHOUT TWO-STAGE REVIEW                      ║
║          没有双阶段审查，不标记任务完成                                    ║
║                                                                           ║
╚═══════════════════════════════════════════════════════════════════════════╝
```

---

## 铁律 1: 设计验证铁律

### 核心
```
NO CODING WITHOUT DESIGN VALIDATION
```

### 含义
- 在写任何代码之前，必须先完成设计验证
- 设计必须经过至少 3 轮需求澄清问答
- 必须探索 2-3 种方案并对比权衡
- 设计必须被用户确认

### 违反的后果
- 代码与需求不符，需要返工
- 架构问题在后期难以修复
- 技术债务累积

### 正确做法
```
用户: 我想做一个任务管理系统

[vibe-architect] 
1. 提问: 这个系统是给谁用的？个人还是团队？
2. 提问: 核心功能有哪些？优先级如何？
3. 提问: 需要支持离线使用吗？
...

探索方案:
- 方案A: 纯本地存储，简单快速
- 方案B: 云端同步，支持协作
- 方案C: 混合模式，智能同步

展示设计 (200-300字/段):
[架构图]
[数据模型]
...

用户: 确认，采用方案B

生成: docs/plans/2026-01-30-task-manager-design.md

→ 现在可以开始 Phase 2
```

### 常见违反 (STOP!)
- ❌ "我先写个原型看看" → 没有设计验证
- ❌ "需求很简单，不用详细设计" → 简单需求也需要验证
- ❌ "边写边想" → 设计先于编码

---

## 铁律 2: 详细计划铁律

### 核心
```
NO IMPLEMENTATION WITHOUT DETAILED PLAN
```

### 含义
- 在开始实现前，必须有详细的实施计划
- 每个任务必须在 2-5 分钟内完成
- 每个任务必须指定精确文件路径
- 每个任务必须包含完整代码示例

### 违反的后果
- 任务粒度不清晰，进度难以把控
- 实现偏离设计意图
- 遗漏边界情况

### 正确做法
```
## Task 1: Create User Model

**Files:**
- Create: `src/models/user.ts`
- Test: `tests/models/user.test.ts`

**Steps:**

### Step 1: Write failing test
```typescript
test('user model has email and password', () => {
  const user = new User({ email: 'test@example.com', password: 'hash' });
  expect(user.email).toBe('test@example.com');
  expect(user.password).toBe('hash');
});
```

### Step 2: Verify test fails
Run: `npm test user.test.ts`
Expected: FAIL - "User is not defined"

### Step 3: Implement minimal code
```typescript
export class User {
  constructor(public email: string, public password: string) {}
}
```

### Step 4: Verify test passes
Run: `npm test user.test.ts`
Expected: PASS

### Step 5: Commit
```bash
git add src/models/user.ts tests/models/user.test.ts
git commit -m "feat: add user model"
```
```

### 任务粒度标准

| 粒度 | 示例 | 评判 |
|------|------|------|
| ✅ 正确 | "Write failing test for email validation" | 具体、可执行、2-5分钟 |
| ✅ 正确 | "Implement minimal email regex to pass test" | 明确目标、范围清晰 |
| ❌ 过大 | "Implement authentication system" | 需要数小时，粒度太粗 |
| ❌ 模糊 | "Add validation" | 不具体，无法执行 |
| ❌ 多步骤 | "Write test and implement and refactor" | 一个任务包含多个步骤 |

---

## 铁律 3: TDD 铁律

### 核心
```
NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST
```

### TDD 循环

```
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│    ┌─────┐    ┌──────────┐    ┌─────┐    ┌──────────┐      │
│    │ RED │ →  │  VERIFY  │ →  │GREEN│ →  │  VERIFY  │      │
│    │写测试│    │ 看失败    │    │最小代码│    │ 看通过    │      │
│    └─────┘    └──────────┘    └─────┘    └──────────┘      │
│       ↑                                      │              │
│       └──────────────────┬───────────────────┘              │
│                          ↓                                  │
│                    ┌──────────┐    ┌─────────┐             │
│                    │REFACTOR  │ →  │ VERIFY  │             │
│                    │  重构     │    │ 保持绿色 │             │
│                    └──────────┘    └─────────┘             │
│                                                             │
│    铁律: 违反 = 删除代码，重新开始                            │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### RED 阶段要求

**必须:**
1. 测试名称清晰描述行为
2. 测试一个行为 (名称中有"and"就拆分)
3. 使用真实代码 (避免 mock 除非不可避免)
4. 运行并确认失败
5. 失败原因正确 (功能缺失，不是语法错误)

**示例:**
```typescript
// ✅ GOOD
 test('rejects empty email with specific error message', async () => {
   const result = await validateEmail('');
   expect(result.error).toBe('Email is required');
 });

 // ❌ BAD - 名称模糊
 test('email works', async () => {
   const result = await validateEmail('test@example.com');
   expect(result.valid).toBe(true);
 });

 // ❌ BAD - 测试多个行为
 test('validates email format and domain and length', async () => {
   // 应该拆分为3个测试
 });

 // ❌ BAD - 测试 mock 而不是真实代码
 test('calls validator', () => {
   const mock = jest.fn();
   validateEmail('test', mock);
   expect(mock).toHaveBeenCalled();
 });
```

### GREEN 阶段要求

**必须:**
1. 写**最小**代码通过测试
2. 不添加"以后会用到"的功能
3. 不重构其他代码
4. 不"改进"超出测试范围

**示例:**
```typescript
// ✅ GOOD - 最小实现
function validateEmail(email: string) {
  if (!email) {
    return { valid: false, error: 'Email is required' };
  }
  return { valid: true };
}

// ❌ BAD - 过度实现 (YAGNI)
function validateEmail(
  email: string,
  options?: {
    allowDisposable?: boolean;
    customDomains?: string[];
    strictMode?: boolean;
  }
) {
  // 现在还不需要这些功能
}
```

### REFACTOR 阶段要求

**必须:**
1. 仅在测试通过后进行
2. 保持测试绿色
3. 消除重复
4. 改进命名
5. **不添加新行为**

### 铁律执行

**如果发现代码先于测试:**
```
❌ "我已经写好了，补个测试"
❌ "保留代码作为参考"
❌ "边写边测试"

✅ 删除代码
✅ 重新开始
✅ 严格遵循 RED → GREEN → REFACTOR
```

**沉没成本谬误:**
> "删掉 X 小时的工作是浪费"

现实：时间已经花了。选择现在：
- 删除重写 (X 更多小时，高质量)
- 保留补测试 (30 分钟，低质量，可能有 Bug)

"浪费"是保留无法验证的代码。没有真实测试的工作代码是技术债务。

---

## 铁律 4: 系统化调试铁律

### 核心
```
NO FIXES WITHOUT ROOT CAUSE INVESTIGATION FIRST
```

### 系统化调试四阶段

```
┌─────────────────────────────────────────────────────────────┐
│  Phase 1: ROOT CAUSE INVESTIGATION    根因调查               │
│  ─────────────────────────────────────────────────────────  │
│  □ 仔细阅读错误信息 (不要跳过)                                │
│  □ 稳定复现问题                                             │
│  □ 检查近期变更 (git diff, commits)                         │
│  □ 追踪数据流 (从源头到错误点)                               │
│                                                             │
│  Phase 2: PATTERN ANALYSIS            模式分析               │
│  ─────────────────────────────────────────────────────────  │
│  □ 寻找类似的成功代码                                        │
│  □ 对比参考实现                                             │
│  □ 识别关键差异                                             │
│  □ 理解依赖关系                                             │
│                                                             │
│  Phase 3: HYPOTHESIS & TESTING        假设验证               │
│  ─────────────────────────────────────────────────────────  │
│  □ 形成单一具体假设                                          │
│  □ 最小化变更测试                                           │
│  □ 验证或形成新假设                                         │
│  □ 不确定时承认"我不知道"                                    │
│                                                             │
│  Phase 4: IMPLEMENTATION              实施修复               │
│  ─────────────────────────────────────────────────────────  │
│  □ 创建失败测试 (TDD)                                       │
│  □ 实施单一修复                                             │
│  □ 验证修复有效                                             │
│  □ 3+ 失败 = 质疑架构                                        │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 反模式警示

**STOP! 如果你发现自己:**
- "快速修复一下，以后再调查" → 违反铁律
- "试试改这个，看看行不行" → 没有假设就尝试
- "同时改多处，然后测试" → 无法隔离问题
- "先跳过测试，我手动验证" → 修复没有测试保障
- "可能是X，我修复一下" → 猜测而非调查
- "再试一次修复" (已经失败2次) → 3+失败要质疑架构

### 3+ 失败规则

**如果尝试 3 次以上修复都失败:**

这不是失败的假设，这是**错误的架构**。

**STOP 并质疑:**
- 这个模式从根本上正确吗？
- 我们是否在惯性坚持？
- 应该重构架构而不是继续修复症状？

**必须与用户讨论后再继续。**

---

## 铁律 5: 双阶段审查铁律

### 核心
```
NO TASK COMPLETION WITHOUT TWO-STAGE REVIEW
```

### 双阶段审查流程

```
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│  实现完成                                                   │
│      ↓                                                      │
│  ┌─────────────────────────┐                               │
│  │ STAGE 1: SPEC COMPLIANCE│  规格符合性审查                │
│  │        审查              │                               │
│  ├─────────────────────────┤                               │
│  │ □ 实现了所有计划要求？   │                               │
│  │ □ 没有过度实现？         │                               │
│  │ □ 边界情况已处理？       │                               │
│  │ □ 错误处理完整？         │                               │
│  └─────────────────────────┘                               │
│      ↓                                                      │
│  有问题? → 修复 → 重新审查 Stage 1                          │
│      ↓                                                      │
│  通过 ✅                                                    │
│      ↓                                                      │
│  ┌─────────────────────────┐                               │
│  │ STAGE 2: CODE QUALITY   │  代码质量审查                  │
│  │        审查              │                               │
│  ├─────────────────────────┤                               │
│  │ □ 测试覆盖充分？         │                               │
│  │ □ 代码风格一致？         │                               │
│  │ □ 安全扫描通过？         │                               │
│  │ □ 性能可接受？           │                               │
│  │ □ 遵循 SOLID？           │                               │
│  └─────────────────────────┘                               │
│      ↓                                                      │
│  有问题? → 修复 → 重新审查 Stage 2                          │
│      ↓                                                      │
│  通过 ✅                                                    │
│      ↓                                                      │
│  标记任务完成                                               │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 审查顺序铁律

**永远不要:**
- 跳过 Stage 1 直接做 Stage 2
- 同时做两个阶段
- Stage 1 未通过就做 Stage 2

**正确顺序:**
Stage 1 ✅ → Stage 2 ✅ → 完成

### Stage 1: 规格符合性审查

**检查清单:**
```markdown
## Spec Compliance Review

### Requirements Coverage
- [ ] All requirements from plan implemented
- [ ] No missing functionality
- [ ] Edge cases handled as specified

### YAGNI Check
- [ ] No features not in plan
- [ ] No "might need later" code
- [ ] No speculative abstractions

### Interface Compliance
- [ ] API signatures match design
- [ ] Data formats as specified
- [ ] Error responses as designed

### Test Coverage
- [ ] Tests for all specified behaviors
- [ ] Tests for edge cases
- [ ] Tests for error conditions
```

### Stage 2: 代码质量审查

**检查清单:**
```markdown
## Code Quality Review

### Test Quality
- [ ] Tests are readable and maintainable
- [ ] Test names describe behavior
- [ ] No testing implementation details
- [ ] Good assertion messages

### Code Style
- [ ] Consistent naming conventions
- [ ] Proper formatting
- [ ] Clear and expressive code
- [ ] Appropriate comments

### Security
- [ ] Input validation
- [ ] No injection vulnerabilities
- [ ] Proper error handling (no info leak)
- [ ] Authentication/authorization correct

### Performance
- [ ] No obvious performance issues
- [ ] Efficient algorithms
- [ ] Proper resource management

### Design
- [ ] SOLID principles followed
- [ ] Separation of concerns
- [ ] DRY (no duplication)
- [ ] Appropriate abstractions
```

### 问题分级

**Critical (必须修复)**
- 安全漏洞
- 功能缺失
- 严重性能问题
- 测试缺失

**Important (应该修复)**
- 代码异味
- 设计问题
- 边界情况未处理
- 文档缺失

**Suggestion (可以考虑)**
- 风格偏好
- 可选优化
- 注释建议

---

## 附加原则

### YAGNI (You Aren't Gonna Need It)

**原则:** 不要实现现在不需要的功能。

**示例:**
```typescript
// ❌ YAGNI 违反
class UserService {
  async createUser(data) {
    // 现在只需要创建
  }
  
  async bulkCreateUsers(data) {
    // "以后可能需要批量创建"
  }
  
  async createUserWithOAuth(data) {
    // "以后可能需要 OAuth"
  }
}

// ✅ YAGNI 遵循
class UserService {
  async createUser(data) {
    // 只实现现在需要的
  }
}
// 需要时再加
```

### DRY (Don't Repeat Yourself)

**原则:** 消除重复代码。

**示例:**
```typescript
// ❌ DRY 违反
function validateUser(data) {
  if (!data.email) throw new Error('Email required');
  if (!data.password) throw new Error('Password required');
}

function validateAdmin(data) {
  if (!data.email) throw new Error('Email required');  // 重复
  if (!data.password) throw new Error('Password required');  // 重复
  if (!data.role) throw new Error('Role required');
}

// ✅ DRY 遵循
function validateEmail(email) {
  if (!email) throw new Error('Email required');
}

function validatePassword(password) {
  if (!password) throw new Error('Password required');
}

function validateUser(data) {
  validateEmail(data.email);
  validatePassword(data.password);
}
```

### 单一职责原则

**原则:** 一个函数/类只做一件事。

**示例:**
```typescript
// ❌ 多职责
function processUser(data) {
  // 验证
  if (!data.email) throw new Error('Email required');
  
  // 转换
  const user = { ...data, createdAt: new Date() };
  
  // 存储
  db.users.insert(user);
  
  // 通知
  emailService.sendWelcome(user.email);
  
  return user;
}

// ✅ 单一职责
function validateUser(data) { /* 只验证 */ }
function transformUser(data) { /* 只转换 */ }
function saveUser(user) { /* 只存储 */ }
function notifyUser(user) { /* 只通知 */ }

// 组合
function processUser(data) {
  validateUser(data);
  const user = transformUser(data);
  saveUser(user);
  notifyUser(user);
  return user;
}
```

---

## 原则优先级

当原则冲突时，按以下优先级:

```
1. 五大铁律 (最高优先级)
   ↓
2. 安全原则
   ↓
3. 可维护性原则 (DRY, 单一职责)
   ↓
4. 简洁原则 (YAGNI)
   ↓
5. 性能原则 (除非是关键路径)
```

---

**最后更新**: 2026-01-30
**版本**: v2.0
