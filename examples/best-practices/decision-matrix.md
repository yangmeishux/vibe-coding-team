# 实战决策矩阵

根据项目特征快速选择合适的 Agent 组合和使用方式。

---

## 🎯 快速决策表

| 场景特征 | 推荐模式 | 主要 Agent | 辅助 Agent | 预估时间 |
|---------|---------|-----------|-----------|---------|
| 单一 API 开发 | `[@vibe-coder]` | 1个 | 无 | 5-10 min |
| API + 测试 | `[@vibe-coder]` → `[@vibe-debugger]` | 2个 | 无 | 15-20 min |
| 完整 CRUD 模块 | `[vibe-architect]` | 全团队 | - | 30-60 min |
| 全新项目 MVP | `[vibe-architect]` | 全团队 | - | 2-3 小时 |
| 遗留系统维护 | `[task:debugging]` | debugger + reviewer | architect | 30-60 min |
| 代码重构 | `[@vibe-reviewer]` | reviewer + coder | - | 1-2 小时 |
| 性能优化 | `[@vibe-reviewer]` | reviewer + coder | architect | 1-2 小时 |
| 安全审计 | `[@security-advisor]` | security-advisor | reviewer | 30-60 min |
| 漏洞修复 | `[task:debugging]` | debugger + security-advisor | coder | 30-60 min |
| API 文档生成 | `[@vibe-documenter]` | documenter | architect | 15-30 min |
| 架构评审 | `[vibe-architect]` | architect | reviewer | 30-60 min |
| 快速原型 | `[task:quick]` | 任意单个 | 无 | 1-2 小时 |

---

## 📊 场景详细分析

### 场景 1: 新项目启动

**判断标准**:
- 从零开始
- 需要架构设计
- 多个功能模块

**推荐流程**:
```
[vibe-architect] 需求分析 → 架构设计
    ↓
[@vibe-coder] 并行开发各模块
    ↓
[@vibe-reviewer] 代码审查
    ↓
[@vibe-debugger] 测试生成
    ↓
[@vibe-documenter] 文档生成
    ↓
[@security-advisor] 安全审查（可选）
    ↓
[vibe-architect] 整合交付
```

**时间预估**: 2-4 小时（取决于项目规模）

---

### 场景 2: 功能迭代

**判断标准**:
- 已有项目基础
- 新增单一功能
- 不影响现有架构

**推荐流程**:
```
[@vibe-coder] 功能实现
    ↓
[@vibe-debugger] 测试生成
    ↓
[@vibe-reviewer] 代码审查
```

**或者快速模式**:
```
[task:coding] 实现功能
[task:debugging] 生成测试
```

**时间预估**: 30-60 分钟

---

### 场景 3: Bug 修复

**判断标准**:
- 已有错误报告
- 需要定位问题
- 修复并验证

**推荐流程**:
```
[@vibe-debugger] 分析错误 → 定位根因 → 修复方案
    ↓
[@vibe-coder] 实现修复
    ↓
[@vibe-debugger] 生成回归测试
    ↓
[@vibe-reviewer] 审查修复
```

**时间预估**: 15-60 分钟（取决于复杂度）

---

### 场景 4: 代码重构

**判断标准**:
- 代码质量差
- 需要改进设计
- 保持功能不变

**推荐流程**:
```
[@vibe-reviewer] 评估现状 → 重构建议
    ↓
[@vibe-coder] 执行重构
    ↓
[@vibe-debugger] 验证功能（测试）
    ↓
[@vibe-reviewer] 最终审查
```

**时间预估**: 1-3 小时

---

### 场景 5: 安全加固

**判断标准**:
- 安全审计需求
- 漏洞报告
- 合规要求

**推荐流程**:
```
[@security-advisor] 全面安全扫描
    ↓
[@vibe-coder] 修复安全漏洞
    ↓
[@security-advisor] 验证修复
    ↓
[@vibe-reviewer] 代码质量审查
```

**时间预估**: 1-4 小时（取决于漏洞数量）

---

### 场景 6: 性能优化

**判断标准**:
- 性能瓶颈
- 响应时间过长
- 资源使用过高

