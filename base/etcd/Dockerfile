FROM gliderlabs/alpine:3.1
MAINTAINER vlaminck.cyril@gmail.com

RUN apk update
RUN apk add bash
RUN apk add go

WORKDIR /tmp/etcd
ADD https://github.com/coreos/etcd/archive/v2.0.8.tar.gz ./
RUN tar -xz < v2.0.8.tar.gz

WORKDIR /tmp/etcd/etcd-2.0.8
RUN ./build
RUN cp ./bin/* /usr/local/bin/

WORKDIR /root
COPY bashrc .bashrc

WORKDIR /

RUN rm -rf /tmp/etcd