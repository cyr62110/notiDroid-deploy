FROM cyr62110/etcd

RUN apk add nginx
COPY conf/* /etc/nginx/

COPY scripts/* /root/scripts/
RUN chmod u+x /root/scripts/*