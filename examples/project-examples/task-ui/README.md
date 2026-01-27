# 任务管理 UI - 前端开发示例

🎨 **项目类型**: 前端简化版示例
⏱️ **预计时间**: 1-2 小时
🎯 **学习目标**: 学习使用 Vibe Coding 开发前端组件

---

## 📋 项目概述

这是一个任务管理应用的前端示例，演示如何使用 Vibe Coding Team 开发 React 前端应用。

**功能特性**:
- ✅ 任务列表展示
- ✅ 创建新任务
- ✅ 编辑任务
- ✅ 删除任务
- ✅ 任务状态切换（待办/进行中/已完成）
- ✅ 任务筛选和搜索
- ✅ 响应式设计

**技术栈**:
- React 18
- React Router
- Axios
- TailwindCSS / CSS Modules
- 后端 API 集成

---

## 🎯 为什么选择这个示例？

这是一个**前端简化版示例**，重点在于：
- 🎨 展示前端组件开发流程
- 🔄 演示与后端 API 的集成
- 📱 展示状态管理和数据流
- 🎯 展示最佳实践和设计模式

**注意**: 本示例展示关键前端代码和开发流程，而非完整的可运行应用。

---

## 🚀 Vibe Coding 前端开发流程

### 步骤 1: 需求分析

```bash
[vibe-architect] 我需要一个任务管理应用的前端界面，包括：
  - 任务列表页面（展示所有任务）
  - 任务创建/编辑表单
  - 任务状态管理
  - 任务筛选和搜索
  使用 React + TailwindCSS，后端 API 已就绪
```

**Vibe Architect 的输出**:

#### 1.1 组件层次结构

```
App
├── Layout
│   ├── Header
│   ├── Sidebar (可选)
│   └── Footer
├── TaskList (主页面)
│   ├── TaskFilters (筛选器)
│   ├── TaskSearch (搜索框)
│   └── TaskCard (任务卡片)
│       ├── TaskTitle
│       ├── TaskDescription
│       ├── TaskMeta (作者、时间、标签)
│       └── TaskActions (编辑、删除、状态切换)
├── TaskForm (创建/编辑表单)
│   ├── FormInput (标题输入)
│   ├── FormTextarea (描述输入)
│   ├── FormSelect (优先级选择)
│   └── FormButtons (提交、取消)
└── Notification (通知组件)
```

#### 1.2 页面路由设计

```
/                    → 任务列表页面
/tasks              → 任务列表页面
/tasks/new          → 创建新任务
/tasks/:id          → 任务详情
/tasks/:id/edit     → 编辑任务
```

#### 1.3 状态管理策略

```
全局状态 (Context API + useReducer)
  ├── tasks: []           // 任务列表
  ├── filter: 'all'       // 当前筛选器
  ├── search: ''          // 搜索关键词
  ├── loading: false      // 加载状态
  └── error: null         // 错误信息

本地状态 (useState)
  ├── 当前编辑的任务
  ├── 表单输入
  └── UI 状态（模态框、下拉菜单等）
```

---

### 步骤 2: 组件开发

```bash
[@vibe-coder] 基于上面的设计，实现 React 组件
```

**Vibe Coder 的输出**:

#### 2.1 主应用组件 (App.jsx)

```jsx
import React, { useState, useEffect } from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import TaskList from './components/TaskList';
import TaskForm from './components/TaskForm';
import TaskDetail from './components/TaskDetail';
import Notification from './components/Notification';
import { TaskProvider } from './context/TaskContext';
import './App.css';

function App() {
  return (
    <TaskProvider>
      <Router>
        <div className="min-h-screen bg-gray-50">
          <Header />
          <main className="container mx-auto px-4 py-8">
            <Routes>
              <Route path="/" element={<TaskList />} />
              <Route path="/tasks" element={<TaskList />} />
              <Route path="/tasks/new" element={<TaskForm />} />
              <Route path="/tasks/:id" element={<TaskDetail />} />
              <Route path="/tasks/:id/edit" element={<TaskForm />} />
            </Routes>
          </main>
          <Notification />
        </div>
      </Router>
    </TaskProvider>
  );
}

function Header() {
  return (
    <header className="bg-white shadow-sm">
      <div className="container mx-auto px-4 py-4">
        <h1 className="text-2xl font-bold text-gray-800">
          📋 任务管理系统
        </h1>
      </div>
    </header>
  );
}

export default App;
```

---

#### 2.2 Context 配置 (context/TaskContext.jsx)

