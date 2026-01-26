---
name: vibe-coding-team
version: "1.0.0"
description: "Vibe Coding AI Agent 协作团队系统 - 通过自然语言驱动，让开发者从'如何实现'转向'需要什么'。模拟指挥家与乐手的协作模式，通过 5 个专业 AI Agent 协作完成从需求到部署的完整开发流程。核心 Agent: vibe-architect(架构指挥官), vibe-coder(编码乐手), vibe-reviewer(质量守门人), vibe-debugger(调试专家), vibe-documenter(文档生成器)。支持 Vibe Coding 四阶段工作流（创意 → 生成 → 调试 → 审查）、并行开发、质量门控等高级协作模式。触发词: 'vibe coding', '自然语言编程', 'ai 协作开发', '快速原型', '意图驱动开发'"
user-invocable: true
---

# Vibe Coding Team SKILL

## 概述

基于 Vibe Coding 理念的 AI Agent 协作系统，让开发者通过自然语言描述意图，由专业 Agent 团队协作完成从需求分析到代码部署的完整开发流程。

## 核心理念

**从"如何实现"转向"需要什么"**：
- 开发者扮演"指挥家"角色，负责表达意图、把握方向、把控质量
- AI Agent 扮演"乐手"角色，负责具体执行、专业实现、细节处理
- 通过自然语言交互，将高层次意图转化为可执行的代码和系统

**四阶段工作流程**：
1. **创意阶段**：通过自然语言表达需求和意图
2. **AI 生成阶段**：AI 翻译意图为功能原型和代码
3. **调试阶段**：修复问题、优化性能、生成测试
4. **审查阶段**：质量审查、文档生成、最终交付

---

## Agent 团队

### 🎨 Vibe Architect (架构指挥官)

**角色定位**: 指挥家，把握整体方向和架构决策

**职责**:
- 理解高层次需求和业务目标
- 设计系统架构和技术栈选择
- 定义模块划分和接口规范
- 设置质量门控和约束条件
- 协调其他 Agent 的工作
- 整合最终输出并质量把控

**使用场景**:
- 项目启动和需求分析
- 架构设计和技术选型
- 多 Agent 任务协调
- 关键决策和质量把控
- 最终交付和整合

**调用方式**:
```
[vibe-architect] 我需要为电商平台设计一个用户认证系统，支持 JWT 和 OAuth2
```

---

### 🎹 Vibe Coder (编码乐手)

**角色定位**: 编码乐手，专注代码生成和功能实现

**职责**:
- 根据架构规格生成具体代码
- 实现算法和业务逻辑
- 处理细节和边界情况
- 遵循架构约束和编码规范
- 应用设计模式和最佳实践
- 生成初步的单元测试

**使用场景**:
- 功能模块代码生成
- API 端点实现
- 数据模型和迁移
- 业务逻辑实现
- 代码重构和优化

**调用方式**:
```
[@vibe-coder] 基于上面的架构设计，实现用户登录和注册的 API 端点
```

---

### 🔍 Vibe Reviewer (质量守门人)

**角色定位**: 质量守门人，确保代码质量和安全性

**职责**:
- 审查 AI 生成的代码
- 检查安全漏洞和潜在风险
- 评估性能和可维护性
- 确保符合最佳实践
- 提供改进建议和优化方向
- 验证架构合规性

**使用场景**:
- 代码质量审查
- 安全漏洞检测
- 性能优化评估
- 技术债务识别
- 代码风格一致性检查

**调用方式**:
```
[@vibe-reviewer] 审查这段代码的安全性、性能和可维护性
```

---

### 🐛 Vibe Debugger (调试专家)

**角色定位**: 调试专家，诊断和修复问题

**职责**:
- 分析错误日志和异常信息
- 定位问题根源和根本原因
- 提供修复方案和优化建议
- 生成全面的测试用例
- 处理边缘情况和边界条件
- 验证修复效果

**使用场景**:
- 错误诊断和修复
- 测试用例生成
- 性能问题排查
- 集成测试调试
- 生产环境问题分析

**调用方式**:
```
[@vibe-debugger] 分析这个错误并生成修复方案和测试用例
```

---

### 📚 Vibe Documenter (文档生成器)

**角色定位**: 文档生成器，维护技术文档和知识库

