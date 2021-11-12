import json

def lambda_handler(event, context):
    return {
            'statusCode': 200,
            'body': 'Hello World! This is a new message.'
            }
