# TODO API 示例项目

📚 **项目类型**: 简化版示例（演示工作流程）
⏱️ **预计时间**: 15-30 分钟
🎯 **学习目标**: 理解 Vibe Coding Team 的 Agent 协作流程

---

## 📋 项目概述

这是一个简单的任务管理 API 项目，用于演示 Vibe Coding Team 的完整工作流程。

**功能特性**:
- ✅ 创建任务（标题、描述、优先级）
- ✅ 查看所有任务
- ✅ 更新任务状态（待办/进行中/已完成）
- ✅ 删除任务
- ✅ 按优先级排序

**技术栈**:
- Node.js + Express
- 内存存储（简化版，不使用数据库）
- RESTful API 设计

---

## 🎯 为什么选择这个示例？

这是一个**简化版示例**，重点在于：
- 📚 展示 Vibe Coding Team 的工作流程
- 🎭 演示 5 个 Agent 的协作方式
- ⚡ 快速上手，无需配置数据库
- 📖 学习如何与 Agent 交互

**注意**: 本示例不提供完整可运行的代码，而是展示关键代码片段和开发流程。

---

## 🚀 完整流程演示

### 步骤 1: 需求分析与架构设计

**命令**:
```bash
[vibe-architect] 我需要一个简单的任务管理 API，支持：
  - 创建任务（标题、描述、优先级）
  - 查看所有任务
  - 更新任务状态（待办/进行中/已完成）
  - 删除任务
  使用 Node.js + Express，内存存储即可
```

**Vibe Architect 的输出**:

#### 1.1 需求分析

```markdown
## 功能需求

1. 任务 CRUD 操作
   - Create: POST /api/tasks
   - Read: GET /api/tasks, GET /api/tasks/:id
   - Update: PUT /api/tasks/:id
   - Delete: DELETE /api/tasks/:id

2. 任务状态管理
   - 待办 (todo)
   - 进行中 (in-progress)
   - 已完成 (done)

3. 任务属性
   - id: 唯一标识符
   - title: 任务标题
   - description: 任务描述
   - priority: 优先级 (low, medium, high)
   - status: 任务状态
   - createdAt: 创建时间
   - updatedAt: 更新时间
```

#### 1.2 架构设计

```markdown
## 系统架构

### 目录结构
```
todo-api/
├── src/
│   ├── controllers/
│   │   └── taskController.js    # 任务控制器
│   ├── routes/
│   │   └── taskRoutes.js        # 路由定义
│   ├── models/
│   │   └── Task.js              # 任务模型
│   ├── services/
│   │   └── taskService.js       # 业务逻辑
│   └── app.js                   # Express 应用配置
├── package.json
└── server.js                    # 入口文件
```

### 模块划分

1. **Controller 层**: 处理 HTTP 请求和响应
2. **Service 层**: 实现业务逻辑
3. **Model 层**: 定义数据模型
4. **Route 层**: 定义 API 端点

### 技术选型

- **框架**: Express.js
  - 轻量级、灵活
  - 中间件生态丰富

- **数据存储**: 内存数组
  - 简化示例，无需配置数据库
  - 生产环境应使用持久化存储
```

#### 1.3 API 端点设计

```markdown
## API 端点

### 1. 创建任务
POST /api/tasks
Content-Type: application/json

{
  "title": "完成项目文档",
  "description": "编写 API 文档和使用说明",
  "priority": "high"
}

Response: 201 Created
{
  "id": "1",
  "title": "完成项目文档",
  "description": "编写 API 文档和使用说明",
  "priority": "high",
  "status": "todo",
  "createdAt": "2026-01-27T10:00:00.000Z",
  "updatedAt": "2026-01-27T10:00:00.000Z"
}

### 2. 获取所有任务
GET /api/tasks

Response: 200 OK
[
  {
    "id": "1",
    "title": "完成项目文档",
    "description": "编写 API 文档和使用说明",
    "priority": "high",
    "status": "todo",
    "createdAt": "2026-01-27T10:00:00.000Z",
    "updatedAt": "2026-01-27T10:00:00.000Z"
  }
]

### 3. 获取单个任务
GET /api/tasks/:id

Response: 200 OK
{
  "id": "1",
  "title": "完成项目文档",
  ...
}

### 4. 更新任务
PUT /api/tasks/:id
Content-Type: application/json

{
  "status": "in-progress",
  "title": "完成项目文档（更新）"
}

Response: 200 OK
{
  "id": "1",
  "title": "完成项目文档（更新）",
  "status": "in-progress",
  "updatedAt": "2026-01-27T11:00:00.000Z"
}

### 5. 删除任务
DELETE /api/tasks/:id

Response: 204 No Content
```

