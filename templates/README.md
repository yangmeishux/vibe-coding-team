# Vibe Coding Team - 项目模板库

开箱即用的项目模板，帮助快速启动新项目。

---

## 可用模板

| 模板 | 技术栈 | 适用场景 | 预估时间 |
|------|--------|---------|---------|
| [nodejs-api](nodejs-api/) | Node.js + Express + MongoDB | REST API 后端 | 1-2 小时 |
| [python-fastapi](python-fastapi/) | Python + FastAPI + PostgreSQL | 高性能 API 后端 | 1-2 小时 |
| [react-dashboard](react-dashboard/) | React + TypeScript + Tailwind | 管理后台前端 | 2-3 小时 |
| [go-microservice](go-microservice/) | Go + Gin + Redis | 微服务后端 | 2-3 小时 |

---

## 使用方法

### 方式 1: 让 Architect 使用模板

```bash
[vibe-architect] 使用 nodejs-api 模板创建一个用户管理系统
```

### 方式 2: 基于模板定制

```bash
[vibe-architect] 基于 python-fastapi 模板，但需要：
  - 改用 MySQL 代替 PostgreSQL
  - 添加 Redis 缓存
  - 实现 JWT 认证
```

---

## 模板结构

每个模板包含：

```
template-name/
├── README.md           # 模板说明和使用指南
├── STRUCTURE.md        # 项目结构说明
├── .vibe/              # Vibe Coding 配置
│   ├── context.md      # 项目上下文
│   └── checklist.md    # 质量检查清单
└── src/                # 源代码（可选，可生成）
```

---

## 贡献新模板

想添加新模板？请遵循以下步骤：

1. 创建模板目录
2. 编写 README.md 和 STRUCTURE.md
3. 提供 .vibe/ 配置
4. 在 CHANGELOG.md 记录
5. 提交 PR

模板标准：
- 技术栈明确且流行
- 有明确的使用场景
- 包含完整的 Vibe Coding 配置
- 提供实际使用示例
