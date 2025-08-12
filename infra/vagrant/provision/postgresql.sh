#!/bin/bash
add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main"
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
add-apt-repository ppa:ubuntugis/ubuntugis-unstable
apt update
apt install -y postgresql-9.6 postgresql-9.6-postgis-2.3
