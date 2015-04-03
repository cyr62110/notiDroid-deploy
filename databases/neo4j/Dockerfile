FROM cyr62110/notidroid-base-java7
MAINTAINER vlaminck.cyril@gmail.com

WORKDIR /etc/neo4j

#We install Neo4J in /etc/neo4j
#ADD http://neo4j.com/artifact.php?name=neo4j-community-2.1.7-unix.tar.gz neo4j.tar.gz
COPY neo4j-community-2.1.7-unix.tar.gz neo4j.tar.gz
RUN tar -xz < neo4j.tar.gz
RUN rm neo4j.tar.gz
RUN cp -r neo4j-*/* .
RUN rm -r neo4j-*/

#We configure neo4j. We copy all templated configurations copied by Gradle in the build folder.
COPY conf/neo4j/logging.properties conf/logging.properties
COPY conf/neo4j/neo4j-server.properties conf/neo4j-server.properties
COPY conf/neo4j/neo4j.properties conf/neo4j.properties
#FIXME When copying this file -> error su : unknown user
#COPY conf/neo4j/neo4j-wrapper.conf conf/neo4j-wrapper.conf

#We configure neo4j files to belong to the neo4j user.
#neo4j is the linux user that will be used to run neo4j inside the container. Configured in neo4j-wrapper.conf
RUN adduser -h /etc/neo4j -s /bin/bash -D neo4j
RUN chown -R neo4j:neo4j /etc/neo4j
RUN chmod -R 700 /etc/neo4j

#We create the log directory: /var/log/neo4j
RUN mkdir -m 755 -p /var/log/neo4j
RUN chown -R neo4j:neo4j /var/log/neo4j

#We create the data directory: /data
RUN mkdir -m 700 -p /data
RUN chown -R neo4j:neo4j /data

#Symlink neo4j binaries in /bin
RUN ln -s /etc/neo4j/bin/neo4j /bin/neo4j
RUN ln -s /etc/neo4j/bin/neo4j-shell /bin/neo4j-shell

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

WORKDIR /

COPY entrypoint.sh entrypoint.sh
RUN chmod 700 entrypoint.sh

EXPOSE @PORT@

VOLUME ["/data"]

ENTRYPOINT ["/entrypoint.sh"]
