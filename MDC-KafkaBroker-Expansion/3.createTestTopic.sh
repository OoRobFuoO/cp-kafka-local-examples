#!/bin/bash
source ./env.sh

echo "Delete previous topic if exists"
${CONFLUENT_CLI_PATH}/kafka-topics --delete --bootstrap-server localhost:9092 --topic test_no_placement

# After brokers are expand into 2nd DC, default topic creation behaviour will change to have replica stretched into the 2nd DC
echo "Creating topic with default (no-replica-placement)..."
${CONFLUENT_CLI_PATH}/kafka-topics --create --bootstrap-server localhost:9092 --topic test_no_placement --partitions 8 --config min.insync.replicas=2

# Additional step to prove terraform