**推荐流程**:
```
[@vibe-reviewer] 性能分析 → 瓶颈定位
    ↓
[@vibe-coder] 优化实现
    ↓
[@vibe-debugger] 性能测试
    ↓
[@vibe-reviewer] 验证改进
```

**时间预估**: 1-2 小时

---

## 🔄 复杂度评估

### 简单任务（单 Agent）

| 任务 | Agent | 示例 |
|------|-------|------|
| 工具函数 | @vibe-coder | `[@vibe-coder] 实现日期格式化函数` |
| 代码审查 | @vibe-reviewer | `[@vibe-reviewer] 检查这段代码` |
| Bug 分析 | @vibe-debugger | `[@vibe-debugger] 分析这个错误` |
| 文档生成 | @vibe-documenter | `[@vibe-documenter] 生成 API 文档` |
| 安全检查 | @security-advisor | `[@security-advisor] 审查安全性` |

### 中等任务（2-3 Agents）

| 任务 | Agents | 示例 |
|------|--------|------|
| API + 测试 | coder + debugger | `[@vibe-coder] 实现 API` → `[@vibe-debugger] 生成测试` |
| 功能 + 审查 | coder + reviewer | `[@vibe-coder] 实现功能` → `[@vibe-reviewer] 审查` |
| 重构 + 测试 | reviewer + coder + debugger | 见场景 4 |

### 复杂任务（全团队）

| 任务 | 流程 | 示例 |
|------|------|------|
| 新项目 | architect → 全团队 | 见场景 1 |
| 大版本迭代 | architect → coder × N | `[vibe-architect] 协调团队` |
| 系统迁移 | architect + 全团队 | `[vibe-architect] 设计迁移方案` |

---

## 🎭 Agent 组合建议

### 黄金组合（推荐）

| 组合 | 用途 | 效果 |
|------|------|------|
| **Architect + Coder** | 从需求到代码 | 架构落地 |
| **Coder + Debugger** | 代码+测试 | 质量保证 |
| **Reviewer + Security** | 全面质量把关 | 安全可靠 |
| **全团队** | 复杂项目 | 端到端交付 |

### 避免的组合

| 组合 | 原因 |
|------|------|
| Debugger + Documenter | 功能不相关 |
| 多个 Architect | 决策冲突 |
| 过度审查 | 效率低下 |

---

## ⏱️ 时间预估指南

### 基础时间

| 活动 | 时间 | 说明 |
|------|------|------|
| 需求分析 | 10-30 min | 取决于清晰度 |
| 代码生成 | 10-30 min | 取决于复杂度 |
| 代码审查 | 5-15 min | 取决于代码量 |
| 测试生成 | 10-20 min | 取决于覆盖度 |
| 文档生成 | 5-15 min | 取决于详细度 |
| 安全审查 | 15-30 min | 取决于范围 |

### 项目规模乘数

| 规模 | 乘数 | 示例 |
|------|------|------|
| 微型 | 1x | 单一功能 |
| 小型 | 2x | 一个模块 |
| 中型 | 4x | 多个模块 |
| 大型 | 8x+ | 完整系统 |

### 计算示例

小型 API 项目（2 个端点）:
- 需求分析: 15 min
- 代码生成: 20 min × 2 = 40 min
- 审查: 10 min × 2 = 20 min
- 测试: 15 min × 2 = 30 min
- **总计**: ~2 小时

---

## 📝 决策检查清单

选择模式前，回答以下问题：

- [ ] 这是新项目还是现有项目？
- [ ] 需要架构设计吗？
- [ ] 有多少个功能模块？
- [ ] 有安全/性能要求吗？
- [ ] 时间紧迫吗？
- [ ] 需要完整文档吗？

---

## 💡 实用技巧

### 技巧 1: 从简单开始
不确定时，先使用单 Agent，根据需要逐步添加。

### 技巧 2: 并行处理
Architect 可以协调多个 Coder 并行开发独立模块。

### 技巧 3: 质量门控
在关键节点设置检查点：
- 架构评审后
- 编码完成后
- 集成测试前

### 技巧 4: 迭代优化
第一轮快速原型，第二轮质量优化。

---

## 参考

- [Context Engineering](context-engineering.md) - 上下文工程
- [Prompt Engineering](prompt-engineering.md) - 提示词工程
- [SKILL.md](../../SKILL.md) - Agent 详细定义
