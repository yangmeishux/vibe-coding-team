# 技术规范 (Technical Specifications)

> 本文档目录包含 Vibe Coding Team 的详细技术规范，为 Agent 提供专业的技术实现指导。

---

## 规范目录

| 规范 | 文件 | 说明 |
|------|------|------|
| **设计系统** | [design-system.md](design-system.md) | 色彩、间距、字体、组件规范 |
| **API 规范** | [api-guidelines.md](api-guidelines.md) | RESTful API 设计规范 |
| **代码规范** | [code-standards.md](code-standards.md) | 代码风格、命名、最佳实践 |
| **数据库规范** | [database-guidelines.md](database-guidelines.md) | 数据库设计、索引、查询规范 |
| **安全规范** | [security-guidelines.md](security-guidelines.md) | 安全编码、漏洞防护 |
| **测试规范** | [testing-guidelines.md](testing-guidelines.md) | 测试策略、覆盖率、TDD 实践 |

---

## 使用方式

### 在 SKILL.md 中引用
```markdown
技术规范参考:
- [设计系统](tech-specs/design-system.md)
- [API 规范](tech-specs/api-guidelines.md)
```

### 在 Agent 定义中引用
```markdown
## 技术专精
详见 [设计系统规范](../tech-specs/design-system.md)
```

### 在实现时引用
```bash
[@vibe-coder] 实现登录页面，遵循 [设计系统规范](tech-specs/design-system.md)
```

---

## 规范级别

```
┌─────────────────────────────────────────────────────────────┐
│ MUST (必须)                                                 │
│ 所有代码必须遵循的规范，违反会导致审查不通过                   │
├─────────────────────────────────────────────────────────────┤
│ SHOULD (应该)                                               │
│ 强烈建议遵循的规范，特殊情况可例外但需说明原因                 │
├─────────────────────────────────────────────────────────────┤
│ MAY (可以)                                                  │
│ 可选规范，根据项目实际情况选择是否遵循                        │
└─────────────────────────────────────────────────────────────┘
```

---

## 规范更新

- 规范随技术发展持续更新
- 新规范通过 PR 流程添加
- 旧规范通过 deprecation 流程废弃

---

**最后更新**: 2026-01-30
