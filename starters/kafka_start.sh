#!/bin/bash


$KAFKA_HOME/bin/kafka-topics.sh --create --zookeeper zookeeper:2181 --topic test --partitions 2 --replication-factor 1
