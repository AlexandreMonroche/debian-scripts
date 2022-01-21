#! /bin/bash
# Author : Alexandre Monroche
# Description : This script will install ansible on a debian 11 based live or installation

echo
echo "### Ansible installation ###"
echo

echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu focal main" | sudo tee -a /etc/apt/sources.list.d/ansible.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367

sudo apt update
sudo apt install ansible -y

echo
echo "### Done ###"
echo
