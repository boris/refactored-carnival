# Usage:

1. Go one level above and start localstack (`make help` for help)
2. Run terraform:
```
SRV=sqs make apply
```
3. Go to `example` directory and run:
```
pip install -r requirements.txt
python get_queue.py # To get the information of the queue
python send_message.py # To send ONE message to the queue. Run it multiple times
to send all the messages you want
python receive_message.py # To receive ONE message
```

### RTFM:
- [boto3 docs about send and receive](https://boto3.amazonaws.com/v1/documentation/api/latest/guide/sqs-example-sending-receiving-msgs.html)
- [SQS receive_message](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/sqs.html#SQS.Client.receive_message)
