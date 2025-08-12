#!/bin/bash
set -e

ask(){
    read -p 'Environment: ' environment
    read -p 'Region: ' region
    read -p 'Service Name: ' service
}

main(){
    ask
    echo "Creating folder directory"
    mkdir -p ./$environment/$region/$service
    if [ $? -eq 0  ]; then
        echo -e "\e[32mSuccess!\e[0m"
    else
        echo -e "\e[31mFailed! Exit\e[0m"
    fi
    echo "Copying files"
    cp -a common/* $environment/$region/$service
    if [ $? -eq 0  ]; then
        echo -e "\e[32mSuccess!\e[0m"
    else
        echo -e "\e[31mFailed! Exit\e[0m"
    fi
}

main
