#cyr62110/etcd

##About this container

This container is based on Alpine 3.1. It contains a fully working etcd installation.

##Etcdctl

The .bashrc of root has been modified to allow the etcdctl command to connect
by default to the etcd server running on the docker host.
You can remove the alias if this default behavior does not match your requirements.

The address of the docker is determined using route by the following command:
route | grep default | tr -s ' ' | cut -d' ' -f 2

##Etcd server configuration

In this section we assume that your docker0 interface has the following ip address: 172.17.42.1.
If not, replace this address by the one you use on your host.

On Fedora, modify /etc/etcd/etcd.conf and change the following lines:
ETCD_LISTEN_CLIENT_URLS="http://localhost:4001,http://172.17.42.1:4001"
ETCD_ADVERTISE_CLIENT_URLS="http://localhost:4001,http://172.17.42.1:4001"

Then restart your server:
systemctl restart etcd

##Changelog

1.0: Initial version