---

### 步骤 2: 代码生成

**命令**:
```bash
[@vibe-coder] 基于上面的架构设计，实现任务管理的 API 端点
```

**Vibe Coder 的输出**:

#### 2.1 数据模型 (src/models/Task.js)

```javascript
class Task {
  constructor(data) {
    this.id = data.id || this.generateId();
    this.title = data.title;
    this.description = data.description || '';
    this.priority = data.priority || 'medium';
    this.status = data.status || 'todo';
    this.createdAt = data.createdAt || new Date().toISOString();
    this.updatedAt = data.updatedAt || new Date().toISOString();
  }

  generateId() {
    return Date.now().toString(36) + Math.random().toString(36).substr(2);
  }

  validate() {
    const errors = [];

    if (!this.title || this.title.trim() === '') {
      errors.push('Title is required');
    }

    if (!['low', 'medium', 'high'].includes(this.priority)) {
      errors.push('Priority must be low, medium, or high');
    }

    if (!['todo', 'in-progress', 'done'].includes(this.status)) {
      errors.push('Status must be todo, in-progress, or done');
    }

    return errors;
  }

  toJSON() {
    return {
      id: this.id,
      title: this.title,
      description: this.description,
      priority: this.priority,
      status: this.status,
      createdAt: this.createdAt,
      updatedAt: this.updatedAt
    };
  }
}

module.exports = Task;
```

#### 2.2 业务逻辑层 (src/services/taskService.js)

```javascript
const Task = require('../models/Task');

class TaskService {
  constructor() {
    // 内存存储
    this.tasks = new Map();
  }

  createTask(data) {
    const task = new Task(data);
    const errors = task.validate();

    if (errors.length > 0) {
      throw new Error(`Validation failed: ${errors.join(', ')}`);
    }

    this.tasks.set(task.id, task);
    return task.toJSON();
  }

  getAllTasks() {
    return Array.from(this.tasks.values()).map(task => task.toJSON());
  }

  getTaskById(id) {
    const task = this.tasks.get(id);

    if (!task) {
      throw new Error('Task not found');
    }

    return task.toJSON();
  }

  updateTask(id, data) {
    const task = this.tasks.get(id);

    if (!task) {
      throw new Error('Task not found');
    }

    // 更新字段
    if (data.title !== undefined) task.title = data.title;
    if (data.description !== undefined) task.description = data.description;
    if (data.priority !== undefined) task.priority = data.priority;
    if (data.status !== undefined) task.status = data.status;

    task.updatedAt = new Date().toISOString();

    // 验证更新后的数据
    const errors = task.validate();
    if (errors.length > 0) {
      throw new Error(`Validation failed: ${errors.join(', ')}`);
    }

    this.tasks.set(id, task);
    return task.toJSON();
  }

  deleteTask(id) {
    const task = this.tasks.get(id);

    if (!task) {
      throw new Error('Task not found');
    }

    this.tasks.delete(id);
    return true;
  }
}

module.exports = TaskService;
```

#### 2.3 控制器层 (src/controllers/taskController.js)

```javascript
const TaskService = require('../services/taskService');

const taskService = new TaskService();

class TaskController {
  // 创建任务
  async createTask(req, res) {
    try {
      const task = taskService.createTask(req.body);
      res.status(201).json(task);
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  }

  // 获取所有任务
  async getAllTasks(req, res) {
    try {
      const tasks = taskService.getAllTasks();
      res.status(200).json(tasks);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }

  // 获取单个任务
  async getTaskById(req, res) {
    try {
      const task = taskService.getTaskById(req.params.id);
      res.status(200).json(task);
    } catch (error) {
      res.status(404).json({ error: error.message });
    }
  }

  // 更新任务
  async updateTask(req, res) {
    try {
      const task = taskService.updateTask(req.params.id, req.body);
      res.status(200).json(task);
    } catch (error) {
      res.status(404).json({ error: error.message });
    }
  }

  // 删除任务
  async deleteTask(req, res) {
    try {
      taskService.deleteTask(req.params.id);
      res.status(204).send();
    } catch (error) {
      res.status(404).json({ error: error.message });
    }
  }
}

module.exports = new TaskController();
```

#### 2.4 路由定义 (src/routes/taskRoutes.js)

