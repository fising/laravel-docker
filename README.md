# 🐳 Laravel Docker 开发环境

一个现代化的 Laravel 开发环境，使用 Docker 容器化技术，让您能够快速搭建和运行 Laravel 应用程序。

## ✨ 功能特性

- 🚀 **快速启动**: 一键启动完整的 Laravel 开发环境
- 🔧 **现代化技术栈**: PHP 8.1 + MySQL 8.0 + Redis + Nginx
- 📦 **容器化部署**: 基于 Docker 和 Docker Compose
- 🛠️ **开发友好**: 支持热重载、调试和开发工具
- 🔒 **安全可靠**: 使用 Alpine Linux 基础镜像，轻量且安全
- 📊 **性能优化**: 配置了 Nginx 和 PHP-FPM 的性能优化

## 🏗️ 技术栈

| 组件 | 版本 | 说明 |
|------|------|------|
| PHP | 8.1.32 | 使用 PHP-FPM Alpine 镜像 |
| MySQL | 8.0 | 数据库服务 |
| Redis | Latest | 缓存和会话存储 |
| Nginx | Alpine | Web 服务器 |
| Composer | Latest | PHP 依赖管理 |

## 📋 系统要求

- Docker Engine 20.10+
- Docker Compose 2.0+
- Git

## 🚀 快速开始

### 1. 克隆项目

```bash
git clone <your-repository-url>
cd laravel-docker
```

### 2. 配置环境变量

创建 `.env` 文件并配置以下变量：

```env
# 容器前缀
CONTAINER_PREFIX=laravel

# 端口配置
NGINX_PORT=8000
PHP_PORT=9000
DB_PORT=3306
REDIS_PORT=6379

# 数据库配置
DB_DATABASE=laravel
DB_USERNAME=laravel
DB_PASSWORD=password
DB_ROOT_PASSWORD=root_password
```

### 3. 启动服务

```bash
# 构建并启动所有服务
docker-compose up -d

# 查看服务状态
docker-compose ps
```

### 4. 安装 Laravel 依赖

```bash
# 进入 PHP 容器
docker-compose exec php sh

# 安装 Composer 依赖
composer install

# 生成应用密钥
php artisan key:generate

# 运行数据库迁移
php artisan migrate
```

### 5. 访问应用

打开浏览器访问: http://localhost:8000

## 📁 项目结构

```
laravel-docker/
├── docker-compose.yml      # Docker Compose 配置
├── Dockerfile              # PHP 容器构建文件
├── nginx/
│   └── default.conf        # Nginx 配置文件
├── mysql/                  # MySQL 数据持久化目录
└── README.md              # 项目说明文档
```

## 🔧 服务说明

### Nginx 服务
- **端口**: 8000 (可配置)
- **功能**: Web 服务器，处理 HTTP 请求
- **配置**: 支持 Laravel 路由和静态文件服务

### PHP-FPM 服务
- **端口**: 9000 (可配置)
- **功能**: PHP 应用服务器
- **扩展**: 包含常用 PHP 扩展 (PDO, MySQL, Redis, GD 等)

### MySQL 服务
- **端口**: 3306 (可配置)
- **功能**: 数据库服务
- **数据持久化**: 数据存储在 `./mysql` 目录

### Redis 服务
- **端口**: 6379 (可配置)
- **功能**: 缓存和会话存储

## 🛠️ 常用命令

```bash
# 启动所有服务
docker-compose up -d

# 停止所有服务
docker-compose down

# 重启服务
docker-compose restart

# 查看服务日志
docker-compose logs -f

# 进入 PHP 容器
docker-compose exec php sh

# 进入 MySQL 容器
docker-compose exec mysql mysql -u root -p

# 进入 Redis 容器
docker-compose exec redis redis-cli

# 重新构建镜像
docker-compose build --no-cache
```

## 🔍 故障排除

### 端口冲突
如果遇到端口冲突，请修改 `.env` 文件中的端口配置。

### 权限问题
确保 `mysql` 目录有正确的权限：
```bash
sudo chown -R 1000:1000 mysql/
```

### 容器无法启动
检查 Docker 服务状态和磁盘空间：
```bash
docker system df
docker system prune
```

## 📝 开发建议

1. **代码同步**: 项目代码通过 volume 挂载，修改后立即生效
2. **数据库备份**: 定期备份 `mysql` 目录
3. **日志查看**: 使用 `docker-compose logs` 查看服务日志
4. **性能监控**: 使用 Docker 内置监控工具

## 🤝 贡献指南

欢迎提交 Issue 和 Pull Request 来改进这个项目！

## 📄 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情。

## 🙏 致谢

感谢 Laravel 团队和 Docker 社区提供的优秀工具和文档。

---

⭐ 如果这个项目对您有帮助，请给它一个星标！ 