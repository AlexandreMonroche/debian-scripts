#! /bin/bash
# Author : Alexandre Monroche
# Description : This script will install docker on a debian 11 based live or installation

echo
echo "### Docker.io Package installation ###"
echo

sudo apt update
sudo apt install docker.io -y

echo
echo "### Docker service activation ###"
echo
sudo systemctl start docker

echo
echo "### Done ###"
echo