```jsx
import React, { createContext, useContext, useReducer, useEffect } from 'react';
import axios from 'axios';

const TaskContext = createContext();

const initialState = {
  tasks: [],
  filter: 'all',
  search: '',
  loading: false,
  error: null
};

function taskReducer(state, action) {
  switch (action.type) {
    case 'SET_LOADING':
      return { ...state, loading: action.payload };

    case 'SET_ERROR':
      return { ...state, error: action.payload, loading: false };

    case 'SET_TASKS':
      return { ...state, tasks: action.payload, loading: false };

    case 'ADD_TASK':
      return { ...state, tasks: [action.payload, ...state.tasks] };

    case 'UPDATE_TASK':
      return {
        ...state,
        tasks: state.tasks.map(task =>
          task._id === action.payload._id ? action.payload : task
        )
      };

    case 'DELETE_TASK':
      return {
        ...state,
        tasks: state.tasks.filter(task => task._id !== action.payload)
      };

    case 'SET_FILTER':
      return { ...state, filter: action.payload };

    case 'SET_SEARCH':
      return { ...state, search: action.payload };

    default:
      return state;
  }
}

export function TaskProvider({ children }) {
  const [state, dispatch] = useReducer(taskReducer, initialState);

  // 加载任务
  const loadTasks = async () => {
    dispatch({ type: 'SET_LOADING', payload: true });

    try {
      const response = await axios.get('/api/tasks');
      dispatch({ type: 'SET_TASKS', payload: response.data.data.tasks });
    } catch (error) {
      dispatch({ type: 'SET_ERROR', payload: error.message });
    }
  };

  // 创建任务
  const createTask = async (taskData) => {
    dispatch({ type: 'SET_LOADING', payload: true });

    try {
      const response = await axios.post('/api/tasks', taskData);
      dispatch({ type: 'ADD_TASK', payload: response.data.data.post });
      return response.data.data.post;
    } catch (error) {
      dispatch({ type: 'SET_ERROR', payload: error.message });
      throw error;
    }
  };

  // 更新任务
  const updateTask = async (taskId, taskData) => {
    dispatch({ type: 'SET_LOADING', payload: true });

    try {
      const response = await axios.put(`/api/tasks/${taskId}`, taskData);
      dispatch({ type: 'UPDATE_TASK', payload: response.data.data.post });
      return response.data.data.post;
    } catch (error) {
      dispatch({ type: 'SET_ERROR', payload: error.message });
      throw error;
    }
  };

  // 删除任务
  const deleteTask = async (taskId) => {
    dispatch({ type: 'SET_LOADING', payload: true });

    try {
      await axios.delete(`/api/tasks/${taskId}`);
      dispatch({ type: 'DELETE_TASK', payload: taskId });
    } catch (error) {
      dispatch({ type: 'SET_ERROR', payload: error.message });
      throw error;
    }
  };

  // 设置筛选器
  const setFilter = (filter) => {
    dispatch({ type: 'SET_FILTER', payload: filter });
  };

  // 设置搜索
  const setSearch = (search) => {
    dispatch({ type: 'SET_SEARCH', payload: search });
  };

  // 获取过滤后的任务
  const getFilteredTasks = () => {
    let filtered = [...state.tasks];

    // 应用状态筛选
    if (state.filter !== 'all') {
      filtered = filtered.filter(task => task.status === state.filter);
    }

    // 应用搜索筛选
    if (state.search) {
      const searchLower = state.search.toLowerCase();
      filtered = filtered.filter(task =>
        task.title.toLowerCase().includes(searchLower) ||
        task.description.toLowerCase().includes(searchLower)
      );
    }

    return filtered;
  };

  const value = {
    ...state,
    tasks: getFilteredTasks(),
    loadTasks,
    createTask,
    updateTask,
    deleteTask,
    setFilter,
    setSearch
  };

  return (
    <TaskContext.Provider value={value}>
      {children}
    </TaskContext.Provider>
  );
}

export function useTasks() {
  const context = useContext(TaskContext);
  if (!context) {
    throw new Error('useTasks must be used within a TaskProvider');
  }
  return context;
}
```

---

#### 2.3 任务列表组件 (components/TaskList.jsx)

