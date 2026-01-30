# Vibe Coding Team 质量门禁系统

> 本文档定义五阶段流程中每个阶段的质量门禁检查点。
> 
> **质量门禁是强制性的，不是可选的。**

---

## 质量门禁概览

```
┌─────────────────────────────────────────────────────────────────────────┐
│                                                                         │
│  Level 1          Level 2          Level 3          Level 4            │
│  设计门禁         计划门禁         代码门禁         集成门禁            │
│                                                                         │
│  ┌─────┐         ┌─────┐         ┌─────┐         ┌─────┐              │
│  │ ✓✓✓ │   →    │ ✓✓✓ │   →    │ ✓✓✓ │   →    │ ✓✓✓ │              │
│  └─────┘         └─────┘         └─────┘         └─────┘              │
│                                                                         │
│  Design Doc      Plan Doc         Working Code    Production Ready     │
│  Approved        Created          (TDD)           (Delivered)          │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## Level 1: 设计质量门禁

**触发时机**: 完成 Phase 1 (设计阶段)
**负责 Agent**: vibe-architect
**输出**: 通过 / 未通过 (需补充)

### 检查清单

#### 1.1 需求澄清
- [ ] 已完成至少 3 轮问答澄清需求
- [ ] 用户的核心问题已识别
- [ ] 非功能需求已明确 (性能、安全、可用性)
- [ ] 约束条件已记录 (技术栈、时间、资源)

#### 1.2 方案探索
- [ ] 已探索 2-3 种不同方案
- [ ] 每个方案的优缺点已分析
- [ ] 推荐方案及理由已说明
- [ ] 已考虑替代方案的风险

#### 1.3 架构设计
- [ ] 系统架构图已绘制
- [ ] 组件职责已明确划分
- [ ] 接口定义已初步确定
- [ ] 数据流已描述

#### 1.4 边界情况
- [ ] 主要错误场景已识别
- [ ] 边界条件已考虑
- [ ] 并发/性能场景已评估
- [ ] 安全威胁已初步分析

#### 1.5 用户确认
- [ ] 设计以 200-300 字分段展示
- [ ] 每段都经过用户确认
- [ ] 用户已批准最终设计
- [ ] 设计文档已生成并提交

### 设计文档模板检查

```markdown
□ 文档头部信息完整
  - Status: Draft/Review/Approved
  - Date: YYYY-MM-DD
  - Author: vibe-architect

□ Goal 部分
  - 一句话清晰描述目标

□ Architecture 部分
  - 2-3 句话描述架构
  - 架构图或组件图

□ Key Decisions 部分
  - 决策表格 (决策/选项/选择/理由)

□ Components 部分
  - 组件列表及职责
  - 接口定义

□ Data Flow 部分
  - 数据流图示或描述

□ Error Handling 部分
  - 主要错误场景
  - 处理方式

□ Testing Strategy 部分
  - 测试重点

□ Open Questions 部分
  - 待确认问题列表
```

### 通过标准

**必须全部勾选**才能通过 Level 1。

**未通过处理:**
- 返回 Phase 1 补充缺失部分
- 重新进行用户确认
- 更新设计文档

---

## Level 2: 计划质量门禁

**触发时机**: 完成 Phase 2 (准备阶段)
**负责 Agent**: vibe-architect
**输出**: 通过 / 未通过 (需修改)

### 检查清单

#### 2.1 环境准备
- [ ] 隔离工作区已创建 (.worktrees/)
- [ ] 项目依赖已安装
- [ ] 基线测试全部通过
- [ ] 工作区状态已报告

#### 2.2 任务粒度
- [ ] 每个任务可在 2-5 分钟内完成
- [ ] 没有过大或过小的任务
- [ ] 任务依赖关系清晰
- [ ] 任务顺序合理

#### 2.3 文件路径
- [ ] 每个任务指定精确文件路径
- [ ] 新建文件路径遵循项目约定
- [ ] 修改文件指定行号范围
- [ ] 测试文件路径正确

#### 2.4 代码示例
- [ ] 每个任务包含完整代码示例
- [ ] 代码可直接复制使用
- [ ] 代码符合项目风格
- [ ] 代码有必要的注释

#### 2.5 验证步骤
- [ ] 每个任务有明确的验证命令
- [ ] 预期输出已指定
- [ ] 测试命令可执行
- [ ] 通过标准清晰

### 计划文档模板检查

```markdown
□ 文档头部
  - For Claude: REQUIRED SUB-SKILL 声明
  - Based on: 链接到设计文档
  - Goal: 一句话目标
  - Architecture: 2-3 句话架构

