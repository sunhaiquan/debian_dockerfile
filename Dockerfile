FROM debian:latest

# 更新apt-get源 使用阿里的源

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
echo "deb     http://mirrors.aliyun.com/debian/ stretch main non-free contrib" >/etc/apt/sources.list && \
echo "deb-src http://mirrors.aliyun.com/debian/ stretch main non-free contrib" >>/etc/apt/sources.list && \
echo "deb     http://mirrors.aliyun.com/debian-security stretch/updates main" >>/etc/apt/sources.list && \
echo "deb-src http://mirrors.aliyun.com/debian-security stretch/updates main" >>/etc/apt/sources.list && \
echo "deb     http://mirrors.aliyun.com/debian/ stretch-updates main non-free contrib" >>/etc/apt/sources.list && \
echo "deb-src http://mirrors.aliyun.com/debian/ stretch-updates main non-free contrib" >>/etc/apt/sources.list && \
echo "deb     http://mirrors.aliyun.com/debian/ stretch-backports main non-free contrib" >>/etc/apt/sources.list && \
echo "deb-src http://mirrors.aliyun.com/debian/ stretch-backports main non-free contrib" >>/etc/apt/sources.list

# 安装相关工具
# net-tools  安装ifconfig
# 安装vim要先安装libtinfo5
RUN apt-get update && apt-get install net-tools -y
RUN apt-get update && apt-get install -y libtinfo5 --allow-remove-essential 
RUN apt-get update && apt-get install vim -y
RUN apt-get update && apt-get install telnet -y 
RUN apt-get update && apt-get install curl  -y 
# 删除安装包
RUN rm -r /var/lib/apt/lists/*

#创建日志目录，如果不创建该目录，log日志打印路径会出错
VOLUME /opt/logs/

# 运行指定的命令，设置东8时区
ENV TZ=Asia/Shanghai
#设置容器时间与宿主机时间同步
RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone

# ADD 命令会自动解压缩
ADD jdk1.8.0_231.tar.gz /usr/local
# 设置系统编码
ENV LANG=C.UTF-8
# 设置JAVA变量环境
ENV JAVA_HOME=/usr/local/jdk1.8.0_231
ENV CLASSPATH=.:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib
ENV PATH=$JAVA_HOME/bin:$PATH
CMD ["java","-version"]

#构建镜像
#docker build -t 212.18.35.20:8082/oracle_jdk8_debian:v1  .
