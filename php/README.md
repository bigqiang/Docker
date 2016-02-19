# php

## 镜像描述

本镜像来自于官方 docker 镜像 `php:5.6-fpm`，并有以下增强。

Fixed:

- Fixed docker-php-ext-install script error while checking ext-module.ini

Enabled:

- Enabled GD support with GIF, JPEG, PNG, WBMP, XBM and FreeType(TrueType Fonts)
- Enabled LDAP support
- Enabled mbstring
- Enabled mcrypt
- Enabled mysql
- Enabled mysqli
- Enabled pdo_mysql
- Enabled zip

其他:

- 设置 timezone 为 **Etc/UTC**

TODO:

- Add boot2docker permissions fix

## 镜像用法

### 单一实例模式

用如下命令运行 docker 镜像：

启动实例：

```bash
docker run --name php -v /path/to/web:/var/www/html -d bigqiang/php
```

这会启动一个实例运行

### 链接其他容器

使用该镜像需要链接到 MySQL，必须先运行 MySQL实例，MySQL Docker 镜像更多详情请参考[MySQL镜像](mysql/)。假定你的 MySQL 实例命名为 **mysql5.6_server** ，可以通过如下方式链接它：
```bash
docker run --name php -v /path/to/web:/var/www/html --link mysql5.6_server:mysql -d bigqiang/php
```
这个实例中，可以使用主机名（hostname） `mysql` 链接数据库
