# Vibe Coding Team - 使用示例

本文档提供了 Vibe Coding Team SKILL 的详细使用示例。

## 目录

- [基础示例](#基础示例)
- [进阶示例](#进阶示例)
- [专业场景](#专业场景)
- [故障排除](#故障排除)

---

## 基础示例

### 示例 1: 快速测试

```bash
claude
> [vibe-architect] 测试一下 Vibe Coding Team 是否正常工作
```

**预期输出**: Vibe Architect 应该协调所有 Agent 进行简单测试。

---

### 示例 2: 单个 Agent 调用

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

---

### 示例 3: 任务分类

```bash
# 规划任务
[task:planning] 设计一个博客系统的后端架构

# 编码任务
[task:coding] 实现文章的 CRUD 接口

# 审查任务
[task:review] 检查评论功能的安全性

# 调试任务
[task:debugging] 修复支付接口的错误并生成测试

# 文档任务
[task:documentation] 生成 API 文档
```

---

## 进阶示例

### 示例 4: 快速原型开发

```bash
> [vibe-architect] 我想快速开发一个简单的任务管理应用，支持：
  - 任务的创建、编辑、删除
  - 任务状态管理（待办、进行中、已完成）
  - 任务标签和分类
  使用 React + Node.js + MongoDB，请协调团队完成

# Vibe Architect 会自动协调：
# 1. 分析需求，设计架构
# 2. 定义数据模型和 API 接口
# 3. [coder] 生成后端代码（Express + MongoDB）
# 4. [coder] 生成前端代码（React）
# 5. [reviewer] 审查代码质量、安全性、性能
# 6. [debugger] 生成测试用例
# 7. [documenter] 生成使用文档
# 8. 整合并质量把控
```

**预期产出**: 可运行的任务管理应用原型 + 测试 + 完整文档

**预计时间**: 2-3 小时

---

### 示例 5: API 开发

```bash
> [vibe-architect] 我需要开发一个电商平台的商品管理 API

# 工作流程：
# Phase 1: 需求分析与架构设计
#   ├─ Vibe Architect 需求分析
#   └─ Vibe Architect 架构设计
#
# Phase 2: 代码生成
#   └─ Vibe Coder 实现 CRUD API
#
# Phase 3: 质量审查
#   ├─ Vibe Reviewer 安全审查
#   └─ Vibe Reviewer 性能评估
#
# Phase 4: 测试生成
#   └─ Vibe Debugger 生成测试用例
#
# Phase 5: 文档生成
#   └─ Vibe Documenter 生成 API 文档
#
# Phase 6: 最终交付
#   └─ Vibe Architect 整合并质量把控
```

**预期产出**: 完整的商品管理 API + 安全审查 + 性能评估 + API 文档 + 测试用例

---

### 示例 6: Bug 修复

```bash
> [@vibe-debugger] 这个登录接口总是返回 500 错误，错误日志如下：
  Error: Cannot read property 'password' of undefined
  at /routes/auth.js:25
  请分析问题并提供修复方案和测试用例

# Vibe Debugger 会：
# 1. 分析错误日志和堆栈跟踪
# 2. 定位问题根源
# 3. 提供修复方案
# 4. 生成测试用例
# 5. 验证修复效果
```

**预期产出**:
- 问题分析报告
- 修复方案
- 测试用例
- 验证结果

---

### 示例 7: 并行开发

```bash
> [vibe-architect] 我需要同时完成以下任务：
  - 开发用户认证模块
  - 开发商品管理模块
  - 开发订单处理模块
  请协调团队并行完成这些任务

# Vibe Architect 会设计并行执行方案：
# Task 1: Coder + Debugger → 用户认证模块
# Task 2: Coder + Debugger → 商品管理模块
# Task 3: Coder + Debugger → 订单处理模块
# 然后整合所有结果
```

---

## 专业场景

### 场景 1: 全栈应用开发

```bash
# 1. 项目规划
> [vibe-architect] 我要开发一个在线教育平台，包括：
  - 用户系统（学生、教师、管理员）
  - 课程管理
  - 视频播放
  - 作业和考试
  - 讨论区
  使用 React + Node.js + MongoDB + Redis

# 2. 后端开发
> [task:planning] 设计后端架构
> [task:coding] 实现 RESTful API
> [task:review] 检查 API 安全性和性能

# 3. 前端开发
> [task:coding] 实现 React 组件
> [task:review] 检查前端性能和可访问性

# 4. 测试
> [task:debugging] 生成端到端测试
> 使用 /playwright 进行自动化测试

# 5. 文档
> [task:documentation] 生成完整文档
> [docx] 生成 Word 版本
> [pdf] 导出 PDF 版本
```

---

### 场景 2: 微服务架构

```bash
# 1. 架构设计
> [vibe-architect] 设计一个电商微服务架构，包括：
  - 用户服务
  - 商品服务
  - 订单服务
  - 支付服务
  - 消息服务

# 2. 服务开发
> [task:coding] 实现用户服务（Node.js）
> [task:coding] 实现商品服务（Node.js）
> [task:coding] 实现订单服务（Python）
> [task:coding] 实现支付服务（Go）

# 3. 服务集成
> [task:integration] 实现服务间通信（gRPC + RabbitMQ）
> [task:debugging] 生成集成测试

# 4. 部署准备
> [task:documentation] 生成部署文档和 Kubernetes 配置
```

---

### 场景 3: 代码重构

```bash
# 1. 代码审查
> [@vibe-reviewer] 审查这个项目的代码质量，
  识别技术债务和改进点

# 2. 重构方案
> [vibe-architect] 基于审查结果，制定重构计划

# 3. 执行重构
> [task:coding] 重构用户模块
> [task:coding] 重构订单模块
> [task:coding] 重构支付模块

# 4. 质量保证
> [task:review] 审查重构后的代码
> [task:debugging] 生成测试用例并验证

# 5. 文档更新
> [task:documentation] 更新架构文档和 API 文档
```

---

### 场景 4: 性能优化

```bash
# 1. 性能分析
> [@vibe-reviewer] 分析这个应用的性能瓶颈

# 2. 优化方案
> [vibe-architect] 制定性能优化计划

# 3. 执行优化
> [task:coding] 优化数据库查询
> [task:coding] 实现缓存策略（Redis）
> [task:coding] 优化前端渲染性能

# 4. 验证优化
> [task:debugging] 生成性能测试
> [task:review] 验证优化效果

# 5. 文档记录
> [task:documentation] 记录优化决策和最佳实践
```

---

### 场景 5: 安全审计

```bash
# 1. 安全审查
> [@vibe-reviewer] 对这个应用进行全面的安全审计

# 2. 漏洞修复
> [task:coding] 修复 SQL 注入漏洞
> [task:coding] 修复 XSS 漏洞
> [task:coding] 修复 CSRF 漏洞
> [task:coding] 实现输入验证和输出编码

# 3. 安全测试
> [task:debugging] 生成安全测试用例

# 4. 文档更新
> [task:documentation] 生成安全最佳实践文档
```

---

## 高级技巧

### 技巧 1: 迭代优化

```bash
> [vibe-architect] 启动三轮优化流程：
  Round 1: Coder 生成初稿
  Round 2: Reviewer 深度审查
  Round 3: Debugger 全面验证
  直到达到质量标准

# 每轮迭代质量会明显提升
```

---

### 技巧 2: 质量检查点

```bash
> [vibe-architect] 在每个阶段设置质量检查点：
  ✓ 架构阶段：确保设计合理和技术栈合适
  ✓ 编码阶段：确保代码质量和规范
  ✓ 审查阶段：确保安全性和性能达标
  ✓ 测试阶段：确保测试覆盖充分
  ✓ 文档阶段：确保文档完整准确
```

---

### 技巧 3: Agent 投票机制

```bash
> [vibe-architect] 这个技术方案有争议，
  请 Reviewer, Debugger, Architect
  分别评估并提供意见
  综合分析后做出决策

# 多 Agent 投票提高决策质量
```

---

### 技巧 4: 自定义质量标准

```bash
> [vibe-architect] 设置质量标准：
  - 代码覆盖率 > 80%
  - 所有 API 响应时间 < 200ms
  - 无已知安全漏洞
  - 遵循 Google JavaScript 风格指南
  - 所有公共 API 都有文档

  请确保所有输出符合这些标准
```

---

## 与其他 SKILL 配合

### 组合 1: 完整开发管道

```bash
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

### 组合 2: API 开发管道

```bash
/vibe-coding-team        # API 开发
  ↓
/playwright              # API 测试
  ↓
/obsidian-markdown      # API 文档
  ↓
/docx                   # 导出 API 规范
```

---

### 组合 3: 知识管理管道

```bash
/vibe-coding-team        # 开发项目
  ↓
/obsidian-markdown      # 格式化文档
  ↓
/obsidian-bases         # 建立数据库
  ↓
/obsidian-canvas-creator  # 创建知识图谱
```

---

## 故障排除

### 问题 1: Agent 响应不符合预期

**解决方案**:
1. 提供更具体的任务描述
2. 增加上下文信息
3. 明确技术栈和约束条件

```bash
# ❌ 不好
[vibe-architect] 做个博客

# ✅ 好
[vibe-architect] 设计一个博客系统，支持用户认证、文章管理、评论功能，
  使用 Node.js + Express + MongoDB，需要 RESTful API 和响应式前端
```

---

### 问题 2: 流程太慢

**解决方案**:
1. 使用快速模式
2. 减少不必要的 Agent
3. 并行处理独立任务

```bash
# 标准模式（2-3小时）
[vibe-architect] 完整流程开发

# 快速模式（1小时）
[task:coding] 快速实现
[task:review] 简要审查
[task:documentation] 生成文档
```

---

### 问题 3: 质量不够高

**解决方案**:
1. 启用多轮迭代
2. 设置质量检查点
3. 明确质量标准

```bash
[vibe-architect] 启动质量保证模式：
  - 三轮迭代优化
  - 每个阶段质量检查
  - 最终全面审查
```

---

## 最佳实践总结

### ✅ DO

1. **明确需求和约束**
   - 清楚描述你想要什么
   - 提供充分的技术上下文
   - 明确质量标准和约束条件

2. **合理选择 Agent**
   - 完整项目用 vibe-architect
   - 单一任务用单个 Agent
   - 快速开发用任务分类

3. **遵循工作流程**
   - 架构先行
   - 质量跟进
   - 测试保障
   - 文档完善

4. **提供具体反馈**
   - 给出具体建议
   - 明确改进方向
   - 提供上下文信息

### ❌ DON'T

1. 不要对简单任务用全部 Agent
2. 不要跳过架构设计和质量检查
3. 不要省略测试和文档
4. 不要完全信任 AI 不进行人工审查

---

## 更多资源

- [快速参考](../QUICK_REFERENCE.md)
- [完整文档](../README.md)
- [SKILL 配置](../SKILL.md)
- [贡献指南](../CONTRIBUTING.md)
- [更新日志](../CHANGELOG.md)

---

**需要帮助？** 查看 [Issues](https://github.com/yourusername/vibe-coding-team/issues) 或 [Discussions](https://github.com/yourusername/vibe-coding-team/discussions)

---

*最后更新: 2026-01-26*
