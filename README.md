# Docker开发环境
 * MySQL
 * Nginx
 * PHP

## 运行镜像时需要将镜像的工作路径与本地文件路径绑定，形如：
  ```
  docker run -it -v /home/fengzheng/ftp/:/data  859666d51c6d /bin/bash
  ```
  表示：本地`/data`路径挂载到镜像中`home/fengzheng/ftp/`路径上

