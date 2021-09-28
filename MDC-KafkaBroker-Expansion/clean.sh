#!/bin/bash
source ./env.sh

docker-compose -f docker-compose.yml -f docker-compose-step1.yml -f docker-compose-step2.yml down
