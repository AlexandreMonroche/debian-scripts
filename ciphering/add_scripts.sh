#! /bin/bash
# Author : Alexandre Monroche
# Description : Bash script installing cipher/uncipher scripts in Nautilus

# Path variable
path = "~/.local/share/nautilus/scripts"

# Creating scripts directory if don't exist
mkdir -p $path

# Get locales
if [ $LANG == "fr_FR.UTF-8" ]; then
	ciphername="chiffrer"
	unciphername="déchiffrer"
else
	ciphername="cipher"
	unciphername="uncipher"
fi

# Copy scripts to this directory
cp cipher.sh $path/$ciphername
cp uncipher.sh $path/$unciphername

# Modification of permissions
chmod 700 $path/$ciphername
chmod 700 $path/$unciphername