□ 每个任务包含:
  - [ ] Task 标题清晰
  - [ ] Files 部分完整
    - Create: 精确路径
    - Modify: 精确路径:行号
    - Test: 精确路径
  - [ ] Context 场景设置
  - [ ] Steps 详细步骤
    - Step 1: Write failing test (完整代码)
    - Step 2: Verify test fails (命令+预期)
    - Step 3: Write minimal implementation (完整代码)
    - Step 4: Verify test passes (命令+预期)
    - Step 5: Refactor (说明)
    - Step 6: Commit (命令)
```

### 任务粒度示例

| 任务描述 | 粒度评估 | 结果 |
|---------|---------|------|
| "Write failing test for email validation" | ✅ 2-5 分钟 | 通过 |
| "Run test to verify it fails" | ✅ 1 分钟 | 通过 |
| "Implement email regex validation" | ✅ 3 分钟 | 通过 |
| "Implement user authentication system" | ❌ 2+ 小时 | 拒绝 |
| "Add validation" | ❌ 太模糊 | 拒绝 |
| "Write test and implement and refactor" | ❌ 多步骤 | 拒绝 |

### 通过标准

**必须全部勾选**才能通过 Level 2。

**未通过处理:**
- 拆分过大的任务
- 补充缺失的文件路径或代码
- 明确验证步骤

---

## Level 3: 代码质量门禁

**触发时机**: 完成每个 Task 的实现
**负责 Agent**: vibe-coder + vibe-reviewer
**输出**: 通过 / 未通过 (需修复)

### 检查清单

#### 3.1 TDD 遵循 (vibe-coder 自检)
- [ ] 先写测试并看到失败 (RED)
- [ ] 失败原因正确 (功能缺失，不是语法错误)
- [ ] 写最小代码通过测试 (GREEN)
- [ ] 所有测试通过
- [ ] 重构后测试仍通过 (REFACTOR)
- [ ] 代码已提交

#### 3.2 规格符合性审查 (Stage 1)
- [ ] 实现了计划中的所有要求
- [ ] 没有过度实现 (YAGNI)
- [ ] 边界情况已处理
- [ ] 错误处理完整
- [ ] 接口符合设计

#### 3.3 代码质量审查 (Stage 2)
- [ ] 测试覆盖充分
- [ ] 代码风格一致
- [ ] 命名清晰有意义
- [ ] 无重复代码 (DRY)
- [ ] 单一职责原则遵循

#### 3.4 安全扫描
- [ ] 输入已验证
- [ ] 无注入漏洞 (SQL, XSS, Command)
- [ ] 敏感信息未暴露
- [ ] 权限检查正确

#### 3.5 输出检查
- [ ] 无 console.error
- [ ] 无 console.warn (或已解释)
- [ ] 无 lint 错误
- [ ] 类型检查通过 (如有)

### 审查报告模板

#### Stage 1: 规格符合性报告

```markdown
## Spec Compliance Review - Task X

### Requirements Coverage
| Requirement | Status | Notes |
|-------------|--------|-------|
| Req 1 | ✅/❌ | |
| Req 2 | ✅/❌ | |

### YAGNI Check
| Item | Status | Notes |
|------|--------|-------|
| No extra features | ✅/❌ | |
| No speculative code | ✅/❌ | |

### Issues Found
| Severity | Issue | Location | Fix Required |
|----------|-------|----------|--------------|
| Critical/Important/Suggestion | 描述 | 文件:行号 | 是/否 |

