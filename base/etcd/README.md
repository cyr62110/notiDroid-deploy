#cyr62110/etcd

##About this container

This container is based on Alpine 3.1. It contains a fully working etcd installation.

##Etcdctl

The .bashrc of root has been modified to allow the etcdctl command to connect
by default to the etcd server running on the docker host.
You can remove the alias if this default behavior does not match your requirements.

The address of the docker is determined using route by the following command:
route | grep default | tr -s ' ' | cut -d' ' -f 2

/!\ Do not forget to allow connection from the docker0 interface on your etcd server
running on your host ;).

##Changelog

1.0: Initial version