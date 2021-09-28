#!/bin/bash
source ./env.sh

${CONFLUENT_CLI_PATH}/kafka-topics --describe --bootstrap-server localhost:9092 --topic $1