### Result
□ 通过 - 规格符合
□ 未通过 - 需修复上述问题
```

#### Stage 2: 代码质量报告

```markdown
## Code Quality Review - Task X

### Test Quality
| Check | Status | Notes |
|-------|--------|-------|
| Readable tests | ✅/❌ | |
| Clear test names | ✅/❌ | |
| Tests behavior not implementation | ✅/❌ | |

### Code Style
| Check | Status | Notes |
|-------|--------|-------|
| Naming conventions | ✅/❌ | |
| Formatting | ✅/❌ | |
| Comments | ✅/❌ | |

### Security
| Check | Status | Notes |
|-------|--------|-------|
| Input validation | ✅/❌ | |
| No injection risks | ✅/❌ | |
| Error handling | ✅/❌ | |

### Design
| Check | Status | Notes |
|-------|--------|-------|
| SOLID principles | ✅/❌ | |
| Separation of concerns | ✅/❌ | |
| No duplication | ✅/❌ | |

### Issues Found
| Severity | Issue | Location | Recommendation |
|----------|-------|----------|----------------|
| Critical | | | |
| Important | | | |
| Suggestion | | | |

### Result
□ 通过 - 质量合格
□ 未通过 - 需修复上述问题
```

### 问题分级标准

**Critical (阻塞性问题)**
- 安全漏洞
- 功能缺失或错误
- 测试缺失
- 性能严重问题
- 架构违规

**Important (应该修复)**
- 代码异味
- 边界情况未处理
- 错误处理不完善
- 命名问题
- 可维护性问题

**Suggestion (可选)**
- 风格偏好
- 可选优化
- 注释建议
- 设计模式建议

### 通过标准

**必须满足:**
- 所有 Critical 问题已修复
- 规格符合性审查通过
- 代码质量审查通过

**Important 问题:**
- 建议修复，但不是阻塞
- 可以记录为技术债务

### 未通过处理

1. **规格审查未通过:**
   - 实现子代理修复规格偏差
   - 重新进行规格审查

2. **质量审查未通过:**
   - 实现子代理修复质量问题
   - 重新进行质量审查

---

## Level 4: 集成质量门禁

**触发时机**: 完成 Phase 3 (所有 Task 实现)
**负责 Agent**: vibe-reviewer + vibe-debugger + vibe-documenter
**输出**: 通过 / 未通过 (需修复)

### 检查清单

#### 4.1 最终代码审查 (vibe-reviewer)
- [ ] 对比原始计划验证完整性
- [ ] 所有需求已实现
- [ ] 架构合规性检查通过
- [ ] 无遗留 Critical/Important 问题

#### 4.2 完整测试 (vibe-debugger)
- [ ] 完整测试套件通过
- [ ] 新功能测试覆盖 100%
- [ ] 边界条件测试通过
- [ ] 错误场景测试通过

#### 4.3 兼容性检查
- [ ] 与现有模块兼容
- [ ] API 变更已处理
- [ ] 数据迁移脚本 (如需要)
- [ ] 配置变更已记录

#### 4.4 性能基准
- [ ] 响应时间达标
- [ ] 内存使用合理
- [ ] 无性能回归
- [ ] 压力测试通过 (如需要)

#### 4.5 文档同步 (vibe-documenter)
- [ ] API 文档已更新
- [ ] 架构决策记录已更新
- [ ] 使用手册已编写
- [ ] README 已更新 (如需要)

#### 4.6 交付准备
- [ ] 提交历史清晰
- [ ] 提交信息规范
- [ ] 无调试代码残留
- [ ] 无敏感信息泄露

### 集成测试报告模板

```markdown
## Integration Quality Report

### Test Results
| Test Suite | Tests | Passed | Failed | Status |
|------------|-------|--------|--------|--------|
| Unit Tests | X | X | 0 | ✅/❌ |
| Integration Tests | X | X | 0 | ✅/❌ |
| E2E Tests | X | X | 0 | ✅/❌ |

### Coverage Report
| Metric | Target | Actual | Status |
|--------|--------|--------|--------|
| Line Coverage | 80% | X% | ✅/❌ |
| Function Coverage | 90% | X% | ✅/❌ |
| Branch Coverage | 70% | X% | ✅/❌ |

