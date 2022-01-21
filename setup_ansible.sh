#! /bin/bash
# Author : Alexandre Monroche
# Description : This script will install vagrant on a debian 11 based live or installation

echo
echo "### Vagrant installation ###"
echo

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

sudo apt update
sudo apt install vagrant -y

echo
echo "### Done ###"
echo
