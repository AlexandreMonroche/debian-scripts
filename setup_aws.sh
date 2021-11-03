#! /bin/bash
# Author : Alexandre Monroche
# Description : This script will install aws cli on a debian 11 based live or installation
# Requirements : setup_docker.sh & setup_terraform.sh scripts on the same directory

echo
echo "### Docker & Terraform installation ###"
echo

./setup_docker.sh
./setup_terraform.sh

echo
echo "### Alias configuration ###"
echo

echo "alias aws='sudo docker run --rm -it amazon/aws-cli'" >> ~/.bash_aliases

echo
echo "### AWS configuration ###"
echo
mkdir -p ~/.aws

cat << EOF > ~/.aws/config
[default]
region = eu-west-3
output = json
EOF

# You have to put your credentials here
cat << EOF > ~/.aws/credentials
[account]
aws_access_key_id = 
aws_secret_access_key = 
EOF

echo
echo "### Done ###"
echo
