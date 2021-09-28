#!/bin/bash
source ./env.sh

echo "Delete previous topic if exists"
${CONFLUENT_CLI_PATH}/kafka-topics --delete --bootstrap-server localhost:9092 --topic test_no_placement
${CONFLUENT_CLI_PATH}/kafka-topics --delete --bootstrap-server localhost:9092 --topic test_mdc
${CONFLUENT_CLI_PATH}/kafka-topics --delete --bootstrap-server localhost:9092 --topic test_dc1

echo "Creating topic in DC1 and DC2..."
${CONFLUENT_CLI_PATH}/kafka-topics --create --bootstrap-server localhost:9092 --topic test_mdc --partitions 8 --replica-placement ./both.json --config min.insync.replicas=3

# After brokers are expand into 2nd DC, default topic creation behaviour will change to have replica stretched into the 2nd DC
echo "Creating topic with default (no-replica-placement)..."
${CONFLUENT_CLI_PATH}/kafka-topics --create --bootstrap-server localhost:9092 --topic test_no_placement --partitions 8 --config min.insync.replicas=2

# To maintain previous topic creation result (DC1 only), use dc1 only replica-placement strategy
echo "Creating topic in DC1 only..."
${CONFLUENT_CLI_PATH}/kafka-topics --create --bootstrap-server localhost:9092 --topic test_dc1 --partitions 8 --replica-placement ./dc1.json --config min.insync.replicas=2

echo "Redistribute topic replica..."
${CONFLUENT_CLI_PATH}/confluent-rebalancer execute --metrics-bootstrap-server localhost:9092 --bootstrap-server localhost:9092 --replica-placement-only --force --throttle 10000000
