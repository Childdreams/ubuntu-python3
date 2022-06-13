FROM ubuntu:latest

MAINTAINER baofeng

RUN apt-get install -y wget gcc build-essential && \
    wget https://www.python.org/ftp/python/3.7.1/Python-3.7.1.tgz && \
    tar -zxvf Python-3.7.1.tgz && \
    cd Python-3.7.1 && \
    mkdir -p /usr/local/python3 && \
    ./configure --prefix=/usr/local/python3  --enable-optimizations && \
    make && \
    make install && \
    # 删除python软链接
    rm -rf /usr/bin/python && \
    # 删除pip软链接
    rm -rf /usr/bin/pip && \
    # 添加python3的软链接
    ln -s /usr/local/python3/bin/python3.7 /usr/bin/python && \
    # 添加 pip3 的软链接
    ln -s /usr/local/python3/bin/pip3.7 /usr/bin/pip