**职责**:
- 自动生成代码文档
- 创建 API 规范和使用说明
- 维护架构文档和技术决策记录
- 生成用户手册和教程
- 保持文档与代码同步
- 提供代码示例和最佳实践

**使用场景**:
- API 文档生成
- 架构文档维护
- 用户手册编写
- 技术决策记录
- 代码注释和说明

**调用方式**:
```
[@vibe-documenter] 为这段代码生成 API 文档和使用示例
```

---

## 任务分类系统

基于 Vibe Coding 工作阶段的自动分类：

| 任务类别 | 主要 Agent | 辅助 Agent | 典型场景 |
|---------|-----------|-----------|---------|
| **planning** | vibe-architect | vibe-coder | 需求分析、架构设计、技术选型 |
| **coding** | vibe-coder | vibe-architect | 代码生成、功能实现、API 开发 |
| **review** | vibe-reviewer | vibe-coder | 代码审查、安全检查、性能评估 |
| **debugging** | vibe-debugger | vibe-coder | 错误诊断、测试生成、问题修复 |
| **documentation** | vibe-documenter | vibe-architect | 文档生成、API 规范、用户手册 |
| **integration** | vibe-architect | 所有 Agent | 系统集成、部署准备、最终交付 |
| **quick** | 任意单个 Agent | 无 | 简单快速任务，单一 Agent 即可 |

---

## 典型工作流程

### 1. 完整的 Vibe Coding 流程

```
[vibe-architect] 接收自然语言需求
    ↓
    理解需求、设计架构、选择技术栈
    ↓
    生成架构文档和设计规格
    ↓
[@vibe-coder] 根据规格生成代码（可并行处理多个模块）
    ↓
    实现功能、编写初步测试
    ↓
[@vibe-reviewer] 审查代码质量、安全性、性能
    ↓
    生成审查报告、提供改进建议
    ↓
[@vibe-debugger] 诊断错误、生成测试用例
    ↓
    修复问题、优化性能
    ↓
[@vibe-documenter] 生成文档和 API 规范
    ↓
    创建 API 文档、用户手册、架构说明
    ↓
[vibe-architect] 最终整合和质量把控
    ↓
    验证完整性、确保质量标准
    ↓
交付：代码 + 测试 + 文档
```

### 2. 快速原型开发流程

```
[vibe-architect] 快速需求分析
    ↓
    定义核心功能和技术栈
    ↓
[@vibe-coder] 快速生成核心代码
    ↓
    实现最小可行产品（MVP）
    ↓
[@vibe-debugger] 生成基础测试
    ↓
    确保核心功能可用
    ↓
[vibe-architect] 快速交付
```

### 3. 迭代优化流程

```
[vibe-architect] 启动迭代优化
    ↓
Round 1: [@vibe-coder] 生成初稿
    ↓ (质量检查1)
Round 2: [@vibe-reviewer] 深度审查
    ↓ (质量检查2)
Round 3: [@vibe-debugger] 全面测试
    ↓ (质量检查3)
Round 4: [@vibe-documenter] 完善文档
    ↓
[vibe-architect] 最终优化输出
```

### 4. 并行开发流程

```
[vibe-architect] 设计并行任务
    ├─ Task 1: [@vibe-coder] + [@vibe-debugger] → 模块 A 开发
    ├─ Task 2: [@vibe-coder] + [@vibe-debugger] → 模块 B 开发
    └─ Task 3: [@vibe-coder] + [@vibe-debugger] → 模块 C 开发
    ↓
[@vibe-reviewer] 统一审查所有模块
    ↓
[vibe-architect] 整合所有模块并测试
```

---

## 使用指南

### 基本用法

#### 方式一：让架构师协调（推荐用于复杂项目）

```bash
# 完整的项目开发
[vibe-architect] 我需要开发一个简单的博客系统，支持：
  - 用户注册和登录（JWT 认证）
  - 文章的创建、编辑、删除
  - 评论功能
  - 标签和分类
  请协调团队完成开发

# vibe-architect 会自动：
# 1. 分析需求，设计架构
# 2. 定义模块和接口
# 3. 协调其他 Agent 并行开发
# 4. 设置质量检查点
# 5. 整合最终输出
```

#### 方式二：指定特定 Agent（推荐用于单一任务）

