# 智能任务路由系统 (Smart Task Router)

> 基于任务特征自动选择最优 Agent 组合，实现智能化的任务分配。

---

## 概述

智能任务路由系统分析用户输入的任务描述，自动识别任务类型、复杂度和所需技能，然后选择最合适的 Agent 或 Agent 组合来执行。

```
用户输入
    ↓
[任务分析器] → 任务类型 | 复杂度 | 技术栈 | 紧急度
    ↓
[路由决策器] → Agent 组合 + 执行策略
    ↓
[执行引擎] → 调度 Agent 执行任务
```

---

## 任务分类模型

### 任务特征维度

| 维度 | 选项 | 说明 |
|------|------|------|
| **类型** | design/plan/coding/review/debug/doc | 任务类别 |
| **复杂度** | simple/medium/complex | 任务难度 |
| **范围** | single/module/system | 影响范围 |
| **技术栈** | frontend/backend/fullstack/devops | 技术领域 |
| **紧急度** | low/medium/high/critical | 优先级 |

### 任务分类决策树

```
用户输入
    ↓
包含"设计"、"架构"、"方案"?
    ├── 是 → [design] → vibe-architect
    └── 否 →
        包含"计划"、"拆分"、"任务"?
        ├── 是 → [plan] → vibe-architect
        └── 否 →
            包含"实现"、"开发"、"写代码"?
            ├── 是 → [coding] → vibe-coder
            └── 否 →
                包含"审查"、"检查"、"review"?
                ├── 是 → [review] → vibe-reviewer
                └── 否 →
                    包含"bug"、"错误"、"修复"?
                    ├── 是 → [debug] → vibe-debugger
                    └── 否 →
                        包含"文档"、"说明"?
                        └── 是 → [doc] → vibe-documenter
```

---

## 路由策略

### 策略 1: 单 Agent 模式 (Simple Task)

**适用场景:**
- 单一、明确的任务
- 不需要多角色协作
- 快速交付

**示例:**
```
输入: "帮我写一个邮箱验证函数"
分析:
  - 类型: coding
  - 复杂度: simple
  - 范围: single
  - 技术栈: backend
  
路由决策:
  → [@vibe-coder] 单独执行
  → 跳过设计阶段
  → 直接 TDD 实现
```

### 策略 2: 双 Agent 模式 (Pair Mode)

**适用场景:**
- 需要编码 + 审查
- 中等复杂度
- 质量保证要求高

**示例:**
```
输入: "实现用户认证模块"
分析:
  - 类型: coding
  - 复杂度: medium
  - 范围: module
  - 技术栈: fullstack
  
路由决策:
  → [vibe-coding:design] 快速设计 (简化)
  → [@vibe-coder] 实现
  → [@vibe-reviewer] 实时审查
```

### 策略 3: 完整团队模式 (Full Team)

**适用场景:**
- 复杂系统开发
- 多模块协作
- 生产级交付

**示例:**
```
输入: "开发一个电商平台"
分析:
  - 类型: coding
  - 复杂度: complex
  - 范围: system
  - 技术栈: fullstack
  - 紧急度: medium
  
路由决策:
  → [vibe-coding] 完整五阶段流程
  → 所有 Agent 参与
  → 严格质量门禁
```

### 策略 4: 快速原型模式 (Quick Prototype)

**适用场景:**
- 验证想法
- MVP 开发
- 时间敏感

**示例:**
```
输入: "快速做个任务管理原型"
分析:
  - 类型: coding
  - 复杂度: medium
  - 范围: module
  - 紧急度: high
  
路由决策:
  → [vibe-coding:quick] 简化流程
  → 跳过详细设计
  → 最小可行实现
```

### 策略 5: 专家会诊模式 (Expert Panel)

**适用场景:**
- 技术决策困难
- 架构争议
- 需要多方评估

**示例:**
```
输入: "选择微服务还是单体架构？"
分析:
  - 类型: design
  - 复杂度: complex
  - 范围: system
  
路由决策:
  → [vibe-architect] 主持讨论
  → [@vibe-reviewer] 评估可维护性
  → [@security-advisor] 评估安全性
  → [@vibe-debugger] 评估可调试性
  → 投票决策
```

---

## 复杂度评估算法

### 复杂度评分维度

| 维度 | 权重 | 评分标准 |
|------|------|---------|
| 功能点数量 | 30% | 1-3:简单 4-7:中等 8+:复杂 |
| 技术难度 | 25% | 常用技术:简单 新技术:中等 未知技术:复杂 |
| 依赖关系 | 20% | 无依赖:简单 模块内:中等 跨系统:复杂 |
| 业务逻辑 | 15% | CRUD:简单 工作流:中等 复杂规则:复杂 |
| 性能要求 | 10% | 无特殊:简单 高并发:中等 极端性能:复杂 |

### 复杂度计算公式

```
复杂度 = Σ(维度得分 × 权重)

结果映射:
0-40: simple (简单)
41-70: medium (中等)
71-100: complex (复杂)
```

### 示例评估

**任务: "实现用户注册登录"**

| 维度 | 得分 | 权重 | 加权得分 |
|------|------|------|---------|
| 功能点 | 3 | 30% | 9 |
| 技术难度 | 2 (常用) | 25% | 5 |
| 依赖关系 | 2 (模块内) | 20% | 4 |
| 业务逻辑 | 3 (工作流) | 15% | 4.5 |
| 性能要求 | 1 (无特殊) | 10% | 1 |
| **总计** | | | **23.5** |

**结论:** simple → 单 Agent 模式

---

## 路由配置

