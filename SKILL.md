---
name: vibe-coding-team
version: "2.0.0"
description: "Vibe Coding AI Agent 协作团队系统 v2.0。基于工程化流程的专业软件开发：设计验证 → 详细计划 → TDD实现 → 双阶段审查 → 质量交付。触发词: vibe-coding, vibe-coding:design, vibe-coding:plan, vibe-architect, @vibe-coder, @vibe-reviewer, @vibe-debugger, @vibe-documenter"
user-invocable: true
---

# Vibe Coding Team SKILL v2.0

## 核心理念

### 从"如何实现"转向"需要什么"

开发者扮演**指挥家**角色，负责表达意图、把控方向、验证质量。
AI Agent 扮演**乐手**角色，通过严格工程流程完成专业实现。

### 五大铁律 (Iron Laws)

```
┌─────────────────────────────────────────────────────────────┐
│ 铁律 1: 没有设计验证，不开始编码                              │
│ 铁律 2: 没有详细计划，不开始实现                              │
│ 铁律 3: 没有失败的测试，不写生产代码                          │
│ 铁律 4: 没有根因分析，不尝试修复                              │
│ 铁律 5: 没有双阶段审查，不标记任务完成                        │
└─────────────────────────────────────────────────────────────┘
```

> **Violating the letter of the rules is violating the spirit of the rules.**

---

## 五阶段工程流程

```
┌──────────────────────────────────────────────────────────────────────┐
│                      VIBE CODING WORKFLOW 2.0                        │
├──────────────────────────────────────────────────────────────────────┤
│                                                                       │
│  Phase 1: 设计        Phase 2: 准备       Phase 3: 实现               │
│  ┌─────────┐         ┌─────────┐         ┌─────────┐                 │
│  │ 头脑风暴 │    →    │ 隔离环境 │    →    │ TDD编码 │                 │
│  │ 方案探索 │         │ 详细计划 │         │ 子代理  │                 │
│  └─────────┘         └─────────┘         └─────────┘                 │
│       │                   │                   │                       │
│       ↓                   ↓                   ↓                       │
│  设计文档              计划文档              可运行代码                │
│                                                                       │
│  Phase 4: 质量        Phase 5: 交付                                   │
│  ┌─────────┐         ┌─────────┐                                     │
│  │ 双审 查  │    →    │ 最终整合 │                                     │
│  │ 全面测试 │         │ 交付归档 │                                     │
│  └─────────┘         └─────────┘                                     │
│       │                   │                                          │
│       ↓                   ↓                                          │
│  质量报告              生产就绪                                       │
│                                                                       │
└──────────────────────────────────────────────────────────────────────┘
```

---

## 触发词系统

### 主触发词

| 触发词 | 模式 | 说明 |
|--------|------|------|
| `[vibe-coding]` | 完整流程 | 从设计到交付的完整五阶段流程 |
| `[vibe-coding:design]` | 仅设计 | 只执行 Phase 1: 头脑风暴和设计验证 |
| `[vibe-coding:plan]` | 仅计划 | 只执行 Phase 2: 基于设计文档创建实施计划 |
| `[vibe-coding:quick]` | 快速模式 | 跳过部分阶段，适合原型开发 |

### Agent 触发词

| 触发词 | Agent | 用途 |
|--------|-------|------|
| `[vibe-architect]` | Vibe Architect | 架构设计、流程协调 |
| `[@vibe-coder]` | Vibe Coder | 代码实现 (强制 TDD) |
| `[@vibe-reviewer]` | Vibe Reviewer | 双阶段代码审查 |
| `[@vibe-debugger]` | Vibe Debugger | 系统化调试 |
| `[@vibe-documenter]` | Vibe Documenter | 文档生成和维护 |
| `[@security-advisor]` | Security Advisor | 安全审查 |

### 任务分类触发词

| 触发词 | 类别 | 主要 Agent |
|--------|------|-----------|
| `[task:design]` | 设计任务 | vibe-architect |
| `[task:plan]` | 计划任务 | vibe-architect |
| `[task:coding]` | 编码任务 | vibe-coder |
| `[task:review]` | 审查任务 | vibe-reviewer |
| `[task:debugging]` | 调试任务 | vibe-debugger |
| `[task:documentation]` | 文档任务 | vibe-documenter |
| `[task:security]` | 安全任务 | security-advisor |

