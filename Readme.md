# AWS
AWS resources for local development, using [localstack](https://localstack.cloud/) which means _cloud_ is ephemeral

## Requirements:
- docker
- docker-compose
- terraform ~> 1.0.0

## Usage:
```
docker-compose up
```

After that, enter to each AWS resource directory and run terraform

## Pending:
- Makefile
- More services, like Lambda and API Gateway
