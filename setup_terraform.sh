#! /bin/bash
# Author : Alexandre Monroche
# Description : This script will install terraform on a debian 11 based live or installation

echo
echo "### Terraform installation ###"
echo

sudo apt update
sudo apt install -y gnupg software-properties-common curl

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

sudo apt update
sudo apt install terraform -y

echo
echo "### Autocompletion installation ###"
echo
terraform -install-autocomplete

echo
echo "### Aliases configuration ###"
echo
echo "alias tf='terraform'" >> ~/.bash_aliases

echo
echo "### Done ###"
echo
