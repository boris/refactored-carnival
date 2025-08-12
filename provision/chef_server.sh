#!/bin/bash
set -e

apt-get update

echo -e "=> Installing dependencies"
apt-get install -y wget

echo -e "=> Getting latest code"
wget -P /tmp https://packages.chef.io/stable/ubuntu/14.04/chef-server-core_12.5.0-1_amd64.deb
dpkg -i /tmp/chef-server-core_12.5.0-1_amd64.deb

