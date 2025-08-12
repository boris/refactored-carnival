#!/bin/bash
set -e

apt update

if [[ -f /usr/local/bin/node ]]; then
  echo "Everthing up to date"  
  exit 0
else
  echo -e "=> Installing dependencies"
  apt install -y build-essential python
  echo -e "=> Getting latest code"
  wget -P /tmp https://nodejs.org/dist/v6.10.2/node-v6.10.2.tar.gz
  tar zxf node-v6.10.2.tar.gz
  cd node-v6.10.2
fi
