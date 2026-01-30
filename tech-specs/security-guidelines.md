# 安全规范 (Security Guidelines)

> 安全编码最佳实践，防范常见安全漏洞和数据泄露。

---

## 安全原则

### 1. 最小权限原则
- 只授予必要的权限
- 定期审查权限
- 及时撤销无用权限

### 2. 防御纵深
- 多层安全防护
- 不依赖单一防线
- 假设系统会被攻击

### 3. 默认安全
- 安全的默认配置
- 显式开启功能
- 失败安全模式

---

## 认证安全

### 密码存储

```typescript
// ✅ 正确 - 使用 bcrypt
import bcrypt from 'bcrypt';

const SALT_ROUNDS = 12;

async function hashPassword(password: string): Promise<string> {
  return bcrypt.hash(password, SALT_ROUNDS);
}

async function verifyPassword(
  password: string,
  hash: string
): Promise<boolean> {
  return bcrypt.compare(password, hash);
}
```

**要求:**
- 使用 bcrypt, Argon2 或 PBKDF2
- 盐值长度 ≥ 16 bytes
- 迭代次数 ≥ 10 (bcrypt)

### JWT 安全

```typescript
// ✅ 正确
import jwt from 'jsonwebtoken';

const JWT_SECRET = process.env.JWT_SECRET; // 强密钥，≥ 256 bits
const JWT_EXPIRES_IN = '15m'; // 短期访问令牌
const REFRESH_TOKEN_EXPIRES_IN = '7d'; // 长期刷新令牌

// 签名
const token = jwt.sign(
  { userId: user.id, role: user.role },
  JWT_SECRET,
  { 
    expiresIn: JWT_EXPIRES_IN,
    issuer: 'your-app',
    audience: 'your-api'
  }
);

// 验证
try {
  const payload = jwt.verify(token, JWT_SECRET, {
    issuer: 'your-app',
    audience: 'your-api'
  });
} catch (error) {
  // 处理无效令牌
}
```

**要求:**
- 使用强密钥 (≥ 256 bits)
- 短期过期时间 (15-60 分钟)
- 使用 HTTPS 传输
- 刷新令牌机制

### 会话管理

```typescript
// ✅ 正确
interface Session {
  id: string;
  userId: string;
  createdAt: Date;
  expiresAt: Date;
  ipAddress: string;
  userAgent: string;
}

// 会话安全策略
const SESSION_CONFIG = {
  maxAge: 24 * 60 * 60 * 1000, // 24 小时
  httpOnly: true,              // 禁止 JS 访问
  secure: true,                // 仅 HTTPS
  sameSite: 'strict' as const, // CSRF 防护
};
```

---

## 输入验证

### 验证原则

- 永远不要信任用户输入
- 白名单验证 (允许什么)
- 服务端再次验证

### SQL 注入防护

```typescript
// ❌ 错误 - SQL 注入风险
const query = `SELECT * FROM users WHERE email = '${email}'`;

// ✅ 正确 - 参数化查询
const query = 'SELECT * FROM users WHERE email = $1';
const result = await db.query(query, [email]);

// ✅ 正确 - 使用 ORM
const user = await db.users.findOne({ where: { email } });
```

### XSS 防护

```typescript
// 输入净化
import DOMPurify from 'isomorphic-dompurify';

const clean = DOMPurify.sanitize(dirtyHtml);

// 输出编码
function escapeHtml(text: string): string {
  const div = document.createElement('div');
  div.textContent = text;
  return div.innerHTML;
}

// Content Security Policy
const CSP = [
  "default-src 'self'",
  "script-src 'self' 'nonce-{random}'",
  "style-src 'self' 'unsafe-inline'",
  "img-src 'self' data: https:",
].join('; ');
```

### 命令注入防护

```typescript
// ❌ 错误
const result = exec(`ls ${userInput}`);

// ✅ 正确
import { execFile } from 'child_process';
execFile('ls', [userInput], (error, stdout) => {
  // 处理结果
});
```

---

## 敏感数据处理

### 数据分类

| 级别 | 示例 | 处理要求 |
|------|------|---------|
| 公开 | 用户名、头像 | 无需特殊处理 |
| 内部 | 邮箱、电话 | 日志脱敏 |
| 机密 | 身份证号 | 加密存储 |
| 绝密 | 密码、密钥 | 哈希/加密，严格访问控制 |

