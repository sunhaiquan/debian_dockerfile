
下一代 Debian 正式发行版的代号为 "buster" — 发布时间尚未确定
Debian 9（"stretch"） — 当前的稳定版
Debian 8（"jessie"） — 被淘汰的稳定版
Debian 7（"wheezy"） — 被淘汰的稳定版
Debian 6.0（"squeeze"） — 被淘汰的稳定版
Debian GNU/Linux 5.0（"lenny"） — 被淘汰的稳定版
Debian GNU/Linux 4.0（"etch"） — 被淘汰的稳定版
Debian GNU/Linux 3.1（"sarge"） — 被淘汰的稳定版
Debian GNU/Linux 3.0（"woody"） — 被淘汰的稳定版
Debian GNU/Linux 2.2（"potato"） — 被淘汰的稳定版
Debian GNU/Linux 2.1（"slink"） — 被淘汰的稳定版
Debian GNU/Linux 2.0（"hamm"） — 被淘汰的稳定版

# 所需文件
```
ls ./
Dockerfile          jdk1.8.0_231.tar.gz
```

#构建镜像
```
docker build -t 212.18.35.20:8082/oracle_jdk8_debian:v1  .
```


docker-group:8083
docker-hosted:8082 
8082:上传、下载地址，下载建议使用8083
8083:下载地址
```
# 生成本地镜像

docker build -t 212.18.35.20:8082/oracle_jdk8_debian:v1  .

#登录私服
docker login 212.18.35.20:8082

#上传私服
docker push 212.18.35.20:8082/oracle_jdk8_debian:v1

#下载私服
docker pull 212.18.35.20:8082/oracle_jdk8_debian:v1

#删除容器  Created  Exited
docker rm $(docker ps -a | grep -E 'Exited|Created'| awk '{print $1 }')
#删除 rmi
docker rmi $(docker images | grep "212.18.35.20" | awk '{print $3 }')

```
