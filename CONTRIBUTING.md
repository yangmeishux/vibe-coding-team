# 贡献指南

感谢您对 Vibe Coding Team 的关注！我们欢迎各种形式的贡献。

---

## 如何贡献

### 1. 报告 Bug

如果您发现了 bug，请在 [Issues](https://github.com/yourusername/vibe-coding-team/issues) 中提交：

- 使用清晰、描述性的标题
- 在描述中复现 bug 的步骤
- 提供示例代码和错误信息
- 说明预期的行为
- 提供您的环境信息（操作系统、Claude Code 版本等）

### 2. 提出新功能

如果您有新功能的想法：

- 先在 [Discussions](https://github.com/yourusername/vibe-coding-team/discussions) 中讨论
- 说明问题的背景和动机
- 描述您希望的行为
- 提供示例和用例

### 3. 提交代码

#### 开发流程

1. **Fork 仓库**
   ```bash
   # 在 GitHub 上点击 Fork 按钮
   ```

2. **克隆您的 Fork**
   ```bash
   git clone https://github.com/your-username/vibe-coding-team.git
   cd vibe-coding-team
   ```

3. **创建特性分支**
   ```bash
   git checkout -b feature/AmazingFeature
   ```

4. **进行修改**
   - 遵循现有的代码风格
   - 添加必要的文档
   - 更新 CHANGELOG.md

5. **提交更改**
   ```bash
   git add .
   git commit -m 'Add some AmazingFeature'
   ```

   **提交消息格式**：
   ```
   <type>(<scope>): <subject>

   <body>

   <footer>
   ```

   **类型**:
   - `feat`: 新功能
   - `fix`: Bug 修复
   - `docs`: 文档更新
   - `style`: 代码格式（不影响功能）
   - `refactor`: 重构
   - `test`: 测试相关
   - `chore`: 构建/工具相关

6. **推送到分支**
   ```bash
   git push origin feature/AmazingFeature
   ```

7. **创建 Pull Request**
   - 在 GitHub 上创建 PR
   - 填写 PR 模板
   - 等待审核和合并

---

## 代码规范

### 文档规范

1. **使用 Markdown**
   - 遵循 [CommonMark](https://commonmark.org/) 规范
   - 使用一致的标题层级
   - 添加适当的代码块和示例

2. **语言和风格**
   - 使用清晰、简洁的语言
   - 保持专业和友好的语气
   - 避免拼写和语法错误

3. **代码示例**
   - 提供完整、可运行的代码示例
   - 添加必要的注释
   - 说明预期的输出

### SKILL.md 规范

1. **Agent 定义**
   - 遵循标准模板
   - 明确角色定位
   - 详细的职责描述
   - 具体的使用场景
   - 清晰的调用方式

2. **任务分类**
   - 表格形式
   - 包含主要 Agent、辅助 Agent 和典型场景
   - 任务类型使用小写字母和连字符

3. **工作流程**
   - 使用文本流程图
   - 明确的阶段划分
   - 清晰的依赖关系

---

## 测试

在提交代码前，请确保：

1. **文档测试**
   - 在 Claude Code 中加载修改后的 SKILL
   - 测试所有 Agent 的调用
   - 验证工作流程的正确性

2. **示例测试**
   - 运行 README.md 和 examples/ 中的示例
   - 确保示例可以正常工作
   - 更新示例以反映新功能

3. **文档审查**
   - 检查文档的完整性和准确性
   - 确保链接正确
   - 验证示例代码

---

## Pull Request 审查流程

1. **提交 PR**
   - 填写 PR 模板
   - 说明修改的目的和范围
   - 引用相关的 Issue

2. **自动化检查**
   - CI/CD 自动运行
   - 检查文档格式和规范

3. **人工审查**
   - 维护者审查代码
   - 提供反馈和建议
   - 可能需要多次迭代

4. **合并**
   - 审查通过后合并
   - 使用 squash merge
   - 更新 CHANGELOG.md

---

## 项目结构

```
vibe-coding-team/
├── .github/
│   ├── workflows/          # CI/CD 配置
│   ├── ISSUE_TEMPLATE/     # Issue 模板
│   └── PULL_REQUEST_TEMPLATE.md
├── examples/               # 使用示例
│   └── usage_examples.md
├── SKILL.md                # 核心 SKILL 配置
├── README.md               # 项目说明
├── QUICK_REFERENCE.md      # 快速参考
├── CONTRIBUTING.md          # 贡献指南（本文件）
├── CHANGELOG.md            # 更新日志
├── LICENSE                 # MIT 许可证
└── .gitignore
```

---

## 行为准则

### 我们的承诺

为了营造开放和友好的环境，我们承诺：

- 使用尊重和包容的语言
- 尊重不同的观点和经验
- 优雅地接受建设性的批评
- 关注对社区最有利的事情
- 对其他社区成员表示同理心

---

## 获得帮助

如果您需要帮助：

1. 查看 [文档](README.md)
2. 查看 [快速参考](QUICK_REFERENCE.md)
3. 查看 [使用示例](examples/usage_examples.md)
4. 在 [Discussions](https://github.com/yourusername/vibe-coding-team/discussions) 中提问
5. 查看 [Issues](https://github.com/yourusername/vibe-coding-team/issues) 中是否已有类似问题

---

## 许可证

通过贡献代码，您同意您的贡献将根据 [MIT License](LICENSE) 进行许可。

---

**感谢您的贡献！**