---

## Phase 1: 设计阶段 (Design Phase)

### 目标
通过苏格拉底式对话澄清需求，探索多种方案，生成经过验证的设计文档。

### 流程

```
用户提出需求
     ↓
[vibe-architect] 检查现有项目上下文
     ↓
逐轮提问澄清 (一次一个问题)
     ↓
探索 2-3 种方案及权衡
     ↓
增量式展示设计 (200-300字/段)
     ↓
用户确认
     ↓
生成设计文档 → docs/plans/YYYY-MM-DD-<feature>-design.md
```

### 设计文档模板

```markdown
# [Feature Name] Design

> **Status**: [Draft/Review/Approved]
> **Date**: YYYY-MM-DD
> **Author**: vibe-architect

## Goal
一句话描述目标

## Architecture
2-3句话描述架构方案

## Key Decisions
| 决策 | 选项 | 选择 | 理由 |
|------|------|------|------|

## Components
- Component A: 职责、接口
- Component B: 职责、接口

## Data Flow
```
[输入] → [处理] → [输出]
```

## Error Handling
- 错误场景1: 处理方式
- 错误场景2: 处理方式

## Testing Strategy
- 单元测试覆盖点
- 集成测试场景

## Open Questions
- [ ] 待确认问题1
- [ ] 待确认问题2
```

### 质量门禁

- [ ] 需求澄清完成 (至少3轮问答)
- [ ] 2-3种方案已探索并对比
- [ ] 架构图或组件图已绘制
- [ ] 边界情况和错误处理已考虑
- [ ] 用户已确认设计

---

## Phase 2: 准备阶段 (Preparation Phase)

### 目标
创建隔离开发环境，生成详细可执行的实施计划。

### 子阶段 2a: 环境准备

```bash
[vibe-architect] 激活 using-git-worktrees 技能

1. 检测项目类型 (Node.js/Python/Rust/Go)
2. 创建隔离工作区 (.worktrees/<branch-name>)
3. 运行项目设置 (npm install / pip install / cargo build)
4. 验证干净基线 (所有现有测试通过)
5. 报告: 工作区就绪，测试通过 X 个
```

### 子阶段 2b: 计划编写

```bash
[vibe-architect] 激活 writing-plans 技能

基于设计文档，生成实施计划:
- docs/plans/YYYY-MM-DD-<feature>-plan.md
```

### 计划文档结构

```markdown
# [Feature Name] Implementation Plan

> **For Claude**: REQUIRED SUB-SKILL: Use subagent-driven-development
> **Based on**: [link to design doc]
> **Goal**: [One sentence]
> **Architecture**: [2-3 sentences]

## Task 1: [Component Name]

**Files:**
- Create: `exact/path/to/file.py`
- Modify: `exact/path/to/existing.py:123-145`
- Test: `tests/path/to/test_file.py`

**Context:**
[Scene-setting context for implementer]

**Steps:**

### Step 1: Write failing test
```python
def test_specific_behavior():
    result = function(input)
    assert result == expected
```

### Step 2: Verify test fails
Run: `pytest tests/path/test.py::test_name -v`
Expected: FAIL with "function not defined"

### Step 3: Write minimal implementation
```python
def function(input):
    return expected
```

### Step 4: Verify test passes
Run: `pytest tests/path/test.py::test_name -v`
Expected: PASS

### Step 5: Refactor (if needed)
[What to clean up]

### Step 6: Commit
```bash
git add tests/path/test.py src/path/file.py
git commit -m "feat: add specific feature"
```

## Task 2: [Next Component]
...
```

### 任务粒度要求

**每个任务 2-5 分钟完成:**
- ✅ "Write failing test for email validation"
- ✅ "Run test to confirm it fails"
- ✅ "Implement minimal email regex"
- ❌ "Implement authentication system" (太大)
- ❌ "Add validation" (太模糊)

### 质量门禁