```javascript
const express = require('express');
const taskController = require('../controllers/taskController');

const router = express.Router();

// CRUD 端点
router.post('/tasks', taskController.createTask.bind(taskController));
router.get('/tasks', taskController.getAllTasks.bind(taskController));
router.get('/tasks/:id', taskController.getTaskById.bind(taskController));
router.put('/tasks/:id', taskController.updateTask.bind(taskController));
router.delete('/tasks/:id', taskController.deleteTask.bind(taskController));

module.exports = router;
```

#### 2.5 Express 应用配置 (src/app.js)

```javascript
const express = require('express');
const taskRoutes = require('./routes/taskRoutes');

const app = express();

// 中间件
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// 路由
app.use('/api', taskRoutes);

// 错误处理
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ error: 'Internal server error' });
});

module.exports = app;
```

#### 2.6 入口文件 (server.js)

```javascript
const app = require('./src/app');

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
  console.log(`API endpoint: http://localhost:${PORT}/api/tasks`);
});
```

---

### 步骤 3: 代码审查

**命令**:
```bash
[@vibe-reviewer] 审查上面生成的代码，检查：
  1. 代码质量和可维护性
  2. 安全性
  3. 性能
  4. 最佳实践
```

**Vibe Reviewer 的输出**:

#### 3.1 代码质量评估

```markdown
## 整体评分: B+ (良好)

### 优点
✅ **代码结构清晰**
  - 良好的分层架构（Controller-Service-Model）
  - 职责分离明确

✅ **错误处理**
  - 基本的错误处理机制
  - 返回适当的 HTTP 状态码

✅ **数据验证**
  - Task 模型包含 validate() 方法
  - 验证必填字段和枚举值

### 需要改进的地方
⚠️ **输入验证不够完善**
  - 缺少请求体验证中间件
  - 没有验证 Content-Type
  - 缺少 XSS 防护

⚠️ **错误处理不够详细**
  - 错误消息暴露内部实现
  - 缺少错误日志记录

⚠️ **缺少请求 ID**
  - 难以追踪请求链路
  - 调试困难
```

#### 3.2 安全性检查

```markdown
## 安全性评分: B- (需要改进)

### 发现的问题

1. ⚠️ **缺少输入长度限制**
   ```javascript
   // 当前代码
   this.title = data.title;

   // 建议
   this.title = data.title?.substring(0, 200);
   ```

2. ⚠️ **缺少 CORS 配置**
   ```javascript
   // 建议添加
   app.use(cors({
     origin: process.env.ALLOWED_ORIGINS?.split(',') || '*',
     credentials: true
   }));
   ```

3. ⚠️ **缺少速率限制**
   - 建议添加 express-rate-limit 中间件

4. ⚠️ **错误消息过于详细**
   ```javascript
   // 当前代码
   throw new Error(`Validation failed: ${errors.join(', ')}`);

   // 建议
   throw new Error('Validation failed');
   ```
```

#### 3.3 性能评估

```markdown
## 性能评分: A- (良好)

### 优点
✅ 内存存储，响应快速
✅ Map 数据结构，查找效率高 O(1)

### 建议优化
⚠️ **缺少分页**
   - 当任务数量很多时，GET /api/tasks 会很慢
   - 建议添加分页参数

⚠️ **缺少缓存**
   - 建议添加 HTTP 缓存头
   - 可以考虑使用 Redis
```

#### 3.4 改进建议

```markdown
## 推荐改进

### 1. 添加输入验证中间件
```javascript
const { body, param, validationResult } = require('express-validator');

const validateTaskCreation = [
  body('title')
    .trim()
    .isLength({ min: 1, max: 200 })
    .withMessage('Title must be 1-200 characters'),
  body('priority')
    .isIn(['low', 'medium', 'high'])
    .withMessage('Invalid priority'),
  (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }
    next();
  }
];
```

### 2. 添加请求日志
```javascript
const morgan = require('morgan');

app.use(morgan('combined'));
```

### 3. 改进错误处理
```javascript
class AppError extends Error {
  constructor(message, statusCode) {
    super(message);
    this.statusCode = statusCode;
    this.isOperational = true;
  }
}

// 在控制器中使用
if (!task) {
  throw new AppError('Task not found', 404);
}
```
```

---

### 步骤 4: 测试生成

**命令**:
```bash
[@vibe-debugger] 为上面的代码生成全面的测试用例，包括：
  1. 单元测试
  2. 集成测试
  3. 边界情况测试
```

**Vibe Debugger 的输出**:

#### 4.1 单元测试 (tests/taskService.test.js)

```javascript
const TaskService = require('../src/services/taskService');

