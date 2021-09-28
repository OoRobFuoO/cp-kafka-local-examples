#!/bin/bash
source ./env.sh

${CONFLUENT_CLI_PATH}/confluent-rebalancer status --bootstrap-server localhost:9092
