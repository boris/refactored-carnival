import boto3

sqs = boto3.resource(
        'sqs',
        endpoint_url='http://localhost:4566',
        )

def get_queue(queue_name):
    queue = sqs.get_queue_by_name(QueueName=queue_name)

    print(queue.url)

if __name__ == "__main__":
    get_queue('local-demo-queue')