```jsx
import React, { useEffect } from 'react';
import { useTasks } from '../context/TaskContext';
import TaskFilters from './TaskFilters';
import TaskSearch from './TaskSearch';
import TaskCard from './TaskCard';
import { Link } from 'react-router-dom';

function TaskList() {
  const { tasks, loading, error, loadTasks, filter, search } = useTasks();

  useEffect(() => {
    loadTasks();
  }, []);

  if (loading && tasks.length === 0) {
    return (
      <div className="flex justify-center items-center h-64">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-500"></div>
      </div>
    );
  }

  if (error) {
    return (
      <div className="bg-red-50 border border-red-200 text-red-700 px-4 py-3 rounded">
        <p className="font-bold">Error</p>
        <p>{error}</p>
      </div>
    );
  }

  return (
    <div className="space-y-6">
      {/* 页面标题和操作 */}
      <div className="flex justify-between items-center">
        <h2 className="text-2xl font-bold text-gray-800">
          我的任务
          {search && ` - 搜索: "${search}"`}
          {filter !== 'all' && ` - 筛选: ${filter}`}
        </h2>
        <Link
          to="/tasks/new"
          className="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded-lg flex items-center gap-2 transition-colors"
        >
          <span>➕</span>
          <span>新建任务</span>
        </Link>
      </div>

      {/* 筛选和搜索 */}
      <div className="flex flex-col md:flex-row gap-4">
        <div className="flex-1">
          <TaskSearch />
        </div>
        <div>
          <TaskFilters />
        </div>
      </div>

      {/* 任务列表 */}
      {tasks.length === 0 ? (
        <div className="text-center py-12 bg-white rounded-lg shadow">
          <p className="text-gray-500 text-lg">
            {search || filter !== 'all'
              ? '没有找到匹配的任务'
              : '暂无任务，点击上方按钮创建第一个任务吧！'}
          </p>
        </div>
      ) : (
        <div className="grid gap-4">
          {tasks.map(task => (
            <TaskCard key={task._id} task={task} />
          ))}
        </div>
      )}
    </div>
  );
}

export default TaskList;
```

---

#### 2.4 任务卡片组件 (components/TaskCard.jsx)

```jsx
import React from 'react';
import { Link } from 'react-router-dom';
import { useTasks } from '../context/TaskContext';

const statusColors = {
  todo: 'bg-gray-100 text-gray-800',
  'in-progress': 'bg-blue-100 text-blue-800',
  done: 'bg-green-100 text-green-800'
};

const priorityColors = {
  low: 'border-l-4 border-green-400',
  medium: 'border-l-4 border-yellow-400',
  high: 'border-l-4 border-red-400'
};

function TaskCard({ task }) {
  const { updateTask, deleteTask } = useTasks();

  const handleStatusChange = async (newStatus) => {
    try {
      await updateTask(task._id, { status: newStatus });
    } catch (error) {
      console.error('Failed to update task status:', error);
    }
  };

  const handleDelete = async () => {
    if (window.confirm('确定要删除这个任务吗？')) {
      try {
        await deleteTask(task._id);
      } catch (error) {
        console.error('Failed to delete task:', error);
      }
    }
  };

  return (
    <div className={`bg-white rounded-lg shadow p-6 hover:shadow-md transition-shadow ${priorityColors[task.priority]}`}>
      <div className="flex justify-between items-start">
        {/* 任务信息 */}
        <div className="flex-1">
          <div className="flex items-center gap-3 mb-2">
            <h3 className="text-xl font-semibold text-gray-800">
              <Link to={`/tasks/${task._id}`} className="hover:text-blue-600">
                {task.title}
              </Link>
            </h3>
            <span className={`px-2 py-1 rounded text-xs font-medium ${statusColors[task.status]}`}>
              {task.status === 'todo' && '待办'}
              {task.status === 'in-progress' && '进行中'}
              {task.status === 'done' && '已完成'}
            </span>
          </div>

          {task.description && (
            <p className="text-gray-600 mb-3 line-clamp-2">
              {task.description}
            </p>
          )}

          <div className="flex items-center gap-4 text-sm text-gray-500">
            <span>创建于 {new Date(task.createdAt).toLocaleDateString()}</span>
            {task.updatedAt !== task.createdAt && (
              <span>更新于 {new Date(task.updatedAt).toLocaleDateString()}</span>
            )}
          </div>
        </div>

        {/* 操作按钮 */}
        <div className="flex items-center gap-2">
          {/* 状态切换 */}
          <select
            value={task.status}
            onChange={(e) => handleStatusChange(e.target.value)}
            className="text-sm border rounded px-2 py-1"
          >
            <option value="todo">待办</option>
            <option value="in-progress">进行中</option>
            <option value="done">已完成</option>
          </select>

          {/* 编辑按钮 */}
          <Link
            to={`/tasks/${task._id}/edit`}
            className="text-blue-600 hover:text-blue-800 px-2 py-1"
          >
            ✏️ 编辑
          </Link>

          {/* 删除按钮 */}
          <button
            onClick={handleDelete}
            className="text-red-600 hover:text-red-800 px-2 py-1"
          >
            🗑️ 删除
          </button>
        </div>
      </div>
    </div>
  );
}

export default TaskCard;
```

