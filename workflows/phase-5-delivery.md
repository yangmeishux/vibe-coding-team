# Phase 5: 交付阶段 (Delivery Phase)

> 完成最终整合，交付生产就绪的代码。

---

## 目标

1. **验证完成度**: 确认所有任务已完成
2. **交付决策**: 选择交付方式
3. **执行交付**: 合并/PR/保留/废弃
4. **生成交付物**: 报告和文档

---

## 流程图

```
┌─────────────────────────────────────────────────────────────────────────┐
│                      PHASE 5: DELIVERY                                  │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│   Level 4 Gate 已通过                                                    │
│       ↓                                                                 │
│   ┌─────────────────────────────────────────────────────────────────┐  │
│   │ 1. 验证完成度                                                    │  │
│   │    Verification                                                  │  │
│   ├─────────────────────────────────────────────────────────────────┤  │
│   │                                                                 │  │
│   │  [vibe-architect]                                               │  │
│   │                                                                 │  │
│   │  □ 所有任务已完成                                                │  │
│   │  □ 所有测试通过                                                  │  │
│   │  □ 代码已提交                                                    │  │
│   │  □ 文档已更新                                                    │  │
│   │                                                                 │  │
│   └─────────────────────────────────────────────────────────────────┘  │
│       ↓                                                                 │
│   ┌─────────────────────────────────────────────────────────────────┐  │
│   │ 2. 交付选项                                                      │  │
│   │    Delivery Options                                              │  │
│   ├─────────────────────────────────────────────────────────────────┤  │
│   │                                                                 │  │
│   │  选项 A: 合并到主分支                                             │  │
│   │    git merge --no-ff                                             │  │
│   │    → 适合: 功能完整，测试充分                                      │  │
│   │                                                                 │  │
│   │  选项 B: 创建 Pull Request                                        │  │
│   │    → 适合: 需要人工审查                                           │  │
│   │    → 生成 PR 描述                                                 │  │
│   │                                                                 │  │
│   │  选项 C: 保留分支继续开发                                         │  │
│   │    → 适合: 功能未完成，后续继续                                    │  │
│   │                                                                 │  │
│   │  选项 D: 废弃工作区                                               │  │
│   │    → 适合: 原型验证，不合并                                        │  │
│   │    → 保留经验教训                                                 │  │
│   │                                                                 │  │
│   └─────────────────────────────────────────────────────────────────┘  │
│       ↓                                                                 │
│   用户选择选项                                                            │
│       ↓                                                                 │
│   ┌─────────────────────────────────────────────────────────────────┐  │
│   │ 3. 执行交付                                                      │  │
│   │    Execute Delivery                                              │  │
│   └─────────────────────────────────────────────────────────────────┘  │
│       ↓                                                                 │
│   ┌─────────────────────────────────────────────────────────────────┐  │
│   │ 4. 清理和报告                                                    │  │
│   │    Cleanup & Report                                              │  │
│   ├─────────────────────────────────────────────────────────────────┤  │
│   │                                                                 │  │
│   │  □ 清理工作区 (如选择废弃)                                        │  │
│   │  □ 生成交付报告                                                   │  │
│   │  □ 记录经验教训                                                   │  │
│   │                                                                 │  │
│   └─────────────────────────────────────────────────────────────────┘  │
│       ↓                                                                 │
│   交付完成 ✅                                                            │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## 详细步骤

### Step 1: 验证完成度

**检查清单:**
```markdown
## Completion Verification

### Tasks
- [ ] All tasks from plan completed
- [ ] TodoWrite shows 100% complete
- [ ] No pending reviews

### Code
- [ ] All changes committed
- [ ] Commit messages follow convention
- [ ] No debug code left
- [ ] No console.log left (or explained)

### Tests
- [ ] All tests passing
- [ ] Coverage meets target
- [ ] No skipped tests (or explained)

### Documentation
- [ ] API docs updated
- [ ] README updated (if needed)
- [ ] ADRs recorded

### Quality
- [ ] Level 4 Gate passed
- [ ] No Critical issues open
- [ ] Code review completed
```

### Step 2: 交付选项

#### 选项 A: 合并到主分支

**适用场景:**
- 功能完整且测试充分
- 不需要额外审查
- 小功能或修复

**操作:**
```bash
# 切换到主分支
git checkout main

# 合并
git merge --no-ff feature/xxx -m "feat: add user authentication

- User registration and login
- JWT token management
- Password hashing with bcrypt

Closes #123"

# 推送
git push origin main

# 清理工作区
git worktree remove .worktrees/feature/xxx
git branch -d feature/xxx
```

#### 选项 B: 创建 Pull Request

**适用场景:**
- 需要团队成员审查
- 大功能或架构变更
- 需要讨论

**操作:**
```bash
# 推送分支
git push -u origin feature/xxx

