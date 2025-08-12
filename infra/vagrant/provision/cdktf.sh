#!/bin/bash
set -e
TFVERSION="1.0.10"

install_node(){
    curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
    sudo apt -y install nodejs unzip
}

install_teraform(){
    if [[ $(terraform version | head -1 | cut -d "v" -f2) == $TFVERSION ]];
    then
        echo "Terraforn v$TFVERSION already installed - Skipping"
    else
        cd /tmp
        curl -O https://releases.hashicorp.com/terraform/${TFVERSION}/terraform_${TFVERSION}_linux_amd64.zip
        unzip terraform_${TFVERSION}_linux_amd64.zip
        sudo cp terraform /usr/local/bin/terraform
    fi
}

install_cdktf(){
    sudo npm install --global cdktf-cli
}

echo "=> Installing NodeJS"
install_node
echo "=> Installing Terraform"
install_teraform
echo "=> Installing CDKTF"
install_cdktf