### Performance Benchmark
| Metric | Baseline | Current | Status |
|--------|----------|---------|--------|
| Response Time | X ms | X ms | ✅/❌ |
| Memory Usage | X MB | X MB | ✅/❌ |

### Documentation Status
| Document | Status | Location |
|----------|--------|----------|
| API Docs | ✅/❌ | link |
| ADR | ✅/❌ | link |
| User Guide | ✅/❌ | link |

### Final Review
| Check | Status |
|-------|--------|
| All requirements met | ✅/❌ |
| No Critical issues | ✅/❌ |
| Tests passing | ✅/❌ |
| Docs updated | ✅/❌ |

### Result
□ 通过 - 可以交付
□ 未通过 - 需修复上述问题
```

### 通过标准

**必须全部勾选:**
- 所有测试通过
- 覆盖率达标
- 性能达标
- 文档已同步
- 无 Critical 问题

**未通过处理:**
- 修复失败的测试
- 补充缺失的文档
- 解决性能问题
- 重新审查

---

## 质量门禁流程图

```
┌───────────────────────────────────────────────────────────────────────┐
│                         QUALITY GATES FLOW                            │
├───────────────────────────────────────────────────────────────────────┤
│                                                                       │
│  ┌─────────────┐                                                      │
│  │  Phase 1    │                                                      │
│  │  设计阶段    │                                                      │
│  └──────┬──────┘                                                      │
│         ↓                                                             │
│  ┌─────────────────┐                                                  │
│  │ Level 1 Gate    │ 设计门禁                                         │
│  │ Check: 需求澄清  │                                                  │
│  │        方案探索  │                                                  │
│  │        架构设计  │                                                  │
│  │        用户确认  │                                                  │
│  └────────┬────────┘                                                  │
│           │                                                           │
│     ┌─────┴─────┐                                                     │
│     ▼           ▼                                                     │
│  ┌──────┐   ┌──────┐                                                  │
│  │ ❌   │   │ ✅   │                                                  │
│  │未通过 │   │通过  │                                                  │
│  └──┬───┘   └──┬───┘                                                  │
│     │          ↓                                                      │
│     ↓     ┌─────────────┐                                             │
│  返回补充  │  Phase 2    │                                             │
│           │  准备阶段    │                                             │
│           └──────┬──────┘                                             │
│                  ↓                                                    │
│           ┌─────────────────┐                                         │
│           │ Level 2 Gate    │ 计划门禁                                 │
│           │ Check: 环境准备  │                                         │
│           │        任务粒度  │                                         │
│           │        代码示例  │                                         │
│           │        验证步骤  │                                         │
│           └────────┬────────┘                                         │
│                    │                                                  │
│              ┌─────┴─────┐                                            │
│              ▼           ▼                                            │
│           ┌──────┐   ┌──────┐                                         │
│           │ ❌   │   │ ✅   │                                         │
│           │未通过 │   │通过  │                                         │
│           └──┬───┘   └──┬───┘                                         │
│              │          ↓                                             │
│              ↓     ┌─────────────┐                                    │
│           修改计划  │  Phase 3    │                                    │
│                    │  实现阶段    │                                    │
│                    └──────┬──────┘                                    │
│                           ↓                                           │
│                    ┌─────────────┐                                    │
│                    │  Task N     │                                    │
│                    │  任务实现    │                                    │
│                    └──────┬──────┘                                    │
│                           ↓                                           │
│                    ┌─────────────────┐                                │
│                    │ Level 3 Gate    │ 代码门禁                        │
│                    │ Check: TDD遵循   │ (每个Task)                     │
│                    │        规格符合  │                                │
│                    │        代码质量  │                                │
│                    │        安全扫描  │                                │
│                    └────────┬────────┘                                │
│                             │                                         │
│                       ┌─────┴─────┐                                   │
│                       ▼           ▼                                   │
│                    ┌──────┐   ┌──────┐                                │
│                    │ ❌   │   │ ✅   │                                │
│                    │未通过 │   │通过  │                                │
│                    └──┬───┘   └──┬───┘                                │
│                       │          ↓                                    │
│                       ↓     ┌─────────────┐                           │
│                    修复重审  │ 更多Task?   │                           │
│                              └──────┬──────┘                           │
│                                     │                                 │
│                               ┌─────┴─────┐                           │
│                               ▼           ▼                           │
│                            ┌──────┐   ┌──────┐                        │
│                            │ 是   │   │ 否   │                        │
│                            └──┬───┘   └──┬───┘                        │
│                               ↓          ↓                            │
│                         下一个Task  ┌─────────────┐                    │
│                                     │  Phase 4    │                    │
│                                     │  质量阶段    │                    │
│                                     └──────┬──────┘                    │
│                                            ↓                          │
│                                     ┌─────────────────┐               │
│                                     │ Level 4 Gate    │ 集成门禁        │
│                                     │ Check: 最终审查  │               │
│                                     │        完整测试  │               │
│                                     │        兼容性    │               │
│                                     │        文档同步  │               │
│                                     └────────┬────────┘               │
│                                              │                        │
│                                        ┌─────┴─────┐                  │
│                                        ▼           ▼                  │
│                                     ┌──────┐   ┌──────┐               │
│                                     │ ❌   │   │ ✅   │               │
│                                     │未通过 │   │通过  │               │
│                                     └──┬───┘   └──┬───┘               │
│                                        │          ↓                   │
│                                        ↓     ┌─────────────┐          │
│                                     修复问题  │  Phase 5    │          │
│                                              │  交付阶段    │          │
│                                              └──────┬──────┘          │
│                                                     ↓                 │
│                                              ┌─────────────┐          │
│                                              │   交付完成   │          │
│                                              └─────────────┘          │
│                                                                       │
└───────────────────────────────────────────────────────────────────────┘
```

---

## 质量指标追踪

### 项目级指标

| 指标 | 说明 | 目标 |
|------|------|------|
| 设计通过率 | Level 1 一次通过比例 | >90% |
| 计划通过率 | Level 2 一次通过比例 | >85% |
| 代码通过率 | Level 3 一次通过比例 | >80% |
| 集成通过率 | Level 4 一次通过比例 | >95% |
| 平均审查轮数 | 每个 Task 的审查次数 | <1.5 |
| 缺陷逃逸率 | 发布后发现的缺陷 | <5% |

### 统计模板

```markdown
## Quality Metrics - [Project Name]

