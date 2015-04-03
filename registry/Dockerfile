FROM cyr62110/notidroid-base
MAINTAINER vlaminck.cyril@gmail.com

RUN apk update

#The registry is written in Python so we cant do wihtout
RUN apk add python>=2.7

#Mandatory libraries
RUN apk add libgcc
RUN apk add xz
RUN apk add openssl

#Utilities used to compile the registry. Will be removed from the final container image.
RUN apk add gcc
RUN apk add swig
RUN apk add py-pip

#Includes required to compile the registry. Will be removed from the final container image.
RUN apk add musl-dev
RUN apk add python-dev>=2.7
RUN apk add xz-dev
RUN apk add openssl-dev

RUN pip install docker-registry

COPY /conf/registry/* /etc/docker-registry/

ENV REGISTRY_PORT 50000
ENV DOCKER_REGISTRY_CONFIG /etc/docker-registry/config.yml
ENV SETTINGS_FLAVOR local

#We create some directories that will be used to store registry data
RUN mkdir /var/docker-registry

VOLUME [”/var/docker-registry"]

WORKDIR /etc/nginx

#Install nginx that will work as a security layer for Neo4J
RUN apk add nginx=1.6.2-r1

#Configure nginx
RUN rm -r *
COPY conf/nginx/nginx.conf nginx.conf
COPY conf/nginx/@PROTOCOL@.conf @PROTOCOL@.conf
COPY conf/nginx/user_file user_file

#Create some directories with nginx user. Otherwise nginx will not start
RUN mkdir -p 700 /tmp/nginx
RUN chown -R nginx:nginx /tmp/nginx

EXPOSE @PORT@

WORKDIR /

COPY entrypoint.sh entrypoint.sh
RUN chmod 700 entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
