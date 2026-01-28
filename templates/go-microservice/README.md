# Go Microservice 模板

基于 Go + Gin + Redis 的微服务模板。

---

## 技术栈

- **语言**: Go 1.21+
- **框架**: Gin
- **缓存**: Redis
- **消息队列**: NATS / RabbitMQ
- **配置**: Viper
- **日志**: Zap
- **监控**: Prometheus + Grafana
- **部署**: Docker + Kubernetes

---

## 适用场景

- 高并发服务
- 微服务架构
- 实时数据处理
- 网关/API 代理

---

## 项目结构

```
project/
├── cmd/
│   └── api/            # 应用入口
├── internal/
│   ├── handlers/       # HTTP 处理器
│   ├── middleware/     # 中间件
│   ├── models/         # 数据模型
│   ├── repository/     # 数据访问
│   ├── service/        # 业务逻辑
│   └── config/         # 配置
├── pkg/
│   ├── utils/          # 工具包
│   └── logger/         # 日志
├── deployments/        # 部署配置
├── Dockerfile
├── go.mod
└── README.md
```

---

## 快速开始

### 使用 Vibe Coding 生成

```bash
[vibe-architect] 使用 go-microservice 模板创建项目，需要：
  - gRPC 服务
  - 分布式追踪
  - 健康检查端点
```

---

## 特性

- ✅ 高性能 HTTP 服务
- ✅ 分布式缓存
- ✅ 服务发现
- ✅ 链路追踪
- ✅ 优雅关机
- ✅ 配置热更新
- ✅ 容器化部署