describe('TaskService', () => {
  let taskService;

  beforeEach(() => {
    taskService = new TaskService();
  });

  describe('createTask', () => {
    it('should create a task with valid data', () => {
      const taskData = {
        title: 'Test Task',
        description: 'Test Description',
        priority: 'high'
      };

      const task = taskService.createTask(taskData);

      expect(task).toHaveProperty('id');
      expect(task.title).toBe('Test Task');
      expect(task.status).toBe('todo');
    });

    it('should throw error when title is missing', () => {
      const taskData = {
        description: 'Test Description'
      };

      expect(() => {
        taskService.createTask(taskData);
      }).toThrow('Title is required');
    });

    it('should throw error when priority is invalid', () => {
      const taskData = {
        title: 'Test Task',
        priority: 'invalid'
      };

      expect(() => {
        taskService.createTask(taskData);
      }).toThrow('Priority must be low, medium, or high');
    });
  });

  describe('getAllTasks', () => {
    it('should return empty array initially', () => {
      const tasks = taskService.getAllTasks();
      expect(tasks).toEqual([]);
    });

    it('should return all tasks', () => {
      taskService.createTask({ title: 'Task 1' });
      taskService.createTask({ title: 'Task 2' });

      const tasks = taskService.getAllTasks();
      expect(tasks).toHaveLength(2);
    });
  });

  describe('getTaskById', () => {
    it('should return task by id', () => {
      const task = taskService.createTask({ title: 'Test Task' });
      const found = taskService.getTaskById(task.id);

      expect(found.id).toBe(task.id);
    });

    it('should throw error when task not found', () => {
      expect(() => {
        taskService.getTaskById('non-existent-id');
      }).toThrow('Task not found');
    });
  });

  describe('updateTask', () => {
    it('should update task fields', () => {
      const task = taskService.createTask({ title: 'Original Title' });

      const updated = taskService.updateTask(task.id, {
        title: 'Updated Title',
        status: 'in-progress'
      });

      expect(updated.title).toBe('Updated Title');
      expect(updated.status).toBe('in-progress');
    });

    it('should throw error when updating non-existent task', () => {
      expect(() => {
        taskService.updateTask('non-existent-id', { title: 'New Title' });
      }).toThrow('Task not found');
    });
  });

  describe('deleteTask', () => {
    it('should delete task', () => {
      const task = taskService.createTask({ title: 'Test Task' });
      const result = taskService.deleteTask(task.id);

      expect(result).toBe(true);
      expect(taskService.getAllTasks()).toHaveLength(0);
    });

    it('should throw error when deleting non-existent task', () => {
      expect(() => {
        taskService.deleteTask('non-existent-id');
      }).toThrow('Task not found');
    });
  });
});
```

#### 4.2 集成测试 (tests/tasks.test.js)

```javascript
const request = require('supertest');
const app = require('../src/app');