- [ ] 任务粒度符合 2-5 分钟标准
- [ ] 每个任务有精确文件路径
- [ ] 每个任务有完整代码示例
- [ ] 每个任务有验证命令和预期输出
- [ ] 任务间依赖关系清晰

---

## Phase 3: 实现阶段 (Implementation Phase)

### 目标
通过子代理驱动或计划执行，完成所有任务的编码实现。

### 模式 A: 子代理驱动 (推荐用于当前会话)

```bash
[vibe-architect] 激活 subagent-driven-development 技能

核心原则: Fresh subagent per task + two-stage review

每个任务循环:
1. 派遣实现子代理 (完整任务上下文)
   ├─ 子代理可提问澄清
   ├─ 严格遵循 TDD: 红→绿→重构
   └─ 自审查后提交
   
2. 派遣规格审查子代理
   ├─ 对比计划验证实现完整性
   ├─ 检查是否过度实现 (YAGNI)
   └─ 返回: ✅ 通过 或 ❌ 问题列表
   
3. 如有问题 → 实现子代理修复 → 重新审查

4. 派遣代码质量审查子代理
   ├─ 测试覆盖率
   ├─ 代码风格和最佳实践
   ├─ 安全扫描
   └─ 返回: ✅ 通过 或 ❌ 问题列表
   
5. 如有问题 → 实现子代理修复 → 重新审查

6. 标记任务完成 → 下一个任务
```

### 模式 B: 计划执行 (推荐用于大项目)

```bash
在新会话中:
[vibe-architect] 激活 executing-plans 技能

- 批量执行任务
- 人工检查点
- 适合长时间运行
```

### TDD 铁律 (强制)

```
┌────────────────────────────────────────────────────┐
│                 TDD CYCLE                          │
│                                                    │
│   ┌─────┐      ┌─────────┐      ┌─────┐          │
│   │ RED │  →   │ VERIFY  │  →   │GREEN│          │
│   │写测试│      │ 看失败   │      │最小代码│          │
│   └─────┘      └─────────┘      └─────┘          │
│      ↑                              │             │
│      └──────────┬───────────────────┘             │
│                 ↓                                  │
│            ┌─────────┐      ┌────────┐           │
│            │ VERIFY  │  →   │REFACTOR│           │
│            │ 看通过   │      │  重构   │           │
│            └─────────┘      └────────┘           │
│                                                    │
│   NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST │
└────────────────────────────────────────────────────┘
```

**红阶段要求:**
- 测试名称清晰描述行为
- 测试一个行为 (有"and"就拆分)
- 使用真实代码 (避免 mock)
- 运行确认失败，且失败原因正确

**绿阶段要求:**
- 最小代码通过测试
- 不添加"以后会用到"的功能
- 不重构其他代码

**重构阶段要求:**
- 仅在测试通过后进行
- 消除重复
- 改进命名
- 保持测试绿色

### 质量门禁

- [ ] 每个新功能先有失败的测试
- [ ] 每次提交前所有测试通过
- [ ] 输出无 error/warning
- [ ] 规格审查通过
- [ ] 代码质量审查通过

---

## Phase 4: 质量阶段 (Quality Phase)

### 目标
全面验证实现质量，确保符合标准。

### 子阶段 4a: 最终代码审查

```bash
[@vibe-reviewer] 执行最终审查

1. 计划对齐分析
   - 对比实现 vs 原始计划
   - 识别偏离项及理由
   - 验证所有功能已实现

2. 代码质量评估
   - 代码风格和规范
   - 错误处理和类型安全
   - 测试覆盖和质量

3. 架构和设计审查
   - SOLID 原则遵循
   - 关注点分离
   - 可扩展性考虑

4. 文档和标准
   - 代码注释完整性
   - 文档同步更新

输出: 审查报告 (Critical/Important/Suggestions)
```

### 子阶段 4b: 系统化测试

```bash
[@vibe-debugger] 执行系统化测试

1. 完整测试套件
   npm test / cargo test / pytest

2. 边界条件测试
   - 空值处理
   - 极值测试
   - 并发场景

3. 性能基准
   - 响应时间
   - 内存使用

输出: 测试报告
```

