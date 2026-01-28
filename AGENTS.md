# AGENTS.md - Vibe Coding Team

本文档为 AI 助手提供项目维护和开发指导。

---

## 项目概述

**Vibe Coding Team** 是一个基于 AI Agent 协作的编程 SKILL 系统：
- **核心文件**: `SKILL.md` - Agent 定义、触发词、工作流程
- **用户入口**: `README.md` - 项目介绍和使用指南
- **快速参考**: `QUICK_REFERENCE.md` - 常用命令速查
- **示例项目**: `examples/` - 教程和实战示例

---

## 文件关系图

```
SKILL.md (核心配置)
    ├── 触发词定义 → 影响 README.md 使用示例
    ├── Agent 定义 → 影响 QUICK_REFERENCE.md
    └── 工作流程 → 影响 examples/ 中的教程

README.md (用户入口)
    ├── 链接到 examples/quick-start/
    ├── 链接到 examples/best-practices/
    └── 链接到 examples/project-examples/

examples/
    ├── quick-start/QUICK_START.md
    ├── best-practices/*.md
    └── project-examples/*/README.md
```

---

## 修改规范

### 修改 SKILL.md 时

1. **触发词变更** → 必须同步更新：
   - README.md 中的所有使用示例
   - QUICK_REFERENCE.md 的速查表
   
2. **Agent 变更** → 必须同步更新：
   - README.md 的核心功能表格
   - QUICK_REFERENCE.md 的 Agent 速查表
   - examples/ 中使用该 Agent 的示例

3. **工作流程变更** → 必须同步更新：
   - README.md 的工作流程图
   - examples/project-examples/ 中的流程说明

### 添加新示例时

1. 示例目录结构：
   ```
   examples/project-examples/new-example/
   ├── README.md          # 必须
   ├── workflow.md        # 可选
   └── architecture.md    # 可选（复杂项目）
   ```

2. 必须在以下文件添加链接：
   - README.md 的「学习资源」部分
   - QUICK_REFERENCE.md 的「项目示例」部分

### 版本更新时

1. 更新 `SKILL.md` 头部的版本号
2. 在 `CHANGELOG.md` 添加变更记录
3. 如果有重大变更，更新 README.md 的项目结构图

---

## 常见任务

### 添加新 Agent

1. 在 SKILL.md 添加 Agent 定义（遵循现有格式）
2. 更新任务分类表格
3. 更新 README.md 的核心功能表格
4. 更新 QUICK_REFERENCE.md 的速查表
5. 提供一个使用示例到 examples/usage_examples.md

### 修复文档错误

1. 检查所有相关文件的引用一致性
2. 验证 Markdown 链接有效
3. 运行 validate.sh（如果存在）

---

## 质量检查清单

### 修改 SKILL.md 后
- [ ] Agent 触发词在文档中一致
- [ ] 任务分类完整覆盖所有场景
- [ ] 工作流程图示正确

### 修改 README.md 后
- [ ] 所有内部链接有效
- [ ] 使用示例与 SKILL.md 一致
- [ ] 项目结构图与实际目录一致

### 添加示例后
- [ ] 示例 README 遵循模板格式
- [ ] 链接已添加到 README.md 和 QUICK_REFERENCE.md
- [ ] 代码示例经过验证（如果可运行）

---

## 注意事项

1. **保持简洁**: 文档要详实但不冗长
2. **示例优先**: 用示例说明比纯文字更有效
3. **一致性**: 所有文档中的触发词、Agent 名称必须完全一致
4. **向前兼容**: 避免破坏现有的使用方式

---

## 参考

- [SKILL.md](SKILL.md) - 核心配置
- [README.md](README.md) - 项目说明
- [CHANGELOG.md](CHANGELOG.md) - 版本历史
