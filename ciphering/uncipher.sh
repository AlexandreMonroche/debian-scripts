#! /bin/bash
# Author : Alexandre Monroche
# Description : Bash script to decipher selected file in Nautilus
# Source : https://www.youtube.com/watch?v=MvJYgUJmYLY Paf LeGeek [FR]
# Requirement : zenity; gpg or aescrypt

# Get locales
if [ $LANG == "fr_FR.UTF-8" ]; then
	t_password="Mot de passe"
	t_uncipher_error="Une erreur est survenue lors du déchiffrement. Merci de vérifier votre mot de passe."
	t_error="Erreur"
else
	t_password="Password"
	t_uncipher_error="An error occured during unciphering. Please check your password."
	t_error="Error"
fi

# Get decipher password
password="$(zenity --password --title "$t_password")"

# Decipher selected files and remove encrypted files
for file in $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS
do
gpg --batch --passphrase "$password" "$file" && rm "$file" || \

# Same with aescrypt
#aescrypt -d -p $password $1 && rm $1 || \

zenity --error --text "$t_uncipher_error" \
		--title "$t_error"
done

# Remove password variable from RAM
unset password
