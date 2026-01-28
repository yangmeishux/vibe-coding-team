# Vibe Coding Team - Prompt 模板库

本目录包含所有 Agent 的详细 Prompt 模板，用于指导 AI 助手的行为和输出。

---

## 文件说明

| 文件 | 对应 Agent | 用途 |
|------|-----------|------|
| [vibe-architect.md](vibe-architect.md) | Vibe Architect | 架构设计、需求分析、团队协调 |
| [vibe-coder.md](vibe-coder.md) | Vibe Coder | 代码生成、功能实现 |
| [vibe-reviewer.md](vibe-reviewer.md) | Vibe Reviewer | 代码审查、质量检查 |
| [vibe-debugger.md](vibe-debugger.md) | Vibe Debugger | 错误诊断、测试生成 |
| [vibe-documenter.md](vibe-documenter.md) | Vibe Documenter | 文档生成、API规范 |

---

## 模板结构

每个 Prompt 模板包含：

1. **System Prompt** - 角色定义和核心指令
2. **行为准则** - 该 Agent 的工作原则
3. **输出格式** - 标准化的响应结构
4. **示例** - 实际使用示例
5. **调用格式** - 各种调用方式

---

## 使用方法

### 方式 1: 直接复制到对话
复制 System Prompt 部分，作为系统指令使用。

### 方式 2: 开发自定义 Agent
参考模板结构，创建新的 Agent Prompt。

### 方式 3: 理解 Agent 行为
查看模板以了解每个 Agent 的能力边界和输出规范。

---

## 扩展计划

根据路线图，未来将添加：

- `security-advisor.md` - 安全顾问
- `performance-optimizer.md` - 性能优化师
- `devops-engineer.md` - DevOps 工程师

---

## 贡献

如需改进 Prompt 模板：
1. 遵循现有模板结构
2. 提供改进前后的对比示例
3. 在 CHANGELOG.md 中记录变更
