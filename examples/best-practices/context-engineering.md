# Context Engineering 最佳实践指南

> **Context Engineering** 是指为 AI Agent 提供高质量上下文的艺术和科学。掌握 Context Engineering 是充分发挥 Vibe Coding Team 潜能的关键。

---

## 📋 目录

- [什么是 Context Engineering？](#什么是-context-engineering)
- [核心原则](#核心原则)
- [上下文类型](#上下文类型)
- [实践指南](#实践指南)
- [Agent 特定策略](#agent-特定策略)
- [常见错误](#常见错误)
- [高级技巧](#高级技巧)
- [工具和模板](#工具和模板)

---

## 什么是 Context Engineering？

### 定义

**Context Engineering** 是系统化地为 AI Agent 提供相关、完整、结构化的信息，以最大化其理解和执行效果的能力。

### 为什么重要？

```
❌ 缺少上下文：
[vibe-architect] 做个博客

AI 的理解：
- 什么类型的博客？（技术博客？个人博客？企业博客？）
- 需要什么功能？（评论？搜索？标签？）
- 使用什么技术栈？
- 目标用户是谁？

结果：需要多轮对话，效率低

---

✅ 优秀上下文：
[vibe-architect] 我需要一个技术博客系统，用于分享编程教程。
核心功能：
- 文章管理（Markdown 编辑、标签分类）
- 用户认证（GitHub OAuth）
- 评论系统（支持代码高亮）
- 搜索功能（全文搜索）
技术栈：Node.js + React + MongoDB
目标受众：开发者群体
部署环境：Docker 容器

AI 的理解：
- 明确的类型和用途
- 完整的功能列表
- 清晰的技术栈
- 目标用户和部署环境

结果：一次交互，准确理解，高效执行
```

---

## 核心原则

### 1️⃣ 明确性 (Clarity)

**原则**: 清晰、准确地表达意图，避免歧义

**示例**:

```bash
# ❌ 不好：模糊不清
[vibe-architect] 我想要一个网站，能够处理数据

# ✅ 好：明确具体
[vibe-architect] 我需要一个数据分析仪表板，功能包括：
  - 上传 CSV 文件（最大 10MB）
  - 数据可视化（折线图、柱状图、饼图）
  - 导出报告（PDF 和 Excel）
  - 用户权限管理（查看者/编辑者/管理员）
```

**关键点**:
- ✅ 使用具体的术语
- ✅ 明确功能边界
- ✅ 指定输入输出
- ✅ 定义用户角色

---

### 2️⃣ 完整性 (Completeness)

**原则**: 提供充分的上下文信息，避免 Agent 猜测

**上下文检查清单**:

- [ ] **项目背景**
  - 项目类型和用途
  - 目标用户
  - 业务场景

- [ ] **功能需求**
  - 核心功能列表
  - 次要功能（可选）
  - 未来扩展计划

- [ ] **技术约束**
  - 技术栈偏好
  - 性能要求
  - 兼容性要求

- [ ] **非功能需求**
  - 安全性要求
  - 可维护性要求
  - 可扩展性要求

**示例**:

```bash
[vibe-architect] 我需要开发一个在线代码编辑器（类似 CodePen）

# 项目背景
- 用途：让开发者在线编写、分享 HTML/CSS/JavaScript 代码
- 目标用户：前端开发者、学习者
- 使用场景：教学、代码演示、快速原型

# 功能需求
核心功能：
1. 代码编辑器（支持语法高亮、自动补全）
2. 实时预览（iframe 隔离）
3. 代码分享（生成唯一链接）
4. 代码保存（本地存储 + 云端存储）
5. 模板库（常用布局模板）

次要功能：
- 社交功能（点赞、评论）
- 版本历史
- 协作编辑（未来）

# 技术约束
- 前端：React + Monaco Editor
- 后端：Node.js + Express
- 数据库：MongoDB（用户数据）+ Redis（缓存）
- 部署：Docker + AWS

# 非功能需求
- 性能：代码编辑延迟 < 50ms，预览更新延迟 < 100ms
- 安全：XSS 防护、CSP 策略、代码沙箱
- 可扩展：支持 10,000+ 并发用户
```

---

### 3️⃣ 结构化 (Structure)

**原则**: 使用可预测的格式和结构，便于 Agent 理解

**推荐格式**:

```bash
# 格式 1: 层级结构
[vibe-architect] 项目名称：XXX

## 项目背景
- 类型：XXX
- 目标：XXX

## 功能需求
### 核心功能
1. XXX
2. XXX

### 次要功能
1. XXX

## 技术栈
- 前端：XXX
- 后端：XXX
- 数据库：XXX

## 约束条件
- 性能：XXX
- 安全：XXX


# 格式 2: YAML 风格
[vibe-architect] 项目：任务管理系统

project:
  name: "TaskFlow"
  type: "SaaS 应用"
  target: "小团队协作"

features:
  must_have:
    - 任务 CRUD
    - 任务分配
    - 进度跟踪
  nice_to_have:
    - 时间跟踪
    - 报告生成

tech_stack:
  frontend: "React + TypeScript"
  backend: "Node.js + GraphQL"
  database: "PostgreSQL"

constraints:
  performance: "响应时间 < 200ms"
  users: "支持 1000+ 并发用户"


# 格式 3: Markdown 列表（推荐）
[vibe-architect] 开发一个 RESTful API 服务

### 功能模块
1. **用户认证**
   - 注册/登录
   - JWT Token
   - 密码重置

2. **资源管理**
   - CRUD 操作
   - 分页查询
   - 批量操作

### API 设计
- RESTful 规范
- JSON 响应格式
- 标准HTTP状态码

### 技术栈
- Node.js + Express
- MongoDB
- JWT 认证
```

**关键点**:
- ✅ 使用标题和子标题
- ✅ 使用列表（有序/无序）
- ✅ 使用代码块展示配置
- ✅ 保持一致的缩进和格式

---

### 4️⃣ 渐进性 (Progressiveness)

**原则**: 从简单到复杂，逐步深化上下文

**三阶段上下文策略**:

```bash
# 阶段 1: 初始上下文（简洁）
[vibe-architect] 我需要一个任务管理 API，支持 CRUD 操作

# 阶段 2: 深化上下文（详细）
[vibe-architect] 基于前面的设计，添加以下功能：
- 任务优先级（高/中/低）
- 任务状态（待办/进行中/已完成）
- 任务分配给用户
- 任务评论功能

# 阶段 3: 完善上下文（完整）
[vibe-architect] 继续完善，添加：
- 任务附件（文件上传）
- 任务标签系统
- 任务搜索和过滤
- 任务统计和报告
- WebSocket 实时通知
```

**优势**:
- ✅ 降低初始复杂度
- ✅ 快速获得反馈
- ✅ 逐步完善功能
- ✅ 便于迭代调整

---

## 上下文类型

### 1. 项目上下文 (Project Context)

描述项目的整体背景和目标。

**模板**:

```markdown
## 项目概述
- **名称**: [项目名称]
- **类型**: [Web应用/Mobile应用/API/库等]
- **目标**: [解决什么问题]
- **目标用户**: [谁将使用]

## 业务场景
[描述典型的使用场景]

## 项目规模
- **团队规模**: [人数]
- **开发周期**: [时间]
- **预期用户量**: [数量]
```

---

### 2. 技术上下文 (Technical Context)

描述技术栈、架构、约束等。

**模板**:

```markdown
## 技术栈
### 前端
- **框架**: [React/Vue/Angular等]
- **状态管理**: [Redux/Vuex/MobX等]
- **UI库**: [Material-UI/Ant Design等]

### 后端
- **框架**: [Express/Django/Spring等]
- **数据库**: [PostgreSQL/MongoDB等]
- **缓存**: [Redis/Memcached等]

### 部署
- **容器化**: [Docker/Kubernetes]
- **云服务**: [AWS/Azure/GCP]
- **CI/CD**: [GitHub Actions/Jenkins]

## 技术约束
- **性能要求**: [响应时间/吞吐量]
- **兼容性**: [浏览器/设备]
- **可扩展性**: [水平/垂直扩展]
```

---

### 3. 功能上下文 (Feature Context)

详细描述功能需求。

**模板**:

```markdown
## 功能列表

### 核心功能（必须有）
1. **[功能名称]**
   - **描述**: [功能说明]
   - **输入**: [需要什么]
   - **输出**: [产生什么]
   - **优先级**: [高/中/低]
   - **依赖**: [依赖其他功能]

### 次要功能（应该有）
1. **[功能名称]**
   - ...

### 未来功能（可以有）
1. **[功能名称]**
   - ...
```

---

### 4. 数据上下文 (Data Context)

描述数据模型、数据流等。

**模板**:

```markdown
## 数据模型

### User（用户）
```
{
  id: ObjectId
  username: string
  email: string
  password: string (hashed)
  role: enum['user', 'admin']
  createdAt: Date
}
```

### Task（任务）
```
{
  id: ObjectId
  title: string
  description: string
  status: enum['todo', 'in-progress', 'done']
  priority: enum['low', 'medium', 'high']
  assignee: ObjectId (ref: User)
  createdBy: ObjectId (ref: User)
  createdAt: Date
  updatedAt: Date
}
```

## 数据流
1. 用户创建任务 → Task.created
2. 分配任务给用户 → Task.assignee
3. 更新任务状态 → Task.status
4. 删除任务 → Task.deleted
```

---

### 5. 流程上下文 (Process Context)

描述工作流程、交互流程。

**模板**:

```markdown
## 用户流程

### 创建任务流程
1. 用户点击"新建任务"
2. 填写任务信息（标题、描述、优先级）
3. 选择分配对象
4. 提交表单
5. 后端验证并保存
6. 返回任务列表，显示新任务

### 审批流程（如有）
1. 用户提交任务
2. 主管收到通知
3. 主管审批（通过/拒绝）
4. 用户收到审批结果
```

---

## 实践指南

### 场景 1: 新项目启动

**目标**: 从零开始一个新项目

**最佳实践**:

```bash
# Step 1: 项目愿景
[vibe-architect] 我想开发一个[项目类型]，解决[问题]
目标用户是[用户群体]

# Step 2: 详细需求
[vibe-architect] 具体需求如下：
[使用结构化格式列出所有功能]

# Step 3: 技术选型
[vibe-architect] 基于需求，我建议使用[技术栈]
原因：[解释选择理由]

# Step 4: 架构设计
[vibe-architect] 请设计系统架构，包括：
- 模块划分
- 接口定义
- 数据流
```

**示例**:

```bash
[vibe-architect] 我想开发一个在线教育平台

# 项目愿景
目标：为K12学生提供在线学习体验
用户：学生、教师、家长

# 核心功能
1. 课程管理（视频、文档、测验）
2. 学习进度跟踪
3. 作业提交和批改
4. 家长查看报告

# 技术偏好
- 前端：React（熟悉）
- 后端：Node.js（团队经验）
- 视频：使用第三方服务（如Vimeo API）

# 请设计架构并考虑：
- 如何处理大量视频流量？
- 如何保护学生隐私？
- 如何防止作弊？
```

---

### 场景 2: 功能迭代

**目标**: 在现有项目上添加新功能

**最佳实践**:

```bash
# Step 1: 说明现状
[vibe-architect] 当前项目已有[功能列表]
技术栈：[列出技术]

# Step 2: 描述新需求
[vibe-architect] 需要添加新功能：
[详细描述]

# Step 3: 说明约束
[vibe-architect] 需要注意：
- 不能破坏现有功能
- 需要向后兼容
- 性能不能降低

# Step 4: 集成方案
[vibe-architect] 请设计集成方案：
- 如何与现有代码集成？
- 是否需要重构？
- 测试策略？
```

**示例**:

```bash
[vibe-architect] 我的博客系统已有：
- 文章发布（Markdown）
- 基础评论功能
- 用户认证（JWT）

# 新需求
添加文章搜索功能：
- 全文搜索（标题、内容、标签）
- 搜索历史
- 热门搜索
- 搜索结果高亮

# 技术栈
- 当前：MongoDB（用Mongoose）
- 不想引入Elasticsearch（太重）

# 约束
- 数据库约10000篇文章
- 搜索响应时间 < 500ms
- 需要中文分词

# 请实现
```

---

### 场景 3: Bug 修复

**目标**: 修复代码中的问题

**最佳实践**:

```bash
# Step 1: 描述问题
[@vibe-debugger] 遇到错误：
[错误信息]

# Step 2: 提供上下文
[@vibe-debugger] 上下文信息：
- 代码位置：[文件路径]
- 相关代码：[粘贴代码]
- 复现步骤：[如何触发错误]
- 期望行为：[应该做什么]
- 实际行为：[实际发生了什么]

# Step 3: 环境信息
[@vibe-debugger] 环境：
- Node.js版本：v18
- 相关依赖：[列出]
- 运行环境：[开发/生产]
```

**示例**:

```bash
[@vibe-debugger] 登录接口返回500错误

# 错误信息
Error: Cannot read property 'password' of undefined
  at /routes/auth.js:25:18

# 上下文
代码位置：routes/auth.js
相关代码：
```javascript
router.post('/login', async (req, res) => {
  const { email, password } = req.body;
  const user = await User.findOne({ email }); // line 20
  if (user.password === password) { // line 25 - ERROR HERE
    // ...
  }
});
```

# 复现步骤
1. 发送POST请求到 /api/auth/login
2. Body: { "email": "test@example.com", "password": "wrong" }
3. 返回500错误

# 期望
应该返回401和错误消息"Invalid credentials"

# 实际
返回500和错误堆栈

# 请分析并修复
```

---

### 场景 4: 代码重构

**目标**: 改进代码质量

**最佳实践**:

```bash
# Step 1: 说明目标
[@vibe-coder] 需要重构[代码模块]

# Step 2: 说明问题
[@vibe-coder] 当前问题：
[列出具体问题]

# Step 3: 说明目标
[@vibe-coder] 重构目标：
[期望达到的效果]

# Step 4: 说明约束
[@vibe-coder] 约束条件：
[不能破坏的方面]
```

**示例**:

```bash
[@vibe-coder] 需要重构用户服务

# 当前问题
- 单个文件2000+行（user.js）
- 多个职责混在一起（认证、授权、CRUD）
- 难以测试
- 难以维护

# 重构目标
- 拆分为多个小文件
- 单一职责原则
- 提高可测试性
- 保持API接口不变

# 约束
- 不能破坏现有功能
- 需要保持向后兼容
- 添加单元测试

# 请提供重构方案
```

---

## Agent 特定策略

### Vibe Architect（架构指挥官）

**上下文重点**:
- ✅ 业务需求
- ✅ 技术栈选择
- ✅ 系统架构
- ✅ 模块划分

**最佳上下文**:

```bash
[vibe-architect] 项目：电商系统后端

# 业务需求
- 支持10万+商品
- 1000+ 并发订单
- 秒杀活动（流量峰值）

# 技术栈偏好
- 微服务架构
- Node.js（团队熟悉）
- MongoDB（灵活schema）
- Redis（缓存和队列）

# 架构要求
- 高可用性
- 可扩展性
- 最终一致性（可接受）

# 请设计：
1. 服务划分
2. 数据模型
3. API设计
4. 扩展策略
```

---

### Vibe Coder（编码乐手）

**上下文重点**:
- ✅ 具体功能需求
- ✅ 接口定义
- ✅ 代码规范
- ✅ 约束条件

**最佳上下文**:

```bash
[@vibe-coder] 实现用户注册API

# 接口定义
POST /api/auth/register
Request:
{
  "username": "string (3-30 chars)",
  "email": "string (valid email)",
  "password": "string (min 6 chars)"
}
Response:
{
  "user": { "id", "username", "email" },
  "token": "jwt_token"
}

# 代码要求
- 使用Express.js
- 使用Mongoose模型
- 输入验证（express-validator）
- 密码bcrypt加密（salt rounds: 10）
- JWT token（7天过期）
- 错误处理统一格式

# 代码风格
- 使用async/await
- 遵循Google JavaScript风格指南
- 添加JSDoc注释

# 约束
- email必须唯一
- username必须唯一
- 密码不能明文存储
```

---

### Vibe Reviewer（质量守门人）

**上下文重点**:
- ✅ 审查标准
- ✅ 关注重点
- ✅ 质量要求
- ✅ 特定检查项

**最佳上下文**:

```bash
[@vibe-reviewer] 审查用户认证代码

# 审查重点
1. **安全性**（最重要）
   - SQL注入防护
   - XSS防护
   - CSRF防护
   - 密码安全

2. **错误处理**
   - 是否优雅
   - 是否泄露敏感信息

3. **性能**
   - 是否有N+1查询
   - 是否有不必要的循环

4. **代码质量**
   - 可读性
   - 可维护性
   - 符合最佳实践

# 质量标准
- 安全性：无已知漏洞
- 性能：响应时间 < 200ms
- 代码覆盖率：> 80%

# 输出格式
请提供：
1. 总体评分（1-10）
2. 发现的问题列表（按严重程度排序）
3. 改进建议
4. 示例代码（如有需要）
```

---

### Vibe Debugger（调试专家）

**上下文重点**:
- ✅ 错误信息
- ✅ 复现步骤
- ✅ 环境信息
- ✅ 相关代码

**最佳上下文**:

```bash
[@vibe-debugger] 修复订单创建bug

# 错误信息
Error: Transaction failed
  at Order.create (src/models/Order.js:45)
  at processTicksAndRejections (internal/process/task_queues.js:95:5)

# 复现步骤
1. 创建订单（商品A x 2）
2. 应用折扣券（DISCOUNT10）
3. 选择支付方式（信用卡）
4. 提交订单
5. 错误：Transaction failed

# 期望行为
订单创建成功，库存减少，折扣券标记为已使用

# 实际行为
订单创建失败，库存未减少，折扣券仍可用

# 环境信息
- Node.js: v18.17.0
- MongoDB: v6.0
- 事务：已启用
- 相关代码：
```javascript
// src/models/Order.js
async function createOrder(data) {
  const session = await mongoose.startSession();
  session.startTransaction();
  try {
    const order = new Order({ ...data, session });
    await order.save({ session });
    await updateInventory(order.items, { session });
    await applyCoupon(order.coupon, { session });
    await session.commitTransaction();
    return order;
  } catch (error) {
    await session.abortTransaction();
    throw error;
  } finally {
    session.endSession();
  }
}
```

# 请分析：
1. 根本原因是什么？
2. 如何修复？
3. 如何防止未来发生？
4. 需要添加什么测试？
```

---

### Vibe Documenter（文档生成器）

**上下文重点**:
- ✅ 文档类型
- ✅ 目标受众
- ✅ 文档结构
- ✅ 特殊要求

**最佳上下文**:

```bash
[@vibe-documenter] 为用户API生成文档

# 文档类型
API参考文档（RESTful API）

# 目标受众
- 前端开发者（集成API）
- 测试人员（编写测试）
- 第三方开发者（使用API）

# 文档结构
请包含：
1. 概述
2. 认证方式
3. 端点列表（按功能分组）
4. 每个端点：
   - HTTP方法和路径
   - 请求参数（路径、查询、体）
   - 请求示例
   - 响应格式
   - 响应示例（成功/失败）
   - 错误码
5. 速率限制
6. SDK/客户端示例

# 特殊要求
- 使用OpenAPI/Swagger格式
- 提供cURL示例
- 提供JavaScript/Python示例
- 包含交互式API测试（如Swagger UI）

# 代码风格
- Markdown格式
- 使用代码块高亮
- 清晰的层级结构
```

---

## 常见错误

### ❌ 错误 1: 上下文过少

```bash
[vibe-architect] 做个电商

问题：
- 什么类型的电商？（B2B/B2C/C2C）
- 卖什么商品？
- 目标用户是谁？
- 需要什么功能？
```

**修正**:

```bash
[vibe-architect] 我需要一个B2C电商平台，
用于销售电子数码产品。
目标用户：25-35岁的城市白领。
核心功能：商品展示、购物车、订单管理、支付集成。
技术栈：React + Node.js + MongoDB。
```

---

### ❌ 错误 2: 上下文过多（信息过载）

```bash
[vibe-architect] 我需要一个...
[10页的详细需求文档...]

问题：
- 信息太多，Agent难以消化
- 关键信息被淹没
- 响应质量下降
```

**修正**:

```bash
[vibe-architect] 我需要一个电商系统。

# 核心功能（第一阶段）
1. 商品管理（CRUD）
2. 购物车
3. 订单处理
4. 支付集成

# 技术栈
- React + Node.js + MongoDB

# 详细的业务规则
[附加为文件或链接]

请先设计核心架构，详细需求我会在后续提供。
```

---

### ❌ 错误 3: 上下文不一致

```bash
[vibe-architect] 我需要一个React应用，
使用Vue.js和Angular框架...

问题：
- 技术栈矛盾
- Agent无法确定该用哪个
```

**修正**:

```bash
[vibe-architect] 我需要一个前端应用。
技术选择：
- 方案A: React（团队熟悉）
- 方案B: Vue.js（学习成本较低）
请帮我分析并推荐最合适的框架。
```

---

### ❌ 错误 4: 缺少关键约束

```bash
[@vibe-coder] 实现文件上传功能

问题：
- 文件大小限制？
- 文件类型限制？
- 存储在哪里？
- 需要病毒扫描吗？
```

**修正**:

```bash
[@vibe-coder] 实现文件上传功能

# 约束条件
- 文件大小：最大 10MB
- 文件类型：只允许图片（jpg, png, gif）
- 存储：AWS S3
- 需求：生成缩略图（200x200）
- 安全：文件类型验证（不仅看扩展名）
```

---

## 高级技巧

### 1. 上下文分层

将上下文分为多个层次，逐步提供：

```bash
# Layer 1: 高层概览
[vibe-architect] 我需要一个CRM系统

# Layer 2: 核心功能
[vibe-architect] 核心模块：
- 客户管理
- 销售机会跟踪
- 报表生成

# Layer 3: 详细需求
[vibe-architect] 客户管理模块详细需求：
[详细列表]

# Layer 4: 技术细节
[vibe-architect] 客户数据模型：
[数据结构]
```

---

### 2. 上下文重用

创建可重用的上下文模板：

```bash
# 标准项目启动模板
[vibe-architect] 启动新项目，使用标准SaaS模板：
- 用户认证（JWT）
- 用户管理（RBAC）
- 组织管理（多租户）
- 审计日志
具体需求：[添加特殊需求]

# 标准API开发模板
[@vibe-coder] 开发标准CRUD API：
模型：[模型定义]
验证规则：[验证规则]
请包含：create, read, update, delete, list, search
```

---

### 3. 渐进式细化

从模糊到精确，逐步细化需求：

```bash
# Round 1: 概念验证
[vibe-architect] 探索：如何实现实时聊天功能？

# Round 2: 技术选型
[vibe-architect] 基于探索结果，我选择WebSocket方案
请设计架构

# Round 3: 详细设计
[vibe-architect] 设计聊天室功能：
- 私聊
- 群聊（最多500人）
- 消息历史（最近100条）
- 在线状态

# Round 4: 优化
[vibe-architect] 优化性能：
- 如何支持10,000+并发连接？
- 如何减少消息延迟？
```

---

### 4. 对比分析

提供多个方案，让Agent对比分析：

```bash
[vibe-architect] 需要实现缓存层

请分析以下方案：
1. Redis（内存数据库）
2. Memcached（分布式缓存）
3. Node.js内置缓存（memory-cache）

从以下角度对比：
- 性能
- 可扩展性
- 复杂度
- 成本

推荐最适合我们的方案（场景：中等流量，预算有限）
```

---

### 5. 反向工程

从期望的输出反推需要的上下文：

```bash
# 期望输出
{
  "success": true,
  "data": {
    "users": [
      {
        "id": "123",
        "name": "John",
        "email": "john@example.com",
        "role": "admin",
        "createdAt": "2026-01-27T10:00:00.000Z"
      }
    ],
    "pagination": {
      "page": 1,
      "limit": 10,
      "total": 100
    }
  }
}

# 反推上下文
[@vibe-coder] 实现用户列表API

# 输出格式要求
请严格按照上面的JSON格式返回
- success: 布尔值
- data.users: 用户数组（不包含password）
- data.pagination: 分页信息

# 查询参数
- page: 页码（默认1）
- limit: 每页数量（默认10，最大100）
- search: 搜索关键词（可选，匹配name或email）
- role: 角色过滤（可选）

请实现并确保格式完全匹配
```

---

## 工具和模板

### 项目启动模板

```markdown
# 项目：[名称]

## 项目概述
- **类型**: [Web应用/API/Mobile等]
- **目标**: [解决什么问题]
- **用户**: [目标用户群体]

## 核心功能
1. [功能1]
2. [功能2]
3. [功能3]

## 技术栈
- 前端: [框架]
- 后端: [框架]
- 数据库: [数据库]
- 部署: [平台]

## 约束条件
- 性能: [要求]
- 安全: [要求]
- 可扩展性: [要求]

## 时间表
- MVP: [日期]
- 完整版: [日期]
```

---

### 功能需求模板

```markdown
## 功能：[名称]

### 描述
[详细描述]

### 用户故事
作为 [角色]，我想要 [功能]，以便 [目标]

### 验收标准
- [ ] [标准1]
- [ ] [标准2]
- [ ] [标准3]

### API/接口
输入: [描述]
输出: [描述]

### 依赖
- 前置条件: [条件]
- 依赖模块: [模块]
```

---

### Bug报告模板

```markdown
## Bug: [标题]

### 错误信息
```
[错误堆栈]
```

### 复现步骤
1. [步骤1]
2. [步骤2]
3. [步骤3]

### 期望行为
[应该发生什么]

### 实际行为
[实际发生了什么]

### 环境信息
- 版本: [版本号]
- 运行环境: [环境]
- 相关依赖: [列出]

### 相关代码
```javascript
[粘贴代码]
```
```

---

## 📝 总结

**Context Engineering** 是提升 Vibe Coding Team 效果的关键技能。

### 核心要点

1. **明确性**: 清晰表达，避免歧义
2. **完整性**: 提供充分的上下文信息
3. **结构化**: 使用可预测的格式
4. **渐进性**: 从简单到复杂，逐步深化

### 实践建议

- ✅ 花时间准备上下文（节省后续时间）
- ✅ 使用模板和检查清单
- ✅ 根据Agent类型调整上下文
- ✅ 提供具体的示例和数据
- ✅ 迭代和优化上下文

### 避免错误

- ❌ 上下文过少（导致多轮对话）
- ❌ 上下文过多（信息过载）
- ❌ 上下文不一致（矛盾信息）
- ❌ 缺少关键约束（不完整的方案）

---

**记住**: 垃圾进，垃圾出（Garbage In, Garbage Out）。高质量的上下文是高质量输出的前提！

**下一步**: 学习 [Prompt Engineering](prompt-engineering.md) 进一步提升你的技能。

---

**文档版本**: 1.0.0
**最后更新**: 2026-01-27
**作者**: Vibe Coding Team Community
