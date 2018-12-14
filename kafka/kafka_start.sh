!#/bin/bash

kafka-server-start


kafka-topics --create --zookeeper localhost:2181 --topic test --partitions 2 --replication-factor 1
