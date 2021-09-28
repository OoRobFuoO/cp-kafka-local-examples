#!/bin/bash
source ./env.sh

echo "Deleting topic..."
${CONFLUENT_CLI_PATH}/kafka-topics --delete --bootstrap-server localhost:9092 --topic test_mdc
${CONFLUENT_CLI_PATH}/kafka-topics --delete --bootstrap-server localhost:9092 --topic test_dc1