describe('Task API Integration Tests', () => {
  describe('POST /api/tasks', () => {
    it('should create a new task', async () => {
      const response = await request(app)
        .post('/api/tasks')
        .send({
          title: 'Integration Test Task',
          description: 'Testing task creation',
          priority: 'high'
        })
        .expect(201);

      expect(response.body).toHaveProperty('id');
      expect(response.body.title).toBe('Integration Test Task');
    });

    it('should return 400 for invalid data', async () => {
      const response = await request(app)
        .post('/api/tasks')
        .send({
          description: 'Missing title'
        })
        .expect(400);

      expect(response.body).toHaveProperty('error');
    });
  });

  describe('GET /api/tasks', () => {
    it('should return all tasks', async () => {
      // 创建测试数据
      await request(app)
        .post('/api/tasks')
        .send({ title: 'Task 1' });

      await request(app)
        .post('/api/tasks')
        .send({ title: 'Task 2' });

      const response = await request(app)
        .get('/api/tasks')
        .expect(200);

      expect(response.body).toHaveLength(2);
    });
  });

  describe('PUT /api/tasks/:id', () => {
    it('should update task status', async () => {
      // 创建任务
      const createResponse = await request(app)
        .post('/api/tasks')
        .send({ title: 'Test Task' });

      const taskId = createResponse.body.id;

      // 更新任务
      const updateResponse = await request(app)
        .put(`/api/tasks/${taskId}`)
        .send({ status: 'done' })
        .expect(200);

      expect(updateResponse.body.status).toBe('done');
    });

    it('should return 404 for non-existent task', async () => {
      await request(app)
        .put('/api/tasks/non-existent')
        .send({ status: 'done' })
        .expect(404);
    });
  });

  describe('DELETE /api/tasks/:id', () => {
    it('should delete task', async () => {
      // 创建任务
      const createResponse = await request(app)
        .post('/api/tasks')
        .send({ title: 'Test Task' });

      const taskId = createResponse.body.id;

      // 删除任务
      await request(app)
        .delete(`/api/tasks/${taskId}`)
        .expect(204);

      // 验证删除
      await request(app)
        .get(`/api/tasks/${taskId}`)
        .expect(404);
    });
  });
});
```

#### 4.3 边界情况测试

```javascript
describe('Boundary Cases', () => {
  describe('Input Validation', () => {
    it('should handle very long title', async () => {
      const longTitle = 'A'.repeat(10000);

      const response = await request(app)
        .post('/api/tasks')
        .send({ title: longTitle })
        .expect(201);

      // 应该截断或拒绝超长标题
      expect(response.body.title.length).toBeLessThanOrEqual(200);
    });

    it('should handle special characters in title', async () => {
      const response = await request(app)
        .post('/api/tasks')
        .send({
          title: '<script>alert("XSS")</script>',
          description: '"; DROP TABLE tasks; --'
        })
        .expect(201);

      // 应该转义或过滤特殊字符
      expect(response.body.title).not.toContain('<script>');
    });

    it('should handle empty description', async () => {
      const response = await request(app)
        .post('/api/tasks')
        .send({
          title: 'Test Task',
          description: ''
        })
        .expect(201);

      expect(response.body.description).toBe('');
    });
  });

  describe('Concurrent Operations', () => {
    it('should handle concurrent task creation', async () => {
      const promises = Array.from({ length: 100 }, (_, i) =>
        request(app)
          .post('/api/tasks')
          .send({ title: `Concurrent Task ${i}` })
      );

      const responses = await Promise.all(promises);

      responses.forEach(response => {
        expect(response.status).toBe(201);
      });
    });
  });

  describe('Edge Cases', () => {
    it('should handle task with maximum priority', async () => {
      const response = await request(app)
        .post('/api/tasks')
        .send({
          title: 'High Priority Task',
          priority: 'high'
        })
        .expect(201);

      expect(response.body.priority).toBe('high');
    });

    it('should handle task status transition', async () => {
      const createResponse = await request(app)
        .post('/api/tasks')
        .send({ title: 'Test Task' });

      const taskId = createResponse.body.id;

      // todo -> in-progress -> done
      await request(app)
        .put(`/api/tasks/${taskId}`)
        .send({ status: 'in-progress' })
        .expect(200);

      await request(app)
        .put(`/api/tasks/${taskId}`)
        .send({ status: 'done' })
        .expect(200);
    });
  });
});
```

---

### 步骤 5: 文档生成

**命令**:
```bash
[@vibe-documenter] 为这个 TODO API 生成完整的 API 文档
```

**Vibe Documenter 的输出**: (参见 [API 文档示例](./API_DOCUMENTATION.md))

---

## 📊 Agent 协作流程总结

```
用户需求
   ↓
[vibe-architect] 需求分析与架构设计 (10 分钟)
   ↓
  输出: 架构文档 + API 端点设计
   ↓
[@vibe-coder] 代码生成 (20 分钟)
   ↓
  输出: 完整代码实现
   ↓
[@vibe-reviewer] 代码审查 (10 分钟)
   ↓
  输出: 审查报告 + 改进建议
   ↓
[@vibe-debugger] 测试生成 (15 分钟)
   ↓
  输出: 测试用例
   ↓
[@vibe-documenter] 文档生成 (10 分钟)
   ↓
  输出: API 文档
   ↓
[vibe-architect] 最终整合与质量把控 (5 分钟)
   ↓
  交付: 代码 + 测试 + 文档

总耗时: 约 70 分钟
```

---

## 🎯 学习要点

通过这个示例，您学会了：

1. ✅ **如何启动 Vibe Coding 项目**
   - 使用 `[vibe-architect]` 表达需求
   - 获得架构设计和技术方案

2. ✅ **Agent 协作流程**
   - 5 个 Agent 如何协作
   - 每个阶段的输出是什么
   - 如何在 Agent 之间传递上下文

3. ✅ **代码质量保证**
   - 代码审查的关键点
   - 安全性和性能考虑
   - 测试覆盖的重要性

4. ✅ **文档自动化**
   - 自动生成 API 文档
   - 保持文档与代码同步

---

## 🚀 下一步

- 📖 查看完整可运行示例: [博客系统](../blog-system/README.md)
- 🎨 学习前端开发: [任务管理 UI](../task-ui/README.md)
- 🎬 观看视频演示: [视频脚本](../../resources/video-demos/demo-scripts.md)

---

**项目类型**: 简化版示例（演示工作流程）
**最后更新**: 2026-01-27
