LNMP:CentOS-Nginx-MySQL-PHP
========================
This repo contains a recipe for making Docker container for Nginx, PHP, SSH and MySQL on CentOS 6.


查看 Docker 版本

    # docker version

#Nginx
构建：

Copy the sources down -

    # docker build -rm -t <username>/lnmp:centos6 .

运行：

    # docker run -d -p 80:80 <username>/lnmp:centos6

测试：

    # curl http://localhost








## MySQL
Run it:

    # docker run -d -p 3306:3306 <yourname>/mysql:centos6

Get container ID:

    # docker ps

Keep in mind the password set for MySQL is: mysqlPassword

Get the IP address for the container:

    # docker inspect <container_id> | grep -i ipaddr

For MySQL:
    # mysql -h 172.17.0.x -utestdb -pmysqlPassword


Create a table:

```
\> CREATE TABLE test (name VARCHAR(10), owner VARCHAR(10),
    -> species VARCHAR(10), birth DATE, death DATE);
```

# memcached
To build:

Copy the sources down -

    # docker build -rm -t <username>/memcached:centos6 .

To run:

    # docker run -d -p 11211:11211 <username>/memcached:centos6

Test:

```
# telnet localhost 11211
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.
stats
STAT pid 1
STAT uptime 165
STAT time 1387383960
STAT version 1.4.15
STAT libevent 2.0.21-stable
<snip>
```
