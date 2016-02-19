# nginx

## 镜像描述

本镜像基于官方镜像 `nginx:1.9.11`，做了以下调整

- 切换系统 timezone 为 **Etc/UTC**
- 使用 `/var/www` 替换 `/user/share/nginx/html` 做web根目录
- PHP-FPM ready

## 镜像用法

### 单一实例模式

执行以下命令来获取镜像：

```bash
docker pull bigqiang/nginx
```

启动一个实例：

```bash
docker run --name nginx -v /path/to/web:/var/www -p 80:80 -p 443:443 -d bigqiang/nginx
```

This will start an instance, and you are ready to go.

### 与其他实例链接

比如我想链接到一个 php-fpm server 上，它的名称是 `php5.6`，容器中命名 `php`。详情可参阅 [php](../php/).

```bash
docker run --name nginx -v /path/to/web:/var/www --link php5.6:php -p 80:80 -d bigqiang/apache
```

本实例中，可用主机名 `php` 连接 php-fpm server，不过必须修改 nginx 的配置文件以连接到 php-fpm server `php`.
