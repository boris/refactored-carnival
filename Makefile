.PHONY: run terraform

run:
	docker-compoe up -d

terraform:
ifdef SRV
	cd $(SRV) ; terraform plan
endif
