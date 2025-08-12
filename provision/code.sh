#!/bin/bash
sudo apt-get update
sudo apt-get install -y unzip build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev libffi-dev liblzma-dev python-openssl git

# Terraform
echo "=> Installing Terraform"
curl -o /tmp/terraform.zip https://releases.hashicorp.com/terraform/0.12.29/terraform_0.12.29_linux_amd64.zip
unzip /tmp/terraform.zip -d /tmp
sudo mv /tmp/terraform /usr/local/bin/terraform
rm /tmp/terraform*

# Pyenv
curl https://pyenv.run | bash