### Gate Pass Rates
| Gate | Attempts | Passed 1st | Pass Rate |
|------|----------|------------|-----------|
| Level 1 (Design) | X | X | X% |
| Level 2 (Plan) | X | X | X% |
| Level 3 (Code) | X | X | X% |
| Level 4 (Integration) | X | X | X% |

### Review Iterations
| Task | Spec Reviews | Quality Reviews | Total |
|------|--------------|-----------------|-------|
| Task 1 | X | X | X |
| Task 2 | X | X | X |
| Average | - | - | X |

### Code Metrics
| Metric | Value |
|--------|-------|
| Total Tasks | X |
| Total Commits | X |
| Test Coverage | X% |
| Lines of Code | X |
| Documentation Pages | X |

### Defects
| Phase Found | Count | Severity |
|-------------|-------|----------|
| Level 3 | X | X Critical, X Important |
| Level 4 | X | X Critical, X Important |
| Post-Release | X | X Critical, X Important |
```

---

## 质量门禁与 Agent 对应关系

| 质量门禁 | 负责 Agent | 协作 Agent | 检查重点 |
|---------|-----------|-----------|---------|
| Level 1 | vibe-architect | - | 设计完整性 |
| Level 2 | vibe-architect | - | 计划可执行性 |
| Level 3 | vibe-reviewer | vibe-coder | 代码质量和规格符合性 |
| Level 4 | vibe-reviewer | vibe-debugger, vibe-documenter | 整体质量 |

---

**最后更新**: 2026-01-30
**版本**: v2.0