---

#### 2.5 任务表单组件 (components/TaskForm.jsx)

```jsx
import React, { useState, useEffect } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import { useTasks } from '../context/TaskContext';
import Notification from './Notification';

function TaskForm() {
  const { _id } = useParams();
  const navigate = useNavigate();
  const { createTask, updateTask, loadTasks } = useTasks();

  const isEditMode = Boolean(_id);

  const [formData, setFormData] = useState({
    title: '',
    description: '',
    priority: 'medium',
    status: 'todo'
  });

  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);
  const [notification, setNotification] = useState(null);

  // 如果是编辑模式，加载任务数据
  useEffect(() => {
    if (isEditMode) {
      loadTaskData();
    }
  }, [_id]);

  const loadTaskData = async () => {
    try {
      const response = await fetch(`/api/tasks/${_id}`);
      const data = await response.json();
      setFormData({
        title: data.data.post.title,
        description: data.data.post.description || '',
        priority: data.data.post.priority || 'medium',
        status: data.data.post.status
      });
    } catch (error) {
      setError('Failed to load task data');
    }
  };

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData(prev => ({
      ...prev,
      [name]: value
    }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    // 验证
    if (!formData.title.trim()) {
      setError('任务标题不能为空');
      return;
    }

    setLoading(true);
    setError(null);

    try {
      if (isEditMode) {
        await updateTask(_id, formData);
        setNotification({ type: 'success', message: '任务更新成功！' });
      } else {
        await createTask(formData);
        setNotification({ type: 'success', message: '任务创建成功！' });
      }

      // 延迟跳转，让用户看到通知
      setTimeout(() => {
        navigate('/tasks');
      }, 1000);
    } catch (error) {
      setError(error.response?.data?.message || '操作失败');
      setLoading(false);
    }
  };

  const handleCancel = () => {
    navigate('/tasks');
  };

  return (
    <div className="max-w-2xl mx-auto">
      <div className="bg-white rounded-lg shadow p-8">
        <h2 className="text-2xl font-bold text-gray-800 mb-6">
          {isEditMode ? '✏️ 编辑任务' : '➕ 创建新任务'}
        </h2>

        {error && (
          <div className="mb-4 bg-red-50 border border-red-200 text-red-700 px-4 py-3 rounded">
            {error}
          </div>
        )}

        <form onSubmit={handleSubmit} className="space-y-6">
          {/* 标题 */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2">
              任务标题 <span className="text-red-500">*</span>
            </label>
            <input
              type="text"
              name="title"
              value={formData.title}
              onChange={handleChange}
              className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
              placeholder="输入任务标题..."
              required
            />
          </div>

          {/* 描述 */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2">
              任务描述
            </label>
            <textarea
              name="description"
              value={formData.description}
              onChange={handleChange}
              rows="5"
              className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
              placeholder="输入任务描述..."
            />
          </div>

          {/* 优先级和状态 */}
          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                优先级
              </label>
              <select
                name="priority"
                value={formData.priority}
                onChange={handleChange}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
              >
                <option value="low">🟢 低</option>
                <option value="medium">🟡 中</option>
                <option value="high">🔴 高</option>
              </select>
            </div>

            {isEditMode && (
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  状态
                </label>
                <select
                  name="status"
                  value={formData.status}
                  onChange={handleChange}
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                >
                  <option value="todo">待办</option>
                  <option value="in-progress">进行中</option>
                  <option value="done">已完成</option>
                </select>
              </div>
            )}
          </div>

          {/* 按钮 */}
          <div className="flex justify-end gap-3">
            <button
              type="button"
              onClick={handleCancel}
              className="px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors"
              disabled={loading}
            >
              取消
            </button>
            <button
              type="submit"
              className="px-4 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600 transition-colors disabled:opacity-50"
              disabled={loading}
            >
              {loading ? '保存中...' : isEditMode ? '更新任务' : '创建任务'}
            </button>
          </div>
        </form>
      </div>

      {notification && (
        <Notification
          type={notification.type}
          message={notification.message}
          onClose={() => setNotification(null)}
        />
      )}
    </div>
  );
}

export default TaskForm;
```