### 子阶段 4c: 文档同步

```bash
[@vibe-documenter] 同步文档

1. API 文档生成
2. 架构决策记录更新
3. 使用手册编写
4. README 更新

输出: 文档更新确认
```

### 质量门禁

- [ ] 最终代码审查通过
- [ ] 所有测试通过 (100%)
- [ ] 边界条件覆盖
- [ ] 性能基准达标
- [ ] 文档已同步

---

## Phase 5: 交付阶段 (Delivery Phase)

### 目标
完成最终整合，交付生产就绪的代码。

### 流程

```bash
[vibe-architect] 激活 finishing-a-development-branch 技能

1. 验证所有任务完成
2. 最终测试确认
3. 提供交付选项:
   
   Option A: 合并到主分支
   Option B: 创建 Pull Request
   Option C: 保留分支继续开发
   Option D: 废弃此工作区

4. 根据选择执行:
   - 合并: git merge --no-ff
   - PR: 生成 PR 描述
   - 保留: 记录分支状态
   - 废弃: 清理工作区

5. 生成交付报告:
   - 完成的功能列表
   - 测试统计
   - 文档链接
   - 已知限制
```

---

## Agent 详细定义

### 🎨 Vibe Architect (架构指挥官)

**角色定位**: 指挥家，把控整体方向和流程协调

**核心职责:**
1. **设计阶段**: 需求澄清、方案探索、设计验证
2. **准备阶段**: 环境隔离、计划生成
3. **协调阶段**: 管理五阶段流程，分配任务
4. **交付阶段**: 最终整合、质量把控

**技能矩阵:**
| 场景 | 激活技能 |
|------|----------|
| 需求分析 | brainstorming |
| 环境准备 | using-git-worktrees |
| 计划编写 | writing-plans |
| 实现协调 | subagent-driven-development |
| 交付收尾 | finishing-a-development-branch |

**调用方式:**
```bash
# 完整流程
[vibe-coding] 开发一个用户管理系统

# 仅设计
[vibe-coding:design] 设计一个电商平台架构

# 从设计文档开始
[vibe-coding:plan] 基于 docs/plans/xxx-design.md 创建计划
```

---

### 🎹 Vibe Coder (编码乐手)

**角色定位**: 专注代码生成和功能实现，严格遵守 TDD

**核心职责:**
1. **测试先行**: 红→绿→重构循环
2. **最小实现**: YAGNI 原则，不多不少
3. **频繁提交**: 每个小步骤都提交
4. **技术专精**: 前端/后端/数据库最佳实践

**技术专精:**

**前端:**
- 组件分层: Page → Container → Component → Base
- 状态管理: Redux, Zustand, Pinia, TanStack Query
- 样式: Tailwind, CSS Modules, Styled Components
- 测试: React Testing Library, Vitest

**后端:**
- 分层架构: Controller → Service → Repository → Database
- API 设计: RESTful, GraphQL
- 框架: Express, NestJS, FastAPI, Django
- 数据库: PostgreSQL, MongoDB, Redis

**TDD 铁律:**
```
NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST

违反 = 删除代码，重新开始
```

**调用方式:**
```bash
# 单个任务
[@vibe-coder] 实现用户登录接口 (遵循 TDD)

# 批量任务 (由 architect 协调)
[vibe-architect] 协调 vibe-coder 完成: 
  - Task 1: 实现数据模型
  - Task 2: 实现 API 端点
```

---

### 🔍 Vibe Reviewer (质量守门人)

**角色定位**: 确保代码质量和规格符合性

**核心职责:**
1. **规格符合性审查**: 对比计划验证实现
2. **代码质量审查**: 风格、安全、性能、测试覆盖
3. **问题分级**: Critical / Important / Suggestion
4. **改进建议**: 具体、可操作的反馈

**双阶段审查:**

**阶段 1: 规格符合性 (Spec Compliance)**
```
□ 实现了计划中的所有要求？
□ 没有过度实现 (YAGNI)？
□ 边界情况已处理？
□ 错误处理完整？
```

