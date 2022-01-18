#! /bin/bash
# Author : Alexandre Monroche
# Description : This script will configure a debian 11 based installation with personnal settings

echo
echo "### Software installation ###"
echo

sudo apt update
sudo apt install -y \
keepassxc \
git \
cmatrix \
nyancat

echo
echo "### Gnome configuration ###"
echo
# List all possible options for an app
# gsettings list-recursively | grep -i gedit

# Set dark theme on gnome
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
# Set dark theme on gedit
gsettings set org.gnome.gedit.preferences.editor scheme 'oblivion'
# Set nautilus preferences
gsettings set org.gnome.nautilus.preferences click-policy 'single'
gsettings set org.gnome.nautilus.preferences show-delete-permanently true
gsettings set org.gnome.gedit.preferences.editor tabs-size "uint32 4"
# Set french keyboard layout
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'fr')]"

echo
echo "### Aliases configuration ###"
echo
echo "alias l='ls -lrth'" > ~/.bash_aliases
echo "alias ll='l -a'" >> ~/.bash_aliases

echo
echo "### Flatpak install ###"
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
