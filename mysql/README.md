# mysql 5.6

## 如何使用本镜像

### 启动 mysql 实例

```bash
docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=mysecretpassword -d mysql
```

本镜像含指令 `EXPOSE 3306` (mysql端口)，所以可用标准容器链接（下面示例会进行说明）。

### 一个应用去链接它

```bash
docker run --name some-app --link some-mysql:mysql -d application-that-uses-mysql
```

### … 或通过 `mysql`

```bash
docker run -it --link some-mysql:mysql --rm mysql sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'
```

### 环境变量

MySQL 镜像使用了几个环境变量，很容易忘记。这些变量并不都是必须的，但在镜像使用中可能会有非常大的帮助。

* `MYSQL_ROOT_PASSWORD`

这是使用MySQL镜像的必用的环境变量。可用于设置你想要的 MySQL 的 root 密码。在上例中被设成了“mysecretpassword”。

* `MYSQL_USER`, `MYSQL_PASSWORD`

可选，用于设置 MySQL 的一个用户名和密码链接。如果指定了可选变量`MYSQL_DATABASE`，那将会对该用户授予这个指定库的所有许可。注意，如果只提供了这两个环境变量，那么这两个变更不会起任何作用。这两变量使用时，会在MySQL数据库中创建一个指定密码的新用户。把`MYSQL_USER`指定为`root`毫无必要，因为默认的MySQL中已经存在`root`用户，其密码由`MYSQL_ROOT_PASSWORD`控制。

* `MYSQL_DATABASE`

可选环境变量，表示要创建数据库的名称。如果用户名和密码已经由`MYSQL_USER`、`MYSQL_PASSWORD`指定，那么该用户账号会被授权访问(`GRANT ALL`)该数据库。

* `MYSQL_ALLOW_EMPTY_PASSWORD`

可选环境变量，指明是否允许`root`账户有空密码。如果设置该变量，那么`root`用户会是空密码。

## 注意事项

如果容器中`mysql`启动时却没有数据库，那么`mysql`会为你创建一个默认(default)数据库。在此情况发生时，意味着此时不会接受任何入口的访问连接。在使用如`fig`这样的自动化工具同时启动多个容器时，可能会产生问题。
