# 设计系统应用示例

> 展示如何在 React + Tailwind CSS 项目中应用设计系统规范

---

## 配置 Tailwind 使用设计 Token

```javascript
// tailwind.config.js
module.exports = {
  theme: {
    extend: {
      // 色彩系统
      colors: {
        primary: {
          50: '#EFF6FF',
          100: '#DBEAFE',
          500: '#3B82F6',  // 主色
          600: '#2563EB',  // Hover
          700: '#1D4ED8',  // Active
        },
        success: {
          50: '#F0FDF4',
          500: '#22C55E',
          600: '#16A34A',
        },
        error: {
          50: '#FEF2F2',
          500: '#EF4444',
          600: '#DC2626',
        },
        gray: {
          50: '#F9FAFB',
          100: '#F3F4F6',
          200: '#E5E7EB',
          500: '#6B7280',
          600: '#4B5563',
          700: '#374151',
          800: '#1F2937',
          900: '#111827',
        },
      },
      // 间距系统 (8px 基础)
      spacing: {
        '1': '4px',
        '2': '8px',
        '3': '12px',
        '4': '16px',
        '6': '24px',
        '8': '32px',
        '12': '48px',
        '16': '64px',
      },
      // 字体系统
      fontSize: {
        'xs': ['12px', { lineHeight: '1.5' }],
        'sm': ['14px', { lineHeight: '1.5' }],
        'base': ['16px', { lineHeight: '1.5' }],
        'lg': ['18px', { lineHeight: '1.5' }],
        'xl': ['20px', { lineHeight: '1.4' }],
        '2xl': ['24px', { lineHeight: '1.3' }],
      },
      // 圆角
      borderRadius: {
        'sm': '4px',
        'md': '6px',
        'lg': '8px',
        'xl': '12px',
      },
      // 阴影
      boxShadow: {
        'sm': '0 1px 2px 0 rgba(0, 0, 0, 0.05)',
        'md': '0 4px 6px -1px rgba(0, 0, 0, 0.1)',
        'lg': '0 10px 15px -3px rgba(0, 0, 0, 0.1)',
      },
    },
  },
}
```

---

## 按钮组件 (Button)

```tsx
// components/Button/Button.tsx
import React from 'react';

interface ButtonProps {
  children: React.ReactNode;
  variant?: 'primary' | 'secondary' | 'danger' | 'ghost';
  size?: 'sm' | 'md' | 'lg';
  disabled?: boolean;
  onClick?: () => void;
  type?: 'button' | 'submit' | 'reset';
}

export const Button: React.FC<ButtonProps> = ({
  children,
  variant = 'primary',
  size = 'md',
  disabled = false,
  onClick,
  type = 'button',
}) => {
  // 尺寸映射
  const sizeClasses = {
    sm: 'h-8 px-3 text-sm',
    md: 'h-10 px-4 text-base',
    lg: 'h-12 px-6 text-base',
  };

  // 变体映射 - 遵循设计系统色彩
  const variantClasses = {
    primary: `
      bg-primary-500 text-white
      hover:bg-primary-600
      active:bg-primary-700
      disabled:bg-gray-300
    `,
    secondary: `
      bg-white text-gray-700 border border-gray-200
      hover:bg-gray-50
      disabled:bg-gray-100 disabled:text-gray-400
    `,
    danger: `
      bg-error-500 text-white
      hover:bg-error-600
      disabled:bg-gray-300
    `,
    ghost: `
      bg-transparent text-primary-500
      hover:bg-primary-50
      disabled:text-gray-400
    `,
  };

  return (
    <button
      type={type}
      onClick={onClick}
      disabled={disabled}
      className={`
        ${sizeClasses[size]}
        ${variantClasses[variant]}
        rounded-md font-medium
        transition-colors duration-200
        focus:outline-none focus:ring-2 focus:ring-primary-500 focus:ring-offset-2
        disabled:cursor-not-allowed
      `}
    >
      {children}
    </button>
  );
};
```

---

## 输入框组件 (Input)

