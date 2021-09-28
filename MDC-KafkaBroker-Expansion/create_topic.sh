./kafka-topics --create --bootstrap-server localhost:9092 --topic test --partitions 1 --replica-placement ${MDC_REPLICA_PLACEMENT_JSON_PATH} --config min.insync.replicas=3
