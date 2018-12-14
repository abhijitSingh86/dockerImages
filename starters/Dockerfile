FROM java:openjdk-8-jre


ADD ./wait-for-it.sh /usr/bin
ADD ./kafka_start.sh /usr/bin


ENV DEBIAN_FRONTEND noninteractive
ENV SCALA_VERSION 2.11
ENV KAFKA_VERSION 2.1.0
ENV KAFKA_HOME /opt/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION"

# Install Kafka, Zookeeper and other needed things
RUN apt-get update && \
    apt-get install -y zookeeper wget supervisor dnsutils && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    wget -q http://apache.mirrors.spacedump.net/kafka/"$KAFKA_VERSION"/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz -O /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz && \
    tar xfz /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz -C /opt && \
    rm /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz


RUN cd /opt
RUN chmod +x /usr/bin/wait-for-it.sh
RUN chmod +x /usr/bin/kafka_start.sh

ENTRYPOINT ["/usr/bin/wait-for-it.sh" ,"localhost:9092 --echo 'kafka is up, boot strapping the topics' /usr/bin/kafka_start.sh"]