```tsx
// components/Input/Input.tsx
import React from 'react';

interface InputProps extends React.InputHTMLAttributes<HTMLInputElement> {
  label?: string;
  error?: string;
  helperText?: string;
}

export const Input: React.FC<InputProps> = ({
  label,
  error,
  helperText,
  className = '',
  disabled,
  ...props
}) => {
  return (
    <div className="w-full">
      {label && (
        <label className="block text-sm font-medium text-gray-700 mb-1">
          {label}
        </label>
      )}
      <input
        className={`
          w-full h-10 px-4
          border rounded-md
          text-base text-gray-900
          placeholder:text-gray-400
          transition-colors duration-200
          focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-primary-500
          disabled:bg-gray-100 disabled:text-gray-400 disabled:cursor-not-allowed
          ${error 
            ? 'border-error-500 focus:ring-error-500 focus:border-error-500 bg-error-50' 
            : 'border-gray-200 hover:border-gray-300'
          }
          ${className}
        `}
        disabled={disabled}
        {...props}
      />
      {error && (
        <p className="mt-1 text-sm text-error-600">{error}</p>
      )}
      {helperText && !error && (
        <p className="mt-1 text-sm text-gray-500">{helperText}</p>
      )}
    </div>
  );
};
```

---

## 卡片组件 (Card)

```tsx
// components/Card/Card.tsx
import React from 'react';

interface CardProps {
  children: React.ReactNode;
  className?: string;
  hoverable?: boolean;
}

export const Card: React.FC<CardProps> = ({
  children,
  className = '',
  hoverable = false,
}) => {
  return (
    <div
      className={`
        bg-white border border-gray-200 rounded-lg p-6
        shadow-md
        ${hoverable 
          ? 'hover:shadow-lg hover:-translate-y-0.5 transition-all duration-200 cursor-pointer' 
          : ''
        }
        ${className}
      `}
    >
      {children}
    </div>
  );
};
```

---

## 使用示例

```tsx
// pages/Login.tsx
import { Button } from '../components/Button';
import { Input } from '../components/Input';
import { Card } from '../components/Card';

export const LoginPage: React.FC = () => {
  return (
    <div className="min-h-screen bg-gray-50 flex items-center justify-center p-4">
      <Card className="w-full max-w-md">
        {/* 标题 - 使用设计系统字体规范 */}
        <h1 className="text-2xl font-semibold text-gray-800 mb-6">
          登录
        </h1>
        
        {/* 表单 - 使用间距系统 */}
        <form className="space-y-4">
          <Input
            label="邮箱"
            type="email"
            placeholder="请输入邮箱"
            helperText="我们将向您发送验证邮件"
          />
          <Input
            label="密码"
            type="password"
            placeholder="请输入密码"
            error="密码长度至少8位"
          />
          
          {/* 按钮组 - 使用间距系统 */}
          <div className="flex gap-3 pt-2">
            <Button variant="secondary" className="flex-1">
              注册
            </Button>
            <Button variant="primary" className="flex-1">
              登录
            </Button>
          </div>
        </form>
      </Card>
    </div>
  );
};
```

---

## 可访问性实践

```tsx
// 确保组件符合 WCAG 标准
export const AccessibleButton: React.FC<ButtonProps> = (props) => {
  return (
    <button
      {...props}
      className="..."
      // 焦点状态
      onFocus={(e) => e.currentTarget.classList.add('ring-2')}
      onBlur={(e) => e.currentTarget.classList.remove('ring-2')}
      // ARIA 标签
      aria-label={props['aria-label'] || props.children}
      aria-disabled={props.disabled}
    />
  );
};
```

---

## 检查清单

### 色彩使用
- [ ] 使用设计系统中的色彩变量
- [ ] 主色、语义色、中性色使用正确
- [ ] 对比度符合 WCAG AA 标准

### 间距使用
- [ ] 使用 8px 网格系统
- [ ] 内边距、外边距使用设计 token

### 字体使用
- [ ] 标题、正文使用正确的字体大小
- [ ] 行高符合规范
- [ ] 字重使用正确

### 组件设计
- [ ] 按钮尺寸符合规范
- [ ] 输入框状态样式完整
- [ ] 圆角使用正确

---

**参考**: [设计系统规范](../../tech-specs/design-system.md)