### 默认路由规则

```yaml
# router-config.yaml
routes:
  # 简单任务 → 单 Agent
  - match:
      complexity: simple
      type: [coding, debug, doc]
    action: single_agent
    agent: auto_select
    
  # 中等任务 → 双 Agent
  - match:
      complexity: medium
      type: coding
    action: pair_mode
    agents: [vibe-coder, vibe-reviewer]
    
  # 复杂任务 → 完整团队
  - match:
      complexity: complex
    action: full_team
    workflow: complete_5_phase
    
  # 紧急任务 → 快速原型
  - match:
      urgency: high
    action: quick_prototype
    skip_phases: [detailed_design]
    
  # 架构决策 → 专家会诊
  - match:
      type: design
      complexity: complex
    action: expert_panel
    agents: [architect, reviewer, security-advisor]
```

### 自定义路由规则

用户可以通过配置文件自定义路由规则:

```yaml
# .vibe-coding/config.yaml
router:
  rules:
    # 我的项目总是需要安全审查
    - match:
        type: coding
      add_agents: [security-advisor]
      
    # 前端任务使用特定的代码规范
    - match:
        tech_stack: frontend
      context: 
        - tech-specs/design-system.md
        
    # 数据库相关任务需要架构师审查
    - match:
        keywords: [database, schema, migration]
      require_approval: architect
```

---

## 使用方式

### 自动路由 (默认)

```bash
# 系统自动分析并路由
[vibe-coding] 我需要开发一个用户管理系统
# → 分析复杂度: complex
# → 选择策略: 完整团队模式
# → 启动五阶段流程
```

### 手动指定路由

```bash
# 强制使用特定模式
[vibe-coding:quick] 快速原型
[vibe-coding:expert] 专家会诊
[vibe-coding:pair] 结对模式
```

### 查看路由决策

```bash
# 预览路由决策 (不执行)
[vibe-coding:preview] 开发一个电商平台

# 输出:
# 任务分析:
#   - 类型: coding
#   - 复杂度: complex
#   - 预计时间: 3-4 小时
# 
# 路由决策:
#   - 策略: 完整团队模式
#   - Agent: [vibe-architect, vibe-coder, vibe-reviewer, vibe-debugger, vibe-documenter]
#   - 流程: 五阶段完整流程
# 
# 确认执行? [Y/n]
```

---

## 路由优化建议

### 性能优化

1. **缓存分析结果**
   - 相似任务复用路由决策
   - 减少重复分析

2. **并行预加载**
   - 预测下一个任务
   - 提前准备 Agent 上下文

3. **智能降级**
   - 高负载时简化流程
   - 保证核心功能可用

### 质量优化

1. **路由反馈学习**
   - 收集路由效果反馈
   - 优化决策算法

2. **A/B 测试**
   - 对比不同路由策略
   - 选择最优方案

3. **人工干预**
   - 允许用户覆盖路由
   - 记录干预原因

---

## 实现示例

### 路由决策伪代码

```typescript
interface TaskRequest {
  description: string;
  context?: string;
  constraints?: string[];
}

interface RouteDecision {
  strategy: 'single' | 'pair' | 'full' | 'quick' | 'expert';
  agents: Agent[];
  workflow: Workflow;
  estimatedTime: number;
}

class SmartTaskRouter {
  async route(request: TaskRequest): Promise<RouteDecision> {
    // 1. 分析任务特征
    const features = await this.analyzeTask(request);
    
    // 2. 评估复杂度
    const complexity = this.assessComplexity(features);
    
    // 3. 选择策略
    const strategy = this.selectStrategy(features, complexity);
    
    // 4. 配置 Agent
    const agents = this.configureAgents(strategy, features);
    
    // 5. 返回决策
    return {
      strategy: strategy.name,
      agents: agents,
      workflow: strategy.workflow,
      estimatedTime: this.estimateTime(features, complexity)
    };
  }
  
  private async analyzeTask(request: TaskRequest): TaskFeatures {
    // 使用 NLP 分析任务描述
    const analysis = await nlpAnalyzer.analyze(request.description);
    
    return {
      type: analysis.classifyTaskType(),
      techStack: analysis.identifyTechStack(),
      keywords: analysis.extractKeywords(),
      scope: analysis.determineScope(),
      // ...
    };
  }
  
  private assessComplexity(features: TaskFeatures): Complexity {
    const scores = {
      functionality: this.scoreFunctionality(features),
      technical: this.scoreTechnicalDifficulty(features),
      dependencies: this.scoreDependencies(features),
      business: this.scoreBusinessLogic(features),
      performance: this.scorePerformanceRequirements(features)
    };
    
    const totalScore = weightedSum(scores, COMPLEXITY_WEIGHTS);
    
    return this.mapScoreToComplexity(totalScore);
  }
  
  private selectStrategy(features: TaskFeatures, complexity: Complexity): Strategy {
    // 应用路由规则
    for (const rule of this.config.rules) {
      if (rule.matches(features, complexity)) {
        return rule.strategy;
      }
    }
    
    // 默认策略
    return DEFAULT_STRATEGIES[complexity];
  }
}
```

---

## 检查清单

### 路由系统实施

- [ ] 任务分析器实现
- [ ] 复杂度评估算法
- [ ] 路由决策引擎
- [ ] 策略配置系统
- [ ] 反馈学习机制

### 集成检查

- [ ] 与现有 Agent 系统兼容
- [ ] 用户可覆盖路由决策
- [ ] 路由日志记录
- [ ] 性能监控

---

**最后更新**: 2026-01-30
**版本**: v2.0
