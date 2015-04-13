#cyr62110/reverse-proxy

##About this container

This container is meant to be used as the base of every service you want to hide behind a reverse-proxy.

###Configuration

The usernames and passwords of authorized are retrieved using etcd. 
You must set the SERVICE_CONFIG_DIRECTORY environnement variable. 
This variable should point to the etcd directory that will be used to store the service configuration.
Ex: /notidroid/neo4j/. The / at the end of the path is MANDATORY.

##Single-user configuration

In the SERVICE_CONFIG_DIRECTORY, you must create two keys: username, password. 

Keys:
- username: Username that will be used to authenticate through Basic-Authentication
- password: Password that will be used to authenticate through Basic-Authentication. Must be in clear.

WIP: For now the password must be in clear in etcd. I know it can be a security flaw.

##Multi-user configuration

/!\ Not implemented

In the SERVICE_CONFIG_DIRECTORY, you must create a new directory: users.
This directory will contains multiple directories. Each directory representing an username/password couple
that can be used to authenticate to the reverse proxy. The name of those sub-directories does not matter.

Each sub-directory must contains the two keys describe in the single-user configuration: username, password.

##Watch

/!\ Not implemented.
Use etcdctl watch to observe change on keys. On change: recreate Nginx conf and restart nginx.

##Changelog

1.0: Single-user configuration
