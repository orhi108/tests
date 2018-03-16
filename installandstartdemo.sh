#!/bin/bash
yum -y update
yum -y install java wget 
cd ~idirizo
#Starting the application
export JAVA_OPTS="-Dspring.kafka.producer.bootstrap-servers=10.128.64.119:9092"; java -jar demo-1.0.jar
#Sending the message
curl http://localhost:8080/send?message=Hello

