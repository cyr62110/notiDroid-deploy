#! /bin/bash

shopt -s expand_aliases
source ~/.bashrc

NGINX_CONFIG_PATH=/etc/nginx/conf.d
NGINX_USER_FILE=$NGINX_CONFIG_PATH/user_file

function echo_username_password_from_etcd_path {
	USERNAME=$(etcdctl get $1/username)
	PASSWORD=$(etcdctl get $1/password)

	echo "$USERNAME:{PLAIN}$PASSWORD" >> $NGINX_USER_FILE
}

#First, we create the file where all password will be exported
mkdir -p $NGINX_CONFIG_PATH
touch $NGINX_USER_FILE

#Then we determine if we are using a multiuser config or a single-user

#Single-user: We read the username and password from the configured directory
echo_username_password_from_etcd_path $SERVICE_CONFIG_DIRECTORY