FROM nginx:1.7.9
MAINTAINER vlaminck.cyril@gmail.com

RUN rm /etc/nginx/nginx.conf
RUN rm /etc/nginx/conf.d/*

ADD nginx.conf /etc/nginx/
ADD http*.conf /etc/nginx/conf.d/

ADD admin/ /var/www/admin

EXPOSE @PORTS@

ENTRYPOINT ["nginx"]
