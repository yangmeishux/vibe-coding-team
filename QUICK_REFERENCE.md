# Vibe Coding Team - 快速参考

## 📋 Agent 速查表

| Agent | 角色 | 核心职责 | 调用语法 |
|-------|------|---------|---------|
| **Vibe Architect** | 架构指挥官 | 需求分析、架构设计、团队协调 | `[vibe-architect] 任务描述` |
| **Vibe Coder** | 编码乐手 | 代码生成、功能实现 | `[@vibe-coder] 任务描述` |
| **Vibe Reviewer** | 质量守门人 | 代码审查、安全检查 | `[@vibe-reviewer] 任务描述` |
| **Vibe Debugger** | 调试专家 | 错误诊断、测试生成 | `[@vibe-debugger] 任务描述` |
| **Vibe Documenter** | 文档生成器 | 文档生成、API 规范 | `[@vibe-documenter] 任务描述` |

---

## 🎯 任务分类速查

| 任务类型 | 主要 Agent | 调用语法 | 典型场景 |
|---------|-----------|---------|---------|
| **planning** | vibe-architect | `[task:planning] 任务描述` | 需求分析、架构设计 |
| **coding** | vibe-coder | `[task:coding] 任务描述` | 代码生成、功能实现 |
| **review** | vibe-reviewer | `[task:review] 任务描述` | 代码审查、安全检查 |
| **debugging** | vibe-debugger | `[task:debugging] 任务描述` | 错误诊断、测试生成 |
| **documentation** | vibe-documenter | `[task:documentation] 任务描述` | 文档生成、API 规范 |
| **integration** | vibe-architect | `[task:integration] 任务描述` | 系统集成、部署准备 |
| **quick** | 任意 Agent | `[task:quick] 任务描述` | 简单快速任务 |

---

## 🚀 常用命令

### 完整项目开发

```bash
# 让架构师协调团队
[vibe-architect] 我需要开发一个[项目描述]，请协调团队完成
```

### 单一任务

```bash
# 需求分析
[vibe-architect] 设计一个[系统/功能]的架构

# 代码生成
[@vibe-coder] 实现[具体功能]的代码

# 代码审查
[@vibe-reviewer] 审查这段代码的[安全性/性能/可维护性]

# 调试和测试
[@vibe-debugger] 诊断这个错误并生成测试用例

# 文档生成
[@vibe-documenter] 生成[代码/API]的文档
```

### 快速模式

```bash
# 快速原型
[task:planning] 设计[系统]的架构
[task:coding] 实现[功能]
[task:review] 检查代码质量
[task:documentation] 生成文档
```

---

## 📝 常见场景

### 场景 1: 快速原型

```bash
[vibe-architect] 我想快速开发一个[项目类型]，支持：
  - 功能 1
  - 功能 2
  使用[技术栈]，请协调团队完成
```

### 场景 2: API 开发

```bash
[task:planning] 设计[API名称]的接口
[task:coding] 实现[端点]的代码
[task:review] 检查 API 的安全性
[task:documentation] 生成 API 文档
```

### 场景 3: Bug 修复

```bash
[@vibe-debugger] 分析这个错误：
  [错误信息/堆栈跟踪]
  请提供修复方案和测试用例
```

### 场景 4: 代码重构

```bash
[@vibe-reviewer] 这段代码[问题描述]，请提供重构建议
```

---

## ✅ 最佳实践

### DO (推荐)

1. **明确需求和约束**
   ```bash
   ✅ [vibe-architect] 设计一个博客系统，支持用户认证、文章管理、评论功能，
     使用 Node.js + Express + MongoDB，需要 RESTful API
   ```

2. **合理选择使用方式**
   - 完整项目 → `[vibe-architect]`
   - 单一任务 → `[@agent-name]`
   - 快速开发 → `[task:category]`

3. **遵循工作流程**
   ```
   架构先行 → 代码生成 → 质量审查 → 测试保障 → 文档完善
   ```

4. **提供具体反馈**
   ```bash
   ✅ [@vibe-reviewer] 这段代码存在[具体问题]，需要[具体建议]
   ```

### DON'T (避免)