**阶段 2: 代码质量 (Code Quality)**
```
□ 测试覆盖充分？
□ 代码风格一致？
□ 安全漏洞扫描通过？
□ 性能影响可接受？
□ SOLID 原则遵循？
```

**调用方式:**
```bash
# 双阶段审查
[@vibe-reviewer] 审查这段代码的规格符合性和代码质量

# 特定阶段
[@vibe-reviewer:spec] 检查是否按计划实现
[@vibe-reviewer:quality] 检查代码质量和测试覆盖
```

---

### 🐛 Vibe Debugger (调试专家)

**角色定位**: 系统化诊断和修复问题

**核心职责:**
1. **根因分析**: 四阶段系统化调试
2. **测试生成**: 为 Bug 创建失败测试
3. **修复验证**: 确保修复有效且不引入新问题
4. **防御强化**: 添加多层验证防止复发

**系统化调试四阶段:**

**Phase 1: 根因调查**
- 仔细阅读错误信息
- 稳定复现问题
- 检查近期变更
- 追踪数据流

**Phase 2: 模式分析**
- 寻找类似的成功代码
- 对比参考实现
- 识别差异点

**Phase 3: 假设验证**
- 形成单一假设
- 最小化测试
- 验证或形成新假设

**Phase 4: 实施修复**
- 创建失败测试 (TDD)
- 实施单一修复
- 验证修复有效

**铁律:**
```
NO FIXES WITHOUT ROOT CAUSE INVESTIGATION FIRST

3+ failed fixes = Question the architecture
```

**调用方式:**
```bash
# 完整调试流程
[@vibe-debugger] 分析这个错误并提供修复方案

# 特定阶段
[@vibe-debugger:investigate] 调查问题根因
[@vibe-debugger:fix] 基于根因实施修复
```

---

### 📚 Vibe Documenter (文档生成器)

**角色定位**: 维护技术文档和知识库

**核心职责:**
1. **API 文档**: 自动生成和维护
2. **架构文档**: 设计决策记录 (ADR)
3. **使用手册**: 用户指南和教程
4. **文档同步**: 确保文档与代码一致

**文档类型:**
- Design Docs: 架构设计
- Plan Docs: 实施计划
- API Docs: 接口规范
- ADRs: 架构决策记录
- User Guides: 使用手册

**调用方式:**
```bash
# 生成 API 文档
[@vibe-documenter] 为这段代码生成 API 文档

# 更新架构决策记录
[@vibe-documenter] 记录本次技术选型决策
```

---

### 🔒 Security-Advisor (安全顾问)

**角色定位**: 安全专家，识别漏洞并提供加固建议

**核心职责:**
1. **漏洞扫描**: 代码安全审查
2. **认证授权**: 审查 Auth 机制
3. **数据保护**: 敏感数据处理
4. **安全规范**: 制定编码规范

**调用方式:**
```bash
[@security-advisor] 审查这段代码的安全性
```

---

## 任务分类系统

| 任务类别 | 触发词 | 主要 Agent | 辅助 Agent | 场景 |
|---------|--------|-----------|-----------|------|
| **design** | `[task:design]` | vibe-architect | - | 需求分析、架构设计 |
| **plan** | `[task:plan]` | vibe-architect | - | 实施计划编写 |
| **coding** | `[task:coding]` | vibe-coder | vibe-architect | 代码实现 |
| **review** | `[task:review]` | vibe-reviewer | vibe-coder | 代码审查 |
| **debugging** | `[task:debugging]` | vibe-debugger | vibe-coder | 问题调试 |
| **documentation** | `[task:documentation]` | vibe-documenter | vibe-architect | 文档生成 |
| **security** | `[task:security]` | security-advisor | vibe-reviewer | 安全审查 |
| **quick** | `[vibe-coding:quick]` | 任意 | - | 快速原型 |

---

## 质量门禁汇总

### Level 1: 设计门禁
- [ ] 需求澄清完成 (≥3轮问答)
- [ ] 2-3种方案已探索
- [ ] 架构图已绘制
- [ ] 边界情况已考虑
- [ ] 用户已确认

