# 设计系统规范 (Design System)

> 统一的设计语言和视觉规范，确保产品体验一致性。

---

## 设计原则

### 1. 一致性 (Consistency)
- 统一的视觉语言
- 相同的交互模式
- 可预测的用户体验

### 2. 简洁性 (Simplicity)
- 去除不必要的装饰
- 清晰的视觉层次
- 直观的操作流程

### 3. 可访问性 (Accessibility)
- 符合 WCAG 2.1 AA 标准
- 支持键盘导航
- 适配辅助技术

---

## 色彩系统

### 主色调

```css
:root {
  /* Primary - 品牌蓝 */
  --primary-50: #EFF6FF;
  --primary-100: #DBEAFE;
  --primary-200: #BFDBFE;
  --primary-300: #93C5FD;
  --primary-400: #60A5FA;
  --primary-500: #3B82F6;  /* 主色 */
  --primary-600: #2563EB;  /* Hover */
  --primary-700: #1D4ED8;  /* Active */
  --primary-800: #1E40AF;
  --primary-900: #1E3A8A;
}
```

### 语义色

```css
:root {
  /* Success - 成功 */
  --success-50: #F0FDF4;
  --success-500: #22C55E;
  --success-600: #16A34A;
  
  /* Warning - 警告 */
  --warning-50: #FFFBEB;
  --warning-500: #F59E0B;
  --warning-600: #D97706;
  
  /* Error - 错误 */
  --error-50: #FEF2F2;
  --error-500: #EF4444;
  --error-600: #DC2626;
  
  /* Info - 信息 */
  --info-50: #EFF6FF;
  --info-500: #3B82F6;
  --info-600: #2563EB;
}
```

### 中性色

```css
:root {
  /* Gray Scale */
  --gray-50: #F9FAFB;   /* 背景 */
  --gray-100: #F3F4F6;  /* 悬停背景 */
  --gray-200: #E5E7EB;  /* 边框 */
  --gray-300: #D1D5DB;  /* 禁用 */
  --gray-400: #9CA3AF;  /* 占位符 */
  --gray-500: #6B7280;  /* 次要文字 */
  --gray-600: #4B5563;  /* 正文 */
  --gray-700: #374151;  /* 标题 */
  --gray-800: #1F2937;  /* 深色标题 */
  --gray-900: #111827;  /* 最深色 */
}
```

### 色彩使用规范

| 场景 | 颜色 | 示例 |
|------|------|------|
| 主按钮 | primary-500 | 背景 |
| 主按钮悬停 | primary-600 | 背景 |
| 成功状态 | success-500 | 图标、文字 |
| 错误状态 | error-500 | 图标、文字、边框 |
| 正文 | gray-600 | 文字颜色 |
| 标题 | gray-800 | 文字颜色 |
| 边框 | gray-200 | 边框颜色 |
| 背景 | gray-50 | 页面背景 |

---

## 间距系统

### 基础单位

基于 8px 网格系统：

```css
:root {
  --space-0: 0;
  --space-1: 4px;    /* 0.5x */
  --space-2: 8px;    /* 1x (base) */
  --space-3: 12px;   /* 1.5x */
  --space-4: 16px;   /* 2x */
  --space-5: 20px;   /* 2.5x */
  --space-6: 24px;   /* 3x */
  --space-8: 32px;   /* 4x */
  --space-10: 40px;  /* 5x */
  --space-12: 48px;  /* 6x */
  --space-16: 64px;  /* 8x */
  --space-20: 80px;  /* 10x */
  --space-24: 96px;  /* 12x */
}
```

### 间距使用

| Token | 值 | 使用场景 |
|-------|-----|---------|
| space-1 | 4px | 图标内边距、紧凑间距 |
| space-2 | 8px | 小按钮内边距、行间距 |
| space-3 | 12px | 标准按钮内边距 |
| space-4 | 16px | 卡片内边距、表单间距 |
| space-6 | 24px | 段落间距、组件间距 |
| space-8 | 32px | 区块间距 |
| space-12 | 48px | 大区块间距 |

---

## 字体系统

### 字体族

```css
:root {
  /* 中文 */
  --font-sans-zh: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "PingFang SC", "Microsoft YaHei", sans-serif;
  
  /* 英文 */
  --font-sans: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
  
  /* 等宽字体 */
  --font-mono: "SF Mono", Monaco, "Cascadia Code", "Roboto Mono", Consolas, monospace;
}
```

### 字体大小

```css
:root {
  --text-xs: 12px;    /* 标签、辅助文字 */
  --text-sm: 14px;    /* 正文小 */
  --text-base: 16px;  /* 正文标准 */
  --text-lg: 18px;    /* 大正文 */
  --text-xl: 20px;    /* 小标题 */
  --text-2xl: 24px;   /* 标题 */
  --text-3xl: 30px;   /* 大标题 */
  --text-4xl: 36px;   /* 页面标题 */
}
```

### 行高

