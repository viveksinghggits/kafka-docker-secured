from kafka import KafkaProducer 
producer = KafkaProducer(bootstrap_servers='localhost:9092', security_protocol="SASL_PLAINTEXT", sasl_plain_username="admin", sasl_plain_password="vivek$ingh", sasl_mechanism="PLAIN")
for _ in range(100):
    print("Starting for {}".format(_))
    s = "some message "+str(_)
    producer.send("go_to_router", s)