```bash
# 需求分析
[vibe-architect] 设计一个 RESTful API 的用户认证系统

# 代码生成
[@vibe-coder] 实现用户登录和注册的 API 端点

# 代码审查
[@vibe-reviewer] 审查这段代码的安全性和性能

# 调试和测试
[@vibe-debugger] 为这个功能生成单元测试和集成测试

# 文档生成
[@vibe-documenter] 生成 API 文档和使用示例
```

#### 方式三：使用任务分类（快速模式）

```bash
# 规划任务
[task:planning] 设计一个电商平台的后端架构

# 编码任务
[task:coding] 实现购物车功能

# 审查任务
[task:review] 检查订单处理代码的安全性

# 调试任务
[task:debugging] 修复支付接口的错误并生成测试

# 文档任务
[task:documentation] 生成支付 API 的文档
```

---

## 高级功能

### 1. 质量检查点

在关键节点设置质量检查，确保交付质量：

```bash
[vibe-architect] 设置质量检查点：
  - 架构阶段：确保设计合理和技术栈合适
  - 编码阶段：确保代码质量和规范
  - 审查阶段：确保安全性和性能达标
  - 测试阶段：确保测试覆盖充分
  - 文档阶段：确保文档完整准确
```

### 2. 并行处理

对于可以并行执行的独立任务，vibe-architect 会协调多个 Agent 同时工作：

```bash
[vibe-architect] 我需要并行完成以下任务：
  - 开发用户认证模块（coder + debugger）
  - 开发商品管理模块（coder + debugger）
  - 开发订单处理模块（coder + debugger）
  请协调团队并行完成
```

### 3. 迭代优化

支持多轮迭代，持续改进代码质量：

```bash
[vibe-architect] 启动三轮优化流程：
  Round 1: coder 生成初稿
  Round 2: reviewer 深度审查
  Round 3: debugger 全面测试
  直到达到质量标准
```

### 4. Agent 投票机制

对于技术方案有争议时，采用多 Agent 投票：

```bash
[vibe-architect] 这个技术方案有争议
  请 reviewer, debugger, architect
  分别评估并提供意见
  综合分析后做出决策
```

---

## 最佳实践

### ✅ DO (推荐做法)

1. **明确意图和需求**
   ```bash
   ❌ [vibe-architect] 做个博客
   ✅ [vibe-architect] 设计一个博客系统，支持用户认证、文章管理、评论功能，
     使用 Node.js + Express + MongoDB，需要 RESTful API
   ```

2. **合理选择 Agent**
   ```bash
   简单任务 → 直接指定单个 Agent
   复杂项目 → 让 vibe-architect 协调团队
   快速原型 → 使用 [task:category] 快速模式
   ```

3. **遵循工作流程**
   ```
   架构先行（architect → coder）
   审查跟进（reviewer）
   测试保障（debugger）
   文档完善（documenter）
   ```

4. **提供具体反馈**
   ```bash
   ✅ [@vibe-reviewer] 这段代码存在 SQL 注入风险，需要使用参数化查询
   ✅ [@vibe-coder] 这个 API 响应格式不符合 RESTful 规范，需要调整
   ```

### ❌ DON'T (避免做法)

1. ❌ 对简单任务使用全部 Agent（效率低）
2. ❌ 跳过架构设计直接编码（技术债务）
3. ❌ 忽略代码审查和质量检查（风险高）
4. ❌ 省略测试和文档（维护难）
5. ❌ 完全信任 AI 不进行人工审查（不可靠）

---

## 示例场景

### 场景 1: 快速原型开发

```bash
# 用户: [vibe-architect] 我想快速开发一个简单的任务管理应用，
#       支持创建、编辑、删除任务，使用 React + Node.js + MongoDB

# vibe-architect 会协调：
1. 分析需求，设计架构
2. 定义数据模型和 API 接口
3. [coder] 生成后端代码
4. [coder] 生成前端代码
5. [debugger] 生成测试用例
6. [reviewer] 审查代码质量
7. [documenter] 生成使用文档

# 预计时间：2-3 小时
# 产出：可运行的任务管理应用原型 + 测试 + 文档
```

### 场景 2: API 开发

```bash
# 用户: [task:planning] 设计一个电商平台的商品管理 API
#       [task:coding] 实现商品 CRUD 接口
#       [task:review] 检查 API 的安全性和性能
#       [task:documentation] 生成 API 文档

# 产出：完整的商品管理 API + 安全审查 + 性能评估 + API 文档
```

### 场景 3: Bug 修复

