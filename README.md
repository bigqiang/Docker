# Docker开发环境
 * MySQL
 * Nginx
 * PHP

## 运行镜像时需要将镜像的工作路径与本地文件路径绑定，形如：
  ```
  docker run -it -v /home/fengzheng/ftp/:/data  859666d51c6d /bin/bash
  ```
  表示：本地`/data`路径挂载到镜像中`home/fengzheng/ftp/`路径上

## 常见问题
  1. 在Windows环境下开发，发现如错误：
  ```
  An error occurred trying to connect: Get http://127.0.0.1:2375/v1.22/images/json: dial tcp 127.0.0.1:2375: connectex: No connection could be made because the target machine actively refused it.
  ```
  无法进行正常的docker客户端连接操作。
  官方github的 [Issue 66](https://github.com/docker/toolbox/issues/66) 讨论这个问题，并没有实际的解决方案，不过在回复中提供了两种可行的暂时性解决办法：

     1. 先删除安装容器的 `default` 虚机；然后以管理员身份运行 `CMD`，在其中重行运行 `..\Docker Toolbox`路径下的 `start.sh`。

     2. 另一办法：
       - 打开 VirtualBox
       - 进入 File -> Preferences -> Network -> Host-only Networks
        Docker Toolbox 可能创建第二个Host-only network，名称形式是 `VirtualBox Host-Only Ethernet Adapter # 2`，双击它，更改 "IPv4 Address"，比如原来是 192.168.99.1 改成  192.168.99.2 。IP值改变就行，然后点 OK。IP变化后，问题可解决。


