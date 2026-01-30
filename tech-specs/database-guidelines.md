# 数据库规范 (Database Guidelines)

> 数据库设计、查询和管理的最佳实践，确保数据一致性、性能和可维护性。

---

## 设计原则

### 1. 数据完整性
- 使用约束保证数据有效性
- 外键维护关系完整性
- 适当的默认值

### 2. 性能优化
- 合理的索引设计
- 避免 N+1 查询
- 适当的数据类型

### 3. 可维护性
- 清晰的命名规范
- 适当的规范化
- 版本控制迁移脚本

---

## 命名规范

### 表名

| 规范 | 示例 |
|------|------|
| 小写 | `users` ✅ `Users` ❌ |
| 复数形式 | `users` ✅ `user` ❌ |
| 下划线分隔 | `user_profiles` ✅ `userProfiles` ❌ |
| 避免保留字 | `order_items` ✅ `order` ❌ |

### 列名

| 规范 | 示例 |
|------|------|
| 小写 | `created_at` ✅ `createdAt` ❌ |
| 下划线分隔 | `user_id` ✅ `userId` ❌ |
| 动词前缀 | `is_active`, `has_permission` |
| 时间戳 | `created_at`, `updated_at`, `deleted_at` |

### 索引名

```
idx_{table}_{columns}
uk_{table}_{column}      # 唯一索引
pk_{table}               # 主键
fk_{table}_{ref_table}   # 外键
```

**示例:**
```sql
CREATE INDEX idx_users_email ON users(email);
CREATE UNIQUE INDEX uk_users_phone ON users(phone);
```

---

## 表设计

### 必备字段

```sql
CREATE TABLE example (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    -- 业务字段
    
    -- 时间戳 (必备)
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    
    -- 软删除 (可选但推荐)
    deleted_at TIMESTAMP WITH TIME ZONE
);
```

### 主键选择

| 类型 | 适用场景 | 优点 | 缺点 |
|------|---------|------|------|
| UUID | 分布式系统 | 全局唯一，安全 | 占用空间大 |
| SERIAL | 单机系统 | 简单，有序 | 易猜测，难分片 |
| BIGSERIAL | 大数据量 | 容量大 | 同 SERIAL |

**推荐:** 使用 UUID (v4 或 v7)

### 外键设计

```sql
CREATE TABLE orders (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    
    -- 外键约束
    CONSTRAINT fk_orders_user_id
        FOREIGN KEY (user_id) 
        REFERENCES users(id)
        ON DELETE RESTRICT    -- 或 CASCADE
        ON UPDATE CASCADE
);
```

**ON DELETE 策略:**
- `RESTRICT`: 阻止删除 (推荐默认)
- `CASCADE`: 级联删除
- `SET NULL`: 设为 NULL (nullable 字段)

---

## 数据类型

### 推荐类型

| 场景 | 推荐类型 | 说明 |
|------|---------|------|
| 主键 | UUID | 全局唯一 |
| 小整数 | SMALLINT | -32768 到 32767 |
| 整数 | INTEGER | 标准整数 |
| 大整数 | BIGINT | 大数值 |
| 精确小数 | DECIMAL | 货币计算 |
| 浮点数 | REAL/DOUBLE | 科学计算 |
| 短文本 | VARCHAR(n) | 有长度限制 |
| 长文本 | TEXT | 无长度限制 |
| 日期 | DATE | 无时区 |
| 时间戳 | TIMESTAMPTZ | 带时区 |
| 布尔 | BOOLEAN | true/false |
| JSON | JSONB | 二进制 JSON |
| 枚举 | 小整型或约束 | 避免 ENUM 类型 |

### 避免的类型

| 类型 | 原因 | 替代方案 |
|------|------|---------|
| CHAR | 固定长度，浪费空间 | VARCHAR |
| FLOAT | 精度问题 | DECIMAL |
| ENUM | 修改困难 | CHECK 约束或引用表 |
| TIMESTAMP | 无时区 | TIMESTAMPTZ |

---

## 索引设计

### 索引原则

- 为 WHERE 子句中的列创建索引
- 为 JOIN 条件中的列创建索引
- 为 ORDER BY 列创建索引
- 避免过多索引 (影响写入性能)

### 索引类型