# 生成 PR 描述 (见下方模板)
# 创建 PR (通过 GitHub/GitLab CLI 或 Web)
```

**PR 描述模板:**
```markdown
## Summary
Brief description of changes

## Changes
- Change 1
- Change 2
- Change 3

## Testing
- [ ] Unit tests added/updated
- [ ] Integration tests passing
- [ ] E2E tests passing
- [ ] Manual testing completed

## Checklist
- [ ] Code follows style guide
- [ ] Documentation updated
- [ ] No breaking changes (or documented)

## Related
Closes #123
```

#### 选项 C: 保留分支继续开发

**适用场景:**
- 功能未完成
- 需要后续迭代
- 等待依赖

**操作:**
```bash
# 记录当前状态
git log --oneline > docs/notes/feature-xxx-progress.md

# 保留工作区
# (不做任何清理)

# 提供继续开发的命令
echo "To continue work:
cd .worktrees/feature/xxx
git status
"
```

#### 选项 D: 废弃工作区

**适用场景:**
- 原型验证
- 实验性代码
- 方向变更

**操作:**
```bash
# 记录经验教训 (重要!)
cat > docs/notes/feature-xxx-lessons.md << 'EOF'
# Lessons Learned from feature/xxx

## What We Tried
...

## What Worked
...

## What Didn't Work
...

## Key Insights
...

## Code Snippets Worth Keeping
...
EOF

# 清理工作区
git worktree remove .worktrees/feature/xxx
git branch -D feature/xxx
```

### Step 3: 执行交付

**根据用户选择执行相应操作。**

### Step 4: 清理和报告

#### 清理操作
```bash
# 如果是合并或废弃，清理工作区
if [ "$choice" = "merge" ] || [ "$choice" = "discard" ]; then
  git worktree remove .worktrees/feature/xxx
fi

# 如果是合并，删除分支
if [ "$choice" = "merge" ]; then
  git branch -d feature/xxx
fi
```

---

## 交付报告

### 报告模板

```markdown
# Delivery Report

**Project:** [Name]
**Feature:** [Feature Name]
**Date:** YYYY-MM-DD
**Delivery Option:** [Merge/PR/Keep/Discard]

---

## Summary

### Stats
| Metric | Value |
|--------|-------|
| Total Time | X hours |
| Tasks Completed | X / X |
| Commits | X |
| Lines Added | +X |
| Lines Removed | -X |
| Test Coverage | X% |

### Deliverables
- [ ] Source Code
- [ ] Tests
- [ ] Documentation
- [ ] API Specs

---

## What Was Built

### Features
1. Feature 1
2. Feature 2
3. Feature 3

### Architecture
[Architecture summary]

### Key Decisions
| Decision | Reason |
|----------|--------|
| Decision 1 | Reason |
| Decision 2 | Reason |

---

## Quality Metrics

### Test Results
| Suite | Tests | Passed | Coverage |
|-------|-------|--------|----------|
| Unit | X | X | X% |
| Integration | X | X | X% |
| E2E | X | X | - |

### Code Quality
| Metric | Value |
|--------|-------|
| Critical Issues | 0 |
| Important Issues | X (documented) |
| Code Smells | X (documented) |

### Performance
| Metric | Baseline | Result | Status |
|--------|----------|--------|--------|
| Response Time | Xms | Xms | ✅ |
| Throughput | X | X | ✅ |

---

## Known Limitations

1. Limitation 1
   - Impact: ...
   - Workaround: ...

2. Limitation 2
   - Impact: ...
   - Workaround: ...

---

## Next Steps

### If Merged
- [ ] Deploy to staging
- [ ] Monitor metrics
- [ ] Announce to team

### If PR
- [ ] Request reviews
- [ ] Address feedback
- [ ] Merge after approval

### If Kept
- [ ] Continue with Task X
- [ ] Implement Feature Y

### If Discarded
- [ ] Review lessons learned
- [ ] Apply insights to next iteration

---

## Artifacts

### Code
- Branch: `feature/xxx`
- Commit: `abc123`
- PR: #123 (if applicable)

### Documentation
- Design Doc: [link]
- Plan Doc: [link]
- API Docs: [link]

### Reports
- Test Report: [link]
- Code Review: [link]

---

## Lessons Learned

### What Went Well
- 
- 

### What Could Be Improved
- 
- 

### Insights
- 
-
```

---

## 与 Superpowers 的对应

| Vibe Coding | Superpowers | 说明 |
|-------------|-------------|------|
| Phase 5 | finishing-a-development-branch skill | 完成开发分支 |

---

**最后更新**: 2026-01-30
**版本**: v2.0
