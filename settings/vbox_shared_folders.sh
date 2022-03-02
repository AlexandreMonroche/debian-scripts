#! /bin/bash
# Author : Alexandre Monroche
# Description : This script will configure a VM for shared folders

echo
echo "### Beginning ###"
echo

usermod -aG vboxsf $(whoami)

echo
echo "### Done ###"
echo
