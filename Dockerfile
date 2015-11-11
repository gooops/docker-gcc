# FROM: 依赖的镜像
FROM centos

# MAINTAINER: 个人信息
MAINTAINER ghostman "wang_yongjing@163.com"

# RUN: 执行命令
RUN yum -y install tar gcc-c++ libtool bzip2-devel python-devel which wget bzip2 file zip unzip


# ADD: 添加本地文件到容器中，如果是压缩包会在目标目录进行自动解压，如果只想添加文件可以使用 COPY命令
ADD ./ /root/tools

# WORKDIR: 当前的工作目录
WORKDIR /root/tools/

RUN sh install_gcc-4.9.3.sh
RUN sh install_cmake-3.3.2.sh
RUN sh install_boost_1_59_0.sh

RUN rm -rf /root/tools/
