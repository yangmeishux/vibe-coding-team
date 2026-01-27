# Vibe Coding Team - 快速上手指南

欢迎来到 Vibe Coding Team！本指南将帮助您在 **10 分钟内** 快速上手，体验自然语言驱动的 AI 协作编程。

---

## 📑 目录

- [Part 1: 快速上手（10 分钟）](#part-1-快速上手10-分钟)
- [Part 2: 深入理解](#part-2-深入理解)
- [常见问题](#常见问题)
- [下一步](#下一步)

---

## Part 1: 快速上手（10 分钟）

⏱️ **预计时间**: 10 分钟
🎯 **目标**: 快速体验 Vibe Coding Team 的核心功能

### 步骤 1: 安装（2 分钟）

<details>
<summary><b>查看安装方法</b></summary>

#### 方式 1: Git 克隆（推荐）

```bash
# 进入 Claude Code SKILLS 目录
cd ~/.claude/skills

# 克隆仓库
git clone https://github.com/yangmeishux/vibe-coding-team.git

# 验证安装
ls vibe-coding-team/SKILL.md
```

#### 方式 2: 手动下载

1. 访问 [GitHub Releases](https://github.com/yangmeishux/vibe-coding-team/releases)
2. 下载最新版本的 ZIP 文件
3. 解压到 `~/.claude/skills/` 目录

</details>

✅ **完成标志**: 看到 `SKILL.md` 文件存在

---

### 步骤 2: 验证安装（1 分钟）

```bash
# 启动 Claude Code
claude

# 测试 SKILL
> [vibe-architect] 测试一下是否正常工作
```

✅ **预期输出**: Vibe Architect 响应并确认系统正常工作

---

### 步骤 3: 第一个项目（7 分钟）

让我们用 **5 分钟**开发一个简单的任务管理 API！

#### 3.1 需求描述（1 分钟）

```bash
> [vibe-architect] 我需要一个简单的任务管理 API，支持：
  - 创建任务（标题、描述、优先级）
  - 查看所有任务
  - 更新任务状态（待办/进行中/已完成）
  - 删除任务
  使用 Node.js + Express
```

#### 3.2 代码生成（3 分钟）

等待 Vibe Architect 协调团队完成：
- ✅ 架构设计
- ✅ API 端点生成
- ✅ 数据模型定义

#### 3.3 代码审查（2 分钟）

```bash
> [@vibe-reviewer] 审查生成的代码质量
```

#### 3.4 测试生成（1 分钟）

```bash
> [@vibe-debugger] 生成测试用例
```

✅ **完成标志**: 获得可运行的任务管理 API 代码 + 测试用例

---

### 🎉 恭喜！

您已经完成了第一次 Vibe Coding 体验！

**产出**:
- ✅ 完整的任务管理 API
- ✅ 代码审查报告
- ✅ 测试用例
- ✅ 预计耗时: 10 分钟

---

## Part 2: 深入理解

本部分详细解释每个步骤的原理和最佳实践。

### 为什么需要 Vibe Coding？

#### 传统开发方式的挑战

**传统开发流程**:
```
需求分析 → 架构设计 → 编码实现 → 测试调试 → 代码审查 → 文档编写
   ↓         ↓         ↓         ↓         ↓         ↓
  2小时     3小时     8小时     4小时     2小时     2小时
  总计: 21 小时
```

**痛点**:
- ❌ 需要精通多种技术和工具
- ❌ 每个阶段都需要大量手动工作
- ❌ 容易出现遗漏和质量问题
- ❌ 学习曲线陡峭

#### Vibe Coding 的优势

**Vibe Coding 流程**:
```
自然语言描述需求
   ↓
[vibe-architect] 协调 AI Agent 团队
   ↓
产出: 代码 + 测试 + 文档
  总计: 2-3 小时
```

**优势**:
- ✅ 用自然语言描述需求，无需手写代码
- ✅ 5 个专业 Agent 各司其职，质量有保障
- ✅ 自动完成开发全流程
- ✅ 快速迭代，轻松修改

---

### 理解 5 个 Agent

#### Vibe Architect (架构指挥官) 🎨

**角色**: 指挥家，负责整体方向和架构决策

**核心职责**:
- 理解高层次需求
- 设计系统架构
- 选择技术栈
- 协调其他 Agent
- 整合最终输出

**何时使用**:
- ✅ 项目启动时
- ✅ 需要架构设计时
- ✅ 多 Agent 任务协调时
- ✅ 最终质量把控时

**示例**:
```bash
[vibe-architect] 设计一个博客系统的架构
```

---

#### Vibe Coder (编码乐手) 🎹

**角色**: 编码乐手，专注代码生成

**核心职责**:
- 生成具体代码
- 实现业务逻辑
- 处理边界情况
- 遵循编码规范

**何时使用**:
- ✅ 需要 API 端点时
- ✅ 需要数据模型时
- ✅ 需要业务逻辑时

**示例**:
```bash
[@vibe-coder] 实现用户登录接口
```

---

#### Vibe Reviewer (质量守门人) 🔍

**角色**: 质量守门人，确保代码质量

**核心职责**:
- 审查代码质量
- 检查安全漏洞
- 评估性能
- 提供改进建议

**何时使用**:
- ✅ 代码完成后
- ✅ 需要安全审查时
- ✅ 需要性能评估时

**示例**:
```bash
[@vibe-reviewer] 检查这段代码的安全性
```

---

#### Vibe Debugger (调试专家) 🐛

**角色**: 调试专家，诊断和修复问题

**核心职责**:
- 分析错误日志
- 定位问题根源
- 提供修复方案
- 生成测试用例

**何时使用**:
- ✅ 出现错误时
- ✅ 需要测试覆盖时
- ✅ 需要问题排查时

**示例**:
```bash
[@vibe-debugger] 修复这个 bug 并生成测试
```

---

#### Vibe Documenter (文档生成器) 📚

**角色**: 文档生成器，维护技术文档

**核心职责**:
- 生成 API 文档
- 创建架构说明
- 编写使用手册
- 保持文档同步

**何时使用**:
- ✅ 需要 API 文档时
- ✅ 需要架构说明时
- ✅ 需要用户手册时

**示例**:
```bash
[@vibe-documenter] 生成 API 文档
```

---

### 三种使用方式详解

#### 方式 1: 让架构师协调（推荐用于复杂项目）

**适用场景**: 完整项目开发，需要全流程协作

**示例**:
```bash
[vibe-architect] 我需要开发一个博客系统，支持：
  - 用户注册和登录
  - 文章的创建、编辑、删除
  - 评论功能
  请协调团队完成
```

**工作流程**:
```
[vibe-architect] 接收需求
    ↓
1. 分析需求，设计架构
2. 定义模块和接口
3. 协调 Agent 并行开发
   ├─ [vibe-coder] 生成代码
   ├─ [vibe-reviewer] 审查质量
   ├─ [vibe-debugger] 生成测试
   └─ [vibe-documenter] 生成文档
4. 整合最终输出
```

**优点**:
- ✅ 自动协调所有 Agent
- ✅ 并行处理提升效率
- ✅ 质量检查点完善
- ✅ 一站式交付

---

#### 方式 2: 指定特定 Agent（推荐用于单一任务）

**适用场景**: 单一功能开发，针对性任务

**示例**:
```bash
# 需求分析
[vibe-architect] 设计用户认证系统架构

# 代码生成
[@vibe-coder] 实现登录接口

# 代码审查
[@vibe-reviewer] 审查代码安全性

# 测试生成
[@vibe-debugger] 生成测试用例

# 文档生成
[@vibe-documenter] 生成 API 文档
```

**优点**:
- ✅ 精准控制，灵活调用
- ✅ 适合特定任务
- ✅ 减少不必要的步骤

---

#### 方式 3: 任务分类（快速模式）

**适用场景**: 快速开发，明确任务类型

**示例**:
```bash
# 规划任务
[task:planning] 设计后端架构

# 编码任务
[task:coding] 实现 API 端点

# 审查任务
[task:review] 检查代码安全性

# 调试任务
[task:debugging] 修复 bug

# 文档任务
[task:documentation] 生成文档
```

**优点**:
- ✅ 语法简洁
- ✅ 自动路由到合适的 Agent
- ✅ 适合熟练用户

---

### Vibe Coding 四阶段工作流

#### 阶段 1: 创意阶段 💡

**目标**: 用自然语言表达需求和意图

**关键点**:
- ✅ 清晰描述需求
- ✅ 明确功能要求
- ✅ 说明技术栈偏好
- ✅ 提供上下文信息

**示例**:
```bash
❌ 不好: [vibe-architect] 做个博客

✅ 好: [vibe-architect] 设计一个博客系统，支持用户认证、文章管理、评论功能，
  使用 Node.js + Express + MongoDB，需要 RESTful API
```

---

#### 阶段 2: AI 生成阶段 🤖

**目标**: AI 翻译意图为功能原型和代码

**关键点**:
- ✅ Vibe Architect 设计架构
- ✅ Vibe Coder 生成代码
- ✅ 自动应用最佳实践
- ✅ 遵循设计模式

**产出**:
- 架构设计文档
- 功能原型代码
- API 接口定义

---

#### 阶段 3: 调试阶段 🐛

**目标**: 修复问题、优化性能、生成测试

**关键点**:
- ✅ Vibe Debugger 诊断问题
- ✅ 生成全面测试用例
- ✅ 优化性能瓶颈
- ✅ 处理边界情况

**产出**:
- 修复方案
- 测试用例
- 性能优化建议

---

#### 阶段 4: 审查阶段 ✅

**目标**: 质量审查、文档生成、最终交付

**关键点**:
- ✅ Vibe Reviewer 质量审查
- ✅ Vibe Documenter 生成文档
- ✅ Vibe Architect 最终把控
- ✅ 确保交付标准

**产出**:
- 代码审查报告
- 完整文档
- 最终交付物

---

### 最佳实践

#### DO (推荐做法)

1. **明确需求和约束**
   ```bash
   ✅ [vibe-architect] 设计一个博客系统，支持用户认证、文章管理、评论功能，
     使用 Node.js + Express + MongoDB，需要 RESTful API
   ```

2. **合理选择 Agent**
   - 完整项目 → 让 vibe-architect 协调
   - 单一任务 → 直接指定特定 Agent
   - 快速开发 → 使用任务分类

3. **遵循工作流程**
   ```
   架构先行（vibe-architect → vibe-coder）
   质量跟进（vibe-reviewer）
   测试保障（vibe-debugger）
   文档完善（vibe-documenter）
   ```

4. **提供具体反馈**
   ```bash
   ✅ [@vibe-reviewer] 这段代码存在 SQL 注入风险
   ✅ [@vibe-coder] 这个 API 响应格式需要调整
   ```

---

#### DON'T (避免做法)

1. ❌ 对简单任务使用全部 Agent（效率低）
2. ❌ 跳过架构设计直接编码（技术债务）
3. ❌ 忽略代码审查和质量检查（风险高）
4. ❌ 省略测试和文档（维护难）
5. ❌ 完全信任 AI 不进行人工审查（不可靠）

---

### 常见使用场景

#### 场景 1: 快速原型开发

```bash
[vibe-architect] 快速开发一个任务管理应用原型，支持：
  - 任务创建、编辑、删除
  - 任务状态管理
  使用 React + Node.js + MongoDB
```

**预计时间**: 1.5-2 小时

**产出**: 可运行的原型 + 测试 + 文档

---

#### 场景 2: API 开发

```bash
[task:planning] 设计商品管理 API
[task:coding] 实现 CRUD 接口
[task:review] 检查安全性
[task:documentation] 生成 API 文档
```

**预计时间**: 1-1.5 小时

**产出**: 完整 API + 安全审查 + API 文档

---

#### 场景 3: Bug 修复

```bash
[@vibe-debugger] 这个登录接口返回 500 错误：
  Error: Cannot read property 'password' of undefined
  请分析并提供修复方案
```

**预计时间**: 10-20 分钟

**产出**: 问题分析 + 修复方案 + 测试用例

---

#### 场景 4: 代码重构

```bash
[@vibe-reviewer] 审查这段代码的可读性、性能和安全性，提供重构建议
```

**预计时间**: 15-30 分钟

**产出**: 重构方案 + 最佳实践建议

---

### 常见问题

#### Q1: 如何让 AI 生成的代码更符合我的需求？

**A**: 提供更详细的需求描述和上下文信息

```bash
❌ 不好: [vibe-architect] 做个博客

✅ 好: [vibe-architect] 设计一个技术博客系统，要求：
  - 功能: 用户认证、文章管理、评论、标签分类
  - 技术: Node.js + Express + MongoDB + JWT
  - 性能: 支持 1000 并发用户
  - 安全: 防止 SQL 注入、XSS 攻击
  - 部署: 支持 Docker 容器化
```

---

#### Q2: 如果生成的代码有质量问题怎么办？

**A**: 使用质量检查点和多轮迭代

```bash
[vibe-architect] 启动质量保证模式：
  - 三轮迭代优化
  - 每个阶段质量检查
  - 最终全面审查

# Round 1
[@vibe-coder] 生成初稿

# Round 2
[@vibe-reviewer] 深度审查

# Round 3
[@vibe-debugger] 全面验证
```

---

#### Q3: 如何提高开发效率？

**A**: 使用并行开发和任务分类

```bash
[vibe-architect] 并行完成以下模块：
  - 用户认证模块（依赖：无）
  - 商品管理模块（依赖：无）
  - 订单处理模块（依赖：用户、商品）
```

**并行执行**:
- Task 1 和 Task 2 可以并行（无依赖）
- Task 3 等待 Task 1 和 2 完成后执行

---

#### Q4: Vibe Coding 适合什么场景？

**A**: 适合以下场景

| 场景 | 适合度 | 说明 |
|------|--------|------|
| 快速原型开发 | ⭐⭐⭐⭐⭐ | 数小时将想法转化为原型 |
| 个人工具/脚本 | ⭐⭐⭐⭐⭐ | 完美适合快速实现工具 |
| 内部工具/MVP | ⭐⭐⭐⭐⭐ | 快速验证和迭代 |
| 概念验证（POC） | ⭐⭐⭐⭐⭐ | 验证技术可行性 |
| 学习新技术 | ⭐⭐⭐⭐⭐ | 通过对话理解技术 |
| API 开发 | ⭐⭐⭐⭐ | 快速生成 RESTful API |
| 小型 SaaS 应用 | ⭐⭐⭐ | 适合，需架构规划 |
| 中大型企业应用 | ⭐⭐ | 需结合传统工程方法 |

**不适合的场景**:
- ❌ 大规模生产环境（需要严格质量保证）
- ❌ 高安全性系统（需要专业安全审计）
- ❌ 实时交互系统（延迟较高）

---

#### Q5: 如何与其他 SKILL 配合使用？

**A**: 构建完整的开发管道

```bash
# 完整开发管道
/vibe-coding-team        # Agent 团队协作开发
  ↓
/playwright              # 端到端测试
  ↓
/obsidian-markdown      # 格式化为笔记
  ↓
/docx                   # Word 文档
  ↓
/pdf                    # PDF 导出
```

---

## 下一步

### 继续学习

- 📖 [详细使用示例](../usage_examples.md)
- 📋 [快速参考卡片](../../QUICK_REFERENCE.md)
- 📘 [完整文档](../../README.md)
- 🎬 [视频演示指南](../resources/video-demos/demo-scripts.md)

### 实战练习

尝试完成以下练习项目：

1. **入门级**: TODO API (15-30 分钟)
   - 查看 [示例教程](../project-examples/todo-api/README.md)

2. **进阶级**: 博客系统 (1-2 小时)
   - 查看 [完整示例](../project-examples/blog-system/README.md)

3. **挑战级**: 任务管理 UI (1-2 小时)
   - 查看 [前端示例](../project-examples/task-ui/README.md)

### 参与社区

- 🐛 [报告问题](https://github.com/yangmeishux/vibe-coding-team/issues)
- 💡 [功能建议](https://github.com/yangmeishux/vibe-coding-team/discussions)
- 🤝 [贡献代码](https://github.com/yangmeishux/vibe-coding-team/blob/main/CONTRIBUTING.md)
- ⭐ [给项目点赞](https://github.com/yangmeishux/vibe-coding-team)

---

## 总结

通过本指南，您已经学会了：

✅ **Part 1: 快速上手**
- 安装和验证 Vibe Coding Team
- 用 10 分钟完成第一个项目
- 体验 AI Agent 协作开发

✅ **Part 2: 深入理解**
- 理解 5 个 Agent 的职责和使用场景
- 掌握三种使用方式
- 了解 Vibe Coding 四阶段工作流
- 学习最佳实践和常见问题

**下一步**: 开始您的 Vibe Coding 之旅！🚀

---

**需要帮助？**
- 查看 [Issues](https://github.com/yangmeishux/vibe-coding-team/issues)
- 参与 [Discussions](https://github.com/yangmeishux/vibe-coding-team/discussions)
- 阅读 [完整文档](../../README.md)

---

**版本**: 1.0.0
**最后更新**: 2026-01-27
**维护者**: Vibe Coding Team Community
