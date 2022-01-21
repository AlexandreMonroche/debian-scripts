#! /bin/bash
# Author : Alexandre Monroche
# Description : Bash script installing cipher/uncipher scripts in Nautilus

# Creating scripts directory if don't exist
mkdir -p ~/.local/share/nautilus/scripts

# Get locales
if [ $LANG == "fr_FR.UTF-8" ]; then
	ciphername="chiffrer"
	unciphername="déchiffrer"
else
	ciphername="cipher"
	unciphername="uncipher"
fi

# Copy scripts to this directory
cp cipher.sh ~/.local/share/nautilus/scripts/$ciphername
cp uncipher.sh ~/.local/share/nautilus/scripts/$unciphername

# Modification of permissions
chmod 700 ~/.local/share/nautilus/scripts/$ciphername
chmod 700 ~/.local/share/nautilus/scripts/$unciphername
