#!/bin/bash
yum -y update
yum -y install java wget 
cd ~idirizo
wget http://apache.cbox.biz/kafka/1.0.1/kafka_2.11-1.0.1.tgz
tar xzvf kafka_2.11-1.0.1.tgz
cd kafka_2.11-1.0.1
#Starting zookeeper
bin/zookeeper-server-start.sh config/zookeeper.properties &
#Starting kafka server 
bin/kafka-server-start.sh config/server.properties &
#Creating topic
bin/kafka-topics.sh --create --zookeeper 0.0.0.0:2181 --replication-factor 1 --partitions 1 --topic demo.topic
#Starting kafka-consumer
bin/kafka-console-consumer.sh --bootstrap-server 10.128.64.119:9092 --topic demo.topic --from-beginning

