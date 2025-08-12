.PHONY: run plan
.DEFAULT_GOAL := help

run: ## Run docker-compose with all the modules enabled. To run only some of them, use SERVICES=lambda,dynamodb make run
	SERVICES=$(SERVICES) docker-compose up -d

stop: ## Stop all the services started by docker compose (make run)
	docker-compose stop

plan: ## plan terraform for the service defined on `SRV`. Example: SRV=dynamodb make plan
ifdef SRV
	cd $(SRV) ; terraform plan
endif

apply: ## Apply terraform for the service defined on `SRV`. Example: SRV=dynamodb make apply
ifdef SRV
	cd $(SRV) ; terraform apply
endif

init: ## Run terraform init for the service defined on `SRV`. Example: SRV=dynamobd make apply
ifdef SRV
	cd $(SRV) ; terraform init
endif

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
