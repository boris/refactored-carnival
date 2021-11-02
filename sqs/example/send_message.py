import boto3

sqs = boto3.client(
        'sqs',
        endpoint_url='http://localhost:4566',
        )

def send_message(queue_name, message):
    queue_url = sqs.get_queue_url(QueueName=queue_name)

    response = sqs.send_message(
            QueueUrl=queue_url['QueueUrl'],
            MessageBody=message,
            MessageAttributes={
                'Title': {
                    'DataType': 'String',
                    'StringValue': 'Fluent Python'
                    },
                'Author': {
                    'DataType': 'String',
                    'StringValue': 'Luciano Ramallo'
                    }
                }
            )

    print("Message ID: {}".format(response['MessageId']))

if __name__ == "__main__":
    send_message('local-demo-queue',
            'This is a testing message',
            )