```css
:root {
  --leading-none: 1;       /* 按钮、标签 */
  --leading-tight: 1.25;   /* 标题 */
  --leading-snug: 1.375;   /* 紧凑正文 */
  --leading-normal: 1.5;   /* 标准正文 */
  --leading-relaxed: 1.625; /* 宽松正文 */
}
```

### 字重

```css
:root {
  --font-normal: 400;   /* 正文 */
  --font-medium: 500;   /* 强调 */
  --font-semibold: 600; /* 小标题 */
  --font-bold: 700;     /* 标题 */
}
```

### 字体使用规范

| 元素 | 大小 | 字重 | 行高 |
|------|------|------|------|
| 页面标题 | text-4xl | bold | tight |
| 区块标题 | text-2xl | semibold | tight |
| 卡片标题 | text-xl | semibold | tight |
| 正文 | text-base | normal | normal |
| 辅助文字 | text-sm | normal | normal |
| 标签 | text-xs | medium | none |
| 按钮 | text-base | medium | none |

---

## 圆角系统

```css
:root {
  --radius-none: 0;
  --radius-sm: 4px;   /* 小元素、标签 */
  --radius-md: 6px;   /* 按钮、输入框 */
  --radius-lg: 8px;   /* 卡片、弹窗 */
  --radius-xl: 12px;  /* 大卡片 */
  --radius-2xl: 16px; /* 特殊卡片 */
  --radius-full: 9999px; /* 圆形、胶囊 */
}
```

---

## 阴影系统

```css
:root {
  /* 小阴影 - 悬停效果 */
  --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
  
  /* 标准阴影 - 卡片 */
  --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
  
  /* 大阴影 - 弹窗、下拉 */
  --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
  
  /* 特殊阴影 - 模态框 */
  --shadow-xl: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
}
```

---

## 组件规范

### 按钮 (Button)

#### 尺寸

| 尺寸 | 高度 | 水平内边距 | 字体大小 |
|------|------|-----------|---------|
| sm | 32px | 12px | text-sm |
| md | 40px | 16px | text-base |
| lg | 48px | 24px | text-base |

#### 变体

```
Primary (主按钮)
├── 背景: primary-500
├── 文字: white
├── 悬停: primary-600
└── 禁用: gray-300

Secondary (次按钮)
├── 背景: white
├── 边框: gray-200
├── 文字: gray-700
└── 悬停: gray-50

Danger (危险按钮)
├── 背景: error-500
├── 文字: white
└── 悬停: error-600

Ghost (幽灵按钮)
├── 背景: transparent
├── 文字: primary-500
└── 悬停: primary-50
```

### 输入框 (Input)

#### 尺寸

| 尺寸 | 高度 | 水平内边距 |
|------|------|-----------|
| sm | 32px | 12px |
| md | 40px | 16px |
| lg | 48px | 16px |

#### 状态

```
Default
├── 边框: gray-200
├── 背景: white
└── 文字: gray-900

Hover
└── 边框: gray-300

Focus
├── 边框: primary-500
└── 阴影: 0 0 0 3px primary-100

Error
├── 边框: error-500
└── 背景: error-50

Disabled
├── 边框: gray-200
├── 背景: gray-100
└── 文字: gray-400
```

### 卡片 (Card)

```
标准卡片
├── 背景: white
├── 边框: 1px solid gray-200
├── 圆角: radius-lg (8px)
├── 内边距: space-6 (24px)
└── 阴影: shadow-md

可悬停卡片
└── 悬停: shadow-lg + translateY(-2px)
```

---

## 响应式断点

```css
:root {
  --breakpoint-sm: 640px;   /* 手机横屏 */
  --breakpoint-md: 768px;   /* 平板竖屏 */
  --breakpoint-lg: 1024px;  /* 平板横屏 / 小笔记本 */
  --breakpoint-xl: 1280px;  /* 桌面 */
  --breakpoint-2xl: 1536px; /* 大桌面 */
}
```

---

## 可访问性要求

### 颜色对比度
- 正文文字: 对比度 ≥ 4.5:1
- 大文字 (18px+): 对比度 ≥ 3:1
- 交互元素: 对比度 ≥ 3:1

### 焦点状态
- 所有交互元素必须有可见的焦点状态
- 焦点环: 2px solid primary-500
- 偏移: 2px

### 触摸目标
- 最小触摸目标: 44x44px
- 推荐触摸目标: 48x48px

---

## 设计 Token 使用示例

### CSS / SCSS

```css
.button {
  padding: var(--space-3) var(--space-4);
  background: var(--primary-500);
  color: white;
  border-radius: var(--radius-md);
  font-size: var(--text-base);
  font-weight: var(--font-medium);
}

.button:hover {
  background: var(--primary-600);
}
```

### Tailwind CSS

```html
<!-- 使用 Tailwind 预设值 -->
<button class="px-4 py-3 bg-primary-500 text-white rounded-md 
               hover:bg-primary-600 font-medium">
  按钮
</button>
```

---

**最后更新**: 2026-01-30
