#! /bin/bash

neo4j start-no-wait
nginx

sleep 10s
while true; do
	tail -f /var/log/neo4j/neo4j.0.log
done