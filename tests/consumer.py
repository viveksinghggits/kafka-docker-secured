from kafka import KafkaConsumer 
consumer = KafkaConsumer("go_to_router", bootstrap_servers='localhost:9092', security_protocol="SASL_PLAINTEXT", sasl_plain_username="admin", sasl_plain_password="vivek$ingh", sasl_mechanism="PLAIN")


for msg in consumer:
    print(msg)
