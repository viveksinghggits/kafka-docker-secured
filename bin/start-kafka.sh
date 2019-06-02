#!/bin/bash

KAFKA_OPTS="-Djava.security.auth.login.config=/opt/kafka/kafka_2.12-2.2.0/config/zookeeper_jaas.conf" zookeeper-server-start.sh /opt/kafka/kafka_2.12-2.2.0/config/zookeeper.properties &


KAFKA_OPTS="-Djava.security.auth.login.config=/opt/kafka/kafka_2.12-2.2.0/config/kafka_server_jaas.conf" kafka-server-start.sh /opt/kafka/kafka_2.12-2.2.0/config/server.properties