```sql
-- B-Tree 索引 (默认)
CREATE INDEX idx_users_email ON users(email);

-- 复合索引
CREATE INDEX idx_orders_user_status ON orders(user_id, status);

-- 唯一索引
CREATE UNIQUE INDEX uk_users_phone ON users(phone);

-- 部分索引
CREATE INDEX idx_active_users ON users(email) WHERE deleted_at IS NULL;

-- 表达式索引
CREATE INDEX idx_users_lower_email ON users(LOWER(email));
```

### 复合索引顺序

```sql
-- ✅ 正确 - 高基数列在前
CREATE INDEX idx_orders_user_created ON orders(user_id, created_at);

-- ❌ 错误 - 低基数列在前
CREATE INDEX idx_orders_status_user ON orders(status, user_id);
```

---

## 查询优化

### 避免 N+1 查询

```typescript
// ❌ 错误 - N+1 查询
const users = await db.users.findAll();
for (const user of users) {
  user.orders = await db.orders.find({ userId: user.id });
}

// ✅ 正确 - 批量查询
const users = await db.users.findAll();
const userIds = users.map(u => u.id);
const orders = await db.orders.find({ 
  userId: { $in: userIds } 
});
// 在内存中关联
```

### 使用 LIMIT 和 OFFSET

```sql
-- ✅ 正确 - 分页查询
SELECT * FROM users 
WHERE status = 'active' 
ORDER BY created_at DESC 
LIMIT 20 OFFSET 0;

-- ❌ 错误 - 大偏移量性能差
SELECT * FROM users 
ORDER BY created_at DESC 
LIMIT 20 OFFSET 100000;

-- ✅ 优化 - 使用游标
SELECT * FROM users 
WHERE created_at < '2026-01-01'
ORDER BY created_at DESC 
LIMIT 20;
```

### SELECT 指定列

```sql
-- ✅ 正确
SELECT id, name, email FROM users;

-- ❌ 错误 -  unnecessary 数据传输
SELECT * FROM users;
```

---

## 事务管理

### 事务原则

- 保持事务简短
- 在事务中做最少的工作
- 合适的隔离级别

### 事务示例

```typescript
// ✅ 正确
await db.transaction(async (trx) => {
  const order = await trx.orders.create({ ... });
  await trx.orderItems.createMany(items.map(item => ({
    orderId: order.id,
    ...item
  })));
  await trx.inventory.decrease(items);
});
```

### 隔离级别

| 级别 | 问题 | 适用场景 |
|------|------|---------|
| READ COMMITTED | 不可重复读 | 默认推荐 |
| REPEATABLE READ | 幻读 | 严格一致性 |
| SERIALIZABLE | 无 | 极高一致性 |

---

## 迁移管理

### 迁移文件命名

```
YYYYMMDDHHMMSS_description.sql
```

**示例:**
```
20260130103000_create_users_table.sql
20260130104500_add_user_profile.sql
```

### 迁移文件结构

```sql
-- Up (升级)
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_users_email ON users(email);

-- Down (回滚)
DROP TABLE IF EXISTS users;
```

### 迁移原则

- 每个迁移只做一件事
- 迁移必须是幂等的
- 破坏性变更需要多步迁移
- 测试迁移脚本

---

## 软删除

### 实现方式

```sql
-- 添加删除时间戳
ALTER TABLE users ADD COLUMN deleted_at TIMESTAMPTZ;

-- 查询时过滤
SELECT * FROM users WHERE deleted_at IS NULL;

-- 软删除
UPDATE users SET deleted_at = NOW() WHERE id = 'xxx';
```

### 唯一索引处理

```sql
-- ✅ 正确 - 包含删除标记
CREATE UNIQUE INDEX uk_users_email 
ON users(email) 
WHERE deleted_at IS NULL;

-- ❌ 错误 - 无法重复创建
CREATE UNIQUE INDEX uk_users_email ON users(email);
```

---

## 性能监控

### 慢查询日志

```sql
-- PostgreSQL
ALTER SYSTEM SET log_min_duration_statement = '1000ms';
```

### 查询分析

```sql
-- 查看执行计划
EXPLAIN ANALYZE SELECT * FROM users WHERE email = 'test@example.com';

-- 查看索引使用
SELECT 
    schemaname,
    tablename,
    indexname,
    idx_scan,
    idx_tup_read
FROM pg_stat_user_indexes
ORDER BY idx_scan DESC;
```

---

**最后更新**: 2026-01-30
