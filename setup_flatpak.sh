#! /bin/bash
# Author : Alexandre Monroche
# Description : This script will install flatpak on a debian 11 based system

echo
echo "### Flatpak installation ###"
echo
sudo apt install flatpak -y
sudo apt install gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo
echo "### Done ###"
echo

echo
echo "You should reboot your computer now."
echo