### Level 2: 计划门禁
- [ ] 任务粒度 2-5 分钟
- [ ] 精确文件路径
- [ ] 完整代码示例
- [ ] 验证命令明确

### Level 3: 代码门禁
- [ ] 先写测试并看失败
- [ ] 最小实现通过测试
- [ ] 所有测试通过
- [ ] 无 error/warning
- [ ] 规格审查通过
- [ ] 质量审查通过

### Level 4: 集成门禁
- [ ] 最终代码审查通过
- [ ] 完整测试套件通过
- [ ] 边界条件覆盖
- [ ] 性能基准达标
- [ ] 文档已同步

---

## 技术规范参考

> 详细技术规范文档位于 `tech-specs/` 目录

### 设计规范
- **[设计系统](tech-specs/design-system.md)** - 色彩、间距、字体、组件规范
- **[API 规范](tech-specs/api-guidelines.md)** - RESTful API 设计规范

### 开发规范
- **[代码规范](tech-specs/code-standards.md)** - 命名、风格、最佳实践
- **[数据库规范](tech-specs/database-guidelines.md)** - 设计、索引、查询
- **[安全规范](tech-specs/security-guidelines.md)** - 安全编码、漏洞防护
- **[测试规范](tech-specs/testing-guidelines.md)** - 测试策略、TDD 实践

### 使用示例
```bash
[@vibe-coder] 实现登录页面，遵循 [设计系统规范](tech-specs/design-system.md)
[@vibe-coder] 设计 API 接口，遵循 [API 规范](tech-specs/api-guidelines.md)
[@vibe-reviewer] 检查代码是否符合 [代码规范](tech-specs/code-standards.md)
[@security-advisor] 审查安全性，参考 [安全规范](tech-specs/security-guidelines.md)
```

---

## 工作流程选择指南

### 场景 1: 完整项目开发
```bash
[vibe-coding] 我需要开发一个任务管理系统...
```
**流程**: 五阶段完整流程
**时间**: 2-4 小时
**产出**: 生产就绪代码 + 完整文档

### 场景 2: 快速原型
```bash
[vibe-coding:quick] 快速做一个原型验证想法...
```
**流程**: Phase 1 → Phase 3 (简化)
**时间**: 30-60 分钟
**产出**: 可运行原型

### 场景 3: 单一功能
```bash
[vibe-coding:design] 设计一个用户认证模块
[vibe-coding:plan] 基于设计创建计划
[@vibe-coder] 实现登录功能
[@vibe-reviewer] 审查代码
```
**流程**: 按需调用特定 Agent
**时间**: 30-60 分钟
**产出**: 单一功能模块

### 场景 4: Bug 修复
```bash
[@vibe-debugger] 分析并修复这个错误
```
**流程**: 系统化调试四阶段
**时间**: 15-45 分钟
**产出**: 修复 + 测试用例

---

## 与其他 SKILL 协作

### 完整开发管道
```bash
[vibe-coding] 开发 Web 应用
  ↓
/playwright         # 端到端测试
  ↓
/obsidian-markdown  # 格式化文档
  ↓
/docx               # 生成 Word 文档
  ↓
/pdf                # 导出 PDF
```

---

## 限制和注意事项

### 适用场景
✅ 快速原型开发
✅ 内部工具/MVP
✅ 个人项目
✅ 概念验证 (POC)
✅ 学习和技术调研
✅ API 开发
✅ 中小型项目

### 不适用场景
❌ 高安全性系统 (需专业审计)
❌ 大规模生产环境 (需严格 QA)
❌ 实时交互系统 (延迟较高)
❌ 复杂遗留系统维护

---

## 版本历史

| 版本 | 日期 | 变更 |
|------|------|------|
| v2.0.0 | 2026-01-30 | 工程化流程重构：五阶段流程、TDD铁律、双阶段审查 |
| v1.1.0 | 2026-01-26 | 添加 Security-Advisor，完善文档 |
| v1.0.0 | 2026-01-20 | 初始版本，6个核心 Agent |

---

**作者**: Vibe Coding Team Community
**许可**: MIT License
**参考**: Superpowers Workflow, Skills Library
