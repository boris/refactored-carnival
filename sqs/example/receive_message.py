import boto3

sqs = boto3.client(
        'sqs',
        endpoint_url='http://localhost:4566',
        )

def receive_message(queue_name):
    queue_url = sqs.get_queue_url(QueueName=queue_name)

    response = sqs.receive_message(
            QueueUrl=queue_url['QueueUrl'],
            MaxNumberOfMessages=1,
            MessageAttributeNames=[
                'Title',
                'Author',
                ]
            )

    message = response['Messages'][0]
    receipt_handle = message['ReceiptHandle']

    # Delete received message from queue
    sqs.delete_message(
            QueueUrl=queue_url['QueueUrl'],
            ReceiptHandle=receipt_handle,
            )

    print("Message ID: {}".format(message['MessageId']))
    print("Message Body: {}".format(message['Body']))
    print("Message Attributes: {}".format(message['MessageAttributes']))

if __name__ == "__main__":
    receive_message('local-demo-queue')
