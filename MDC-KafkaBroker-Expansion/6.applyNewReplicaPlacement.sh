#!/bin/bash
source ./env.sh

# To maintain previous topic creation result (DC1 only), use dc1 only replica-placement strategy
echo "Updating test_dc1 replica-placement..."
${CONFLUENT_CLI_PATH}/kafka-configs --bootstrap-server localhost:9092  --alter --topic test_dc1 --replica-placement ./both.json

echo "Redistribute topic replica..."
${CONFLUENT_CLI_PATH}/confluent-rebalancer execute --metrics-bootstrap-server localhost:9092 --bootstrap-server localhost:9092 --replica-placement-only --force --throttle 10000000