---

### 步骤 3: 代码审查

```bash
[@vibe-reviewer] 审查前端代码的质量和最佳实践
```

**Vibe Reviewer 的输出**:

#### 3.1 代码质量评估

✅ **优点**:
- 组件结构清晰，职责分离
- 使用 Context API 进行状态管理
- 响应式设计（使用 TailwindCSS）
- 良好的错误处理
- 用户友好的加载状态

⚠️ **需要改进**:
- 添加 PropTypes 或 TypeScript 类型
- 添加单元测试
- 优化大量任务时的性能
- 添加虚拟滚动

---

### 步骤 4: 测试生成

```bash
[@vibe-debugger] 为前端组件生成测试用例
```

**Vibe Debugger 的输出**:

#### 4.1 组件测试示例

```jsx
import { render, screen, fireEvent, waitFor } from '@testing-library/react';
import { BrowserRouter } from 'react-router-dom';
import TaskList from './TaskList';
import { TaskProvider } from '../context/TaskContext';
import axios from 'axios';

jest.mock('axios');

const mockTasks = [
  {
    _id: '1',
    title: 'Test Task 1',
    description: 'Description 1',
    status: 'todo',
    priority: 'high',
    createdAt: '2026-01-27T10:00:00.000Z',
    updatedAt: '2026-01-27T10:00:00.000Z'
  },
  {
    _id: '2',
    title: 'Test Task 2',
    description: 'Description 2',
    status: 'done',
    priority: 'low',
    createdAt: '2026-01-27T10:00:00.000Z',
    updatedAt: '2026-01-27T10:00:00.000Z'
  }
];

describe('TaskList', () => {
  beforeEach(() => {
    axios.get.mockResolvedValue({
      data: { data: { tasks: mockTasks } }
    });
  });

  test('renders task list', async () => {
    render(
      <BrowserRouter>
        <TaskProvider>
          <TaskList />
        </TaskProvider>
      </BrowserRouter>
    );

    await waitFor(() => {
      expect(screen.getByText('Test Task 1')).toBeInTheDocument();
      expect(screen.getByText('Test Task 2')).toBeInTheDocument();
    });
  });

  test('filters tasks by status', async () => {
    render(
      <BrowserRouter>
        <TaskProvider>
          <TaskList />
        </TaskProvider>
      </BrowserRouter>
    );

    await waitFor(() => {
      expect(screen.getByText('Test Task 1')).toBeInTheDocument();
    });

    // 测试筛选功能
    // ...
  });

  test('shows loading state', () => {
    axios.get.mockImplementation(() => new Promise(() => {}));

    render(
      <BrowserRouter>
        <TaskProvider>
          <TaskList />
        </TaskProvider>
      </BrowserRouter>
    );

    expect(screen.getByRole('status')).toBeInTheDocument();
  });
});
```

---

## 📊 前端开发流程总结

```
需求分析
   ↓
[vibe-architect] 设计组件层次和状态管理
   ↓
  输出: 组件树、路由设计、状态策略
   ↓
[@vibe-coder] 实现 React 组件
   ↓
  输出: 完整的组件代码
   ↓
[@vibe-reviewer] 审查代码质量
   ↓
  输出: 审查报告和改进建议
   ↓
[@vibe-debugger] 生成测试用例
   ↓
  输出: 组件测试
   ↓
[@vibe-documenter] 生成组件文档
   ↓
  输出: Storybook 或文档
   ↓
  交付: 完整的前端应用
```

---

## 🎯 学习要点

通过这个示例，您学会了：

1. ✅ **前端架构设计**
   - 组件层次结构
   - 状态管理策略
   - 路由设计

2. ✅ **React 最佳实践**
   - 使用 Hooks
   - Context API
   - 性能优化

3. ✅ **与后端集成**
   - API 调用
   - 数据流管理
   - 错误处理

4. ✅ **用户体验**
   - 加载状态
   - 错误提示
   - 响应式设计

---

## 🚀 下一步

- 📖 查看简化示例: [TODO API](../todo-api/README.md)
- 🚀 查看完整示例: [博客系统](../blog-system/README.md)
- 🎬 观看视频演示: [视频脚本](../../resources/video-demos/demo-scripts.md)

---

**项目类型**: 前端简化版示例
**最后更新**: 2026-01-27
