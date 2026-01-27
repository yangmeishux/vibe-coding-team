# Vibe Coding Team - 最佳实践指南

欢迎来到 Vibe Coding Team 最佳实践指南！这里汇集了提升你与 AI Agent 协作效率的核心技巧和方法。

---

## 📚 指南列表

### 1. [Context Engineering 指南](context-engineering.md) ⭐ 推荐先读

**学习如何为 AI Agent 提供高质量上下文**

**核心内容**:
- 什么是 Context Engineering
- 4 大核心原则（明确性、完整性、结构化、渐进性）
- 5 种上下文类型（项目、技术、功能、数据、流程）
- Agent 特定策略
- 常见错误和避免方法
- 实用模板和工具

**适合人群**: 所有 Vibe Coding Team 用户

**预计学习时间**: 30-45 分钟

---

### 2. [Prompt Engineering 指南](prompt-engineering.md) ⭐ 核心技能

**掌握与 AI Agent 有效交互的艺术**

**核心内容**:
- 什么是 Prompt Engineering
- 核心原则（清晰、具体、结构化、可操作）
- Agent 专用 Prompt 模式
  - Vibe Architect（3 种模式）
  - Vibe Coder（3 种模式）
  - Vibe Reviewer（3 种模式）
  - Vibe Debugger（3 种模式）
  - Vibe Documenter（3 种模式）
- 常用 Prompt 模板
- 进阶技巧（Chain-of-Thought, Few-Shot 等）
- Prompt 优化流程

**适合人群**: 希望提升 Agent 交互质量的用户

**预计学习时间**: 45-60 分钟

---

## 🎯 学习路径

### 初学者路径

```
第 1 步: 阅读 Context Engineering 指南
   ↓
第 2 步: 完成简单项目（如 TODO API）
   ↓
第 3 步: 阅读 Prompt Engineering 指南
   ↓
第 4 步: 实践不同 Agent 的 Prompt 模式
   ↓
第 5 步: 完成复杂项目（如博客系统）
```

### 进阶者路径

```
第 1 步: 快速浏览两个指南
   ↓
第 2 步: 优化现有项目的 Context 和 Prompt
   ↓
第 3 步: 创建自己的 Prompt 模板库
   ↓
第 4 步: 分享经验到社区
```

---

## 💡 核心概念速览

### Context Engineering vs Prompt Engineering

| 方面 | Context Engineering | Prompt Engineering |
|------|---------------------|-------------------|
| **焦点** | 提供什么信息 | 如何表达信息 |
| **目标** | 确保信息完整和准确 | 确保表达清晰和有效 |
| **时机** | 在交互之前准备 | 在交互过程中优化 |
| **内容** | 项目背景、需求、约束 | 具体的指令和格式 |
| **工具** | 模板、检查清单 | 模式、技巧 |

**最佳实践**: 结合两者使用

```bash
# Context Engineering: 准备上下文
项目背景 = [详细的项目描述]
技术约束 = [明确的技术要求]
功能需求 = [完整的功能列表]

# Prompt Engineering: 优化表达
[vibe-architect] 基于上述信息，请设计架构

使用清晰的格式：
1. 系统架构
2. 技术栈
3. 模块划分
4. 风险评估
```

---

## 🔧 实用工具

### Context Engineering 工具

**1. 项目启动检查清单**
- [ ] 项目类型和目标
- [ ] 目标用户群体
- [ ] 核心功能列表
- [ ] 技术栈偏好
- [ ] 约束条件
- [ ] 成功标准

**2. 上下文模板**
- 项目启动模板
- 功能需求模板
- Bug 报告模板
- 代码重构模板

### Prompt Engineering 工具

**1. Prompt 模板**
- Agent 专用模板（每个 Agent 3+ 种）
- 常用任务模板
- 快速启动模板

**2. 优化技巧**
- Chain-of-Thought Prompting
- Few-Shot Learning
- 迭代优化
- 角色扮演

---

## 📖 相关资源

### 内部资源

- **[Quick Start 指南](../quick-start/QUICK_START.md)** - 10 分钟快速上手
- **[项目示例](../project-examples/)** - 真实项目演示
- **[视频演示脚本](../resources/video-demos/demo-scripts.md)** - 录制脚本

### 外部资源

- [Claude Code 官方文档](https://code.claude.com/docs/en/overview)
- [awesome-claude-skills](https://github.com/VoltAgent/awesome-claude-skills)
- [Claude Code: Best practices for agentic coding](https://www.anthropic.com/engineering/claude-code-best-practices)

---

## 🎓 进阶学习

### 掌握基础后，可以学习：

1. **高级 Agent 协作模式**
   - 并行开发
   - 质量检查点
   - Agent 投票机制

2. **企业级应用**
   - 团队协作
   - 安全性考虑
   - 性能优化

3. **自定义 Agent**
   - 创建新的 Agent 角色
   - 定义 Agent 工作流
   - 优化 Agent 性能

---

## 💬 社区交流

### 分享你的经验

- **GitHub Issues**: 报告问题或建议
- **GitHub Discussions**: 分享使用经验
- **Pull Requests**: 贡献文档和示例

### 获取帮助

- 查看 [FAQ](../project-examples/todo-api/README.md#常见问题)
- 阅读项目示例
- 提交 Issue 寻求帮助

---

## 📝 文档更新

### 版本历史

- **v1.0.0** (2026-01-27): 初始版本
  - 添加 Context Engineering 指南
  - 添加 Prompt Engineering 指南

### 贡献指南

欢迎改进这些文档！

1. Fork 项目
2. 创建改进分支 (`git checkout -b improve-docs`)
3. 提交更改 (`git commit -m "Improve xxx"`)
4. 推送到分支 (`git push origin improve-docs`)
5. 创建 Pull Request

---

## 🎯 总结

**Context Engineering** + **Prompt Engineering** = **高效的 AI Agent 协作**

**记住**:
- 📚 Context Engineering: 提供什么信息
- ✍️ Prompt Engineering: 如何表达信息
- 🔄 两者结合: 最佳效果

**下一步行动**:

1. ✅ 阅读 Context Engineering 指南
2. ✅ 阅读 Prompt Engineering 指南
3. ✅ 实践项目示例
4. ✅ 创建自己的模板库
5. ✅ 分享到社区

---

**祝你掌握 Vibe Coding 的精髓！** 🚀

---

**文档版本**: 1.0.0
**最后更新**: 2026-01-27
**维护者**: Vibe Coding Team Community