### 数据脱敏

```typescript
// 日志脱敏
function maskEmail(email: string): string {
  const [local, domain] = email.split('@');
  const maskedLocal = local.charAt(0) + '***';
  return `${maskedLocal}@${domain}`;
}

// 输出: a***@example.com
```

### 加密存储

```typescript
import crypto from 'crypto';

const ALGORITHM = 'aes-256-gcm';

function encrypt(text: string, key: Buffer): { encrypted: string; authTag: string } {
  const iv = crypto.randomBytes(16);
  const cipher = crypto.createCipheriv(ALGORITHM, key, iv);
  
  let encrypted = cipher.update(text, 'utf8', 'hex');
  encrypted += cipher.final('hex');
  
  return {
    encrypted: iv.toString('hex') + encrypted,
    authTag: cipher.getAuthTag().toString('hex')
  };
}
```

---

## 访问控制

### RBAC (基于角色的访问控制)

```typescript
// 角色定义
enum Role {
  ADMIN = 'admin',
  MANAGER = 'manager',
  USER = 'user'
}

// 权限矩阵
const PERMISSIONS = {
  [Role.ADMIN]: ['create', 'read', 'update', 'delete'],
  [Role.MANAGER]: ['create', 'read', 'update'],
  [Role.USER]: ['read', 'update_own']
};

// 权限检查
function checkPermission(
  userRole: Role,
  requiredPermission: string,
  resourceOwner?: string,
  currentUserId?: string
): boolean {
  const permissions = PERMISSIONS[userRole] || [];
  
  // 检查具体权限
  if (permissions.includes(requiredPermission)) {
    return true;
  }
  
  // 检查 own 权限
  if (permissions.includes(`${requiredPermission}_own`)) {
    return resourceOwner === currentUserId;
  }
  
  return false;
}
```

### 接口权限

```typescript
// 装饰器方式
@RequireAuth()
@RequireRole('admin')
async function deleteUser(userId: string) {
  // 只有 admin 可以执行
}

// 中间件方式
app.delete('/api/users/:id',
  authenticate,           // 认证
  requireRole('admin'),   // 授权
  deleteUserHandler
);
```

---

## HTTP 安全

### 安全头部

```typescript
// Helmet 配置
app.use(helmet({
  contentSecurityPolicy: {
    directives: {
      defaultSrc: ["'self'"],
      styleSrc: ["'self'", "'unsafe-inline'"],
      scriptSrc: ["'self'"],
      imgSrc: ["'self'", "data:", "https:"],
    },
  },
  hsts: {
    maxAge: 31536000,
    includeSubDomains: true,
    preload: true
  },
  referrerPolicy: { policy: 'same-origin' }
}));
```

### CORS 配置

```typescript
// 严格 CORS
app.use(cors({
  origin: process.env.ALLOWED_ORIGINS?.split(',') || ['https://yourdomain.com'],
  methods: ['GET', 'POST', 'PUT', 'PATCH', 'DELETE'],
  allowedHeaders: ['Content-Type', 'Authorization'],
  credentials: true,
  maxAge: 86400
}));
```

---

## 安全头部

| 头部 | 作用 | 推荐值 |
|------|------|--------|
| Content-Security-Policy | XSS 防护 | default-src 'self' |
| X-Content-Type-Options | MIME 嗅探防护 | nosniff |
| X-Frame-Options | 点击劫持防护 | DENY |
| X-XSS-Protection | XSS 过滤 | 1; mode=block |
| Strict-Transport-Security | HTTPS 强制 | max-age=31536000 |
| Referrer-Policy | Referrer 控制 | same-origin |

---

## 安全审查清单

### 代码审查

- [ ] 无硬编码密钥
- [ ] 无 console.log 敏感信息
- [ ] 输入已验证
- [ ] 输出已编码
- [ ] 权限已检查
- [ ] 错误信息不泄露敏感信息

### 部署检查

- [ ] HTTPS 强制
- [ ] 安全头部已配置
- [ ] 数据库连接加密
- [ ] 日志不包含敏感数据
- [ ] 环境变量安全存储

---

**最后更新**: 2026-01-30