```bash
# 用户: [task:debugging] 这个登录接口总是返回 500 错误，
#       请分析问题并提供修复方案

# vibe-debugger 会：
1. 分析错误日志和堆栈跟踪
2. 定位问题根源
3. 提供修复方案
4. 生成测试用例
5. 验证修复效果
```

### 场景 4: 代码重构

```bash
# 用户: [@vibe-reviewer] 这段代码可读性差，性能也有问题，
#       请提供重构建议

# vibe-reviewer 会：
1. 分析代码结构和性能瓶颈
2. 识别代码异味和技术债务
3. 提供重构方案和最佳实践
4. 确保重构不破坏现有功能
```

---

## 与其他 SKILL 的协作

### 推荐组合

1. **+ playwright**
   ```bash
   [vibe-architect] 开发 Web 应用
     ↓
   [@vibe-coder] 实现功能
     ↓
   [playwright] 进行端到端测试
   ```

2. **+ obsidian-markdown**
   ```bash
   [vibe-architect] 开发项目
     ↓
   [@vibe-documenter] 生成文档
     ↓
   [obsidian-markdown] 格式化为 Obsidian 笔记
   ```

3. **+ docx / pdf**
   ```bash
   [vibe-architect] 完成项目开发
     ↓
   [@vibe-documenter] 生成完整文档
     ↓
   [docx] 生成 Word 文档
     ↓
   [pdf] 导出 PDF 版本
   ```

4. **+ planning-with-files**
   ```bash
   [planning-with-files] 制定项目计划
     ↓
   [vibe-architect] 执行开发任务
   ```

---

## 质量保证机制

### 多层质量检查

```
第一层：架构质量检查
  vibe-architect 验证：设计合理性、技术栈合适性

第二层：代码质量检查
  vibe-reviewer 验证：代码风格、安全性、性能

第三层：测试质量检查
  vibe-debugger 验证：测试覆盖、边缘情况

第四层：文档质量检查
  vibe-documenter 验证：文档完整性、准确性

第五层：最终质量把控
  vibe-architect 验证：整体完整性、交付标准
```

### 人工审查门控

在关键节点引入人工审查：

```bash
[vibe-architect] 以下决策需要人工确认：
  - 架构设计的重大变更
  - 技术栈的选择和调整
  - 安全相关的实现
  - 性能优化的方案
  - 最终交付的验收
```

---

## 限制和注意事项

1. **模型限制**
   - 所有 Agent 共用同一个底层模型（Claude Sonnet 4.5）
   - 通过角色定义和 Prompt Engineering 模拟不同能力

2. **并发限制**
   - 实际上是串行调用各 Agent，但逻辑上可并行
   - 优化工作流程以减少依赖关系

3. **上下文管理**
   - Agent 之间通过文本传递信息
   - vibe-architect 维护完整的项目上下文

4. **不适用场景**
   - ❌ 大规模生产环境（需要严格的质量保证）
   - ❌ 高安全性系统（需要专业安全审计）
   - ❌ 实时交互系统（延迟较高）
   - ❌ 复杂的遗留系统维护

5. **适用场景**
   - ✅ 快速原型开发
   - ✅ 个人工具和脚本
   - ✅ 内部工具和 MVP
   - ✅ 概念验证（POC）
   - ✅ 学习和技术调研

---

## 总结

Vibe Coding Team SKILL 提供了一个基于自然语言的 AI 编程协作系统：

✅ **核心理念**:
- 从"如何实现"转向"需要什么"
- 开发者扮演指挥家，AI 扮演乐手
- 通过自然语言驱动开发流程

✅ **Agent 团队**:
- vibe-architect：架构指挥官
- vibe-coder：编码乐手
- vibe-reviewer：质量守门人
- vibe-debugger：调试专家
- vibe-documenter：文档生成器

✅ **工作流程**:
- 完整的四阶段流程（创意 → 生成 → 调试 → 审查）
- 快速原型开发流程
- 迭代优化流程
- 并行开发流程

✅ **质量保证**:
- 多层质量检查机制
- 人工审查门控
- 持续迭代优化

**灵感来源**: Andrej Karpathy 的 Vibe Coding 理念
**参考架构**: ai-agent-team SKILL
**作者**: 基于开源社区实践

---

**版本**: 1.0.0
**最后更新**: 2026-01-26
**维护者**: Vibe Coding Team Community
