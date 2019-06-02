FROM java:openjdk-8-jre


WORKDIR /opt
RUN mkdir kafka
#RUN wget -q http://mirrors.estointernet.in/apache/kafka/2.2.0/kafka_2.12-2.2.0.tgz --directory-prefix=/opt/kafka
RUN wget https://www-eu.apache.org/dist/kafka/2.2.0/kafka_2.12-2.2.0.tgz --directory-prefix=/opt/kafka
RUN tar -zxf /opt/kafka/kafka_2.12-2.2.0.tgz --directory=/opt/kafka/

ENV PATH="${PATH}:/opt/kafka/kafka_2.12-2.2.0/bin"

COPY config/kafka_server_jaas.conf /opt/kafka/kafka_2.12-2.2.0/config/kafka_server_jaas.conf
COPY config/server.properties /opt/kafka/kafka_2.12-2.2.0/config/server.properties
COPY config/zookeeper_jaas.conf /opt/kafka/kafka_2.12-2.2.0/config/zookeeper_jaas.conf
COPY config/zookeeper.properties /opt/kafka/kafka_2.12-2.2.0/config/zookeeper.properties

RUN echo $PATH

COPY bin/start-kafka.sh /opt/kafka/start-kafka.sh
RUN chmod -R 777 /opt/kafka/start-kafka.sh
EXPOSE 2181 9092

ENTRYPOINT ["/opt/kafka/start-kafka.sh"]