1. ❌ 对简单任务使用全部 Agent
2. ❌ 跳过架构设计直接编码
3. ❌ 忽略代码审查和质量检查
4. ❌ 省略测试和文档
5. ❌ 完全信任 AI 不进行人工审查

---

## 🔗 与其他 SKILL 配合

### 完整开发管道

```bash
/planning-with-files     # 项目计划
/vibe-coding-team        # Agent 协作开发
/playwright              # 端到端测试
/obsidian-markdown      # 文档格式化
/docx                   # Word 文档
/pdf                    # PDF 导出
```

### API 开发管道

```bash
/vibe-coding-team        # API 开发
/playwright              # API 测试
/obsidian-markdown      # API 文档
/docx                   # 导出规范
```

### 快速原型管道

```bash
/vibe-coding-team        # 快速开发
/playwright              # 基础测试
/docx                   # 使用文档
```

---

## ⏱️ 预期时间

| 任务类型 | 预期时间 | 说明 |
|---------|---------|------|
| **简单需求分析** | 5-10 分钟 | 单个功能的需求理解 |
| **复杂架构设计** | 15-30 分钟 | 完整系统的架构设计 |
| **代码生成** | 10-20 分钟 | 单个模块的代码生成 |
| **代码审查** | 5-10 分钟 | 代码质量和安全审查 |
| **错误诊断** | 5-15 分钟 | 问题定位和修复方案 |
| **文档生成** | 5-10 分钟 | API 文档和使用说明 |
| **快速原型** | 2-3 小时 | 从需求到可运行原型 |
| **完整项目** | 数天 | 从需求到生产就绪 |

---

## 🛠️ 故障排除

### 问题 1: Agent 响应不符合预期

**解决方案**：
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

### 问题 2: 代码质量不够高

**解决方案**：
1. 启用多轮审查
2. 设置质量检查点
3. 提供具体的质量标准

```bash
[vibe-architect] 设置质量检查点：
  - 架构阶段：确保设计合理
  - 编码阶段：确保代码质量
  - 审查阶段：确保安全性和性能
  - 测试阶段：确保测试覆盖
```

### 问题 3: 执行时间过长

**解决方案**：
1. 使用快速模式
2. 减少不必要的 Agent
3. 并行处理独立任务

```bash
# 快速模式
[task:coding] 快速实现功能
[task:review] 简要审查
[task:documentation] 生成文档
```

---

## 📚 更多资源

### 🎓 学习指南

- **[Quick Start 指南](examples/quick-start/QUICK_START.md)** ⭐ - 10 分钟快速上手
- **[最佳实践](examples/best-practices/)** 🚀 - 提升核心技能
  - [Context Engineering](examples/best-practices/context-engineering.md) - 如何提供高质量上下文
  - [Prompt Engineering](examples/best-practices/prompt-engineering.md) - 如何编写有效提示词

### 💻 项目示例

- **[TODO API](examples/project-examples/todo-api/README.md)** - 简化版示例（15-30 分钟）
- **[博客系统](examples/project-examples/blog-system/README.md)** - 完整可运行版本（1-2 小时）
- **[任务管理 UI](examples/project-examples/task-ui/README.md)** - 前端开发示例（1-2 小时）

### 📖 文档

- [完整文档](README.md)
- [SKILL 配置](SKILL.md)
- [使用示例](examples/usage_examples.md)
- [贡献指南](CONTRIBUTING.md)
- [更新日志](CHANGELOG.md)

### 🤝 社区

- **[反馈模板](.github/ISSUE_TEMPLATE/feedback.md)** - 分享使用体验
- **[提交到 awesome-claude-skills](SUBMIT_TO_AWESOME.md)** - 帮助推广项目
- [Issues](https://github.com/yangmeishux/vibe-coding-team/issues) - 报告问题
- [Discussions](https://github.com/yangmeishux/vibe-coding-team/discussions) - 功能建议

---

**需要帮助？** 查看 [Issues](https://github.com/yangmeishux/vibe-coding-team/issues) 或 [Discussions](https://github.com/yangmeishux/vibe-coding-team/discussions)

---

*最后更新: 2026-01-27*
