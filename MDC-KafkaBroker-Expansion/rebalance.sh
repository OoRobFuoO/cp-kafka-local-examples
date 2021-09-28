#!/bin/bash
source ./env.sh

${CONFLUENT_CLI_PATH}/confluent-rebalancer execute --metrics-bootstrap-server localhost:9092 --bootstrap-server localhost:9092 --replica-placement-only --force --throttle 10000000
