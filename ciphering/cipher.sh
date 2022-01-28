#! /bin/bash
# Author : Alexandre Monroche
# Description : Bash script to cipher selected file in Nautilus
# Source : https://www.youtube.com/watch?v=MvJYgUJmYLY Paf LeGeek [FR]
# Requirement : zenity; gpg or aescrypt

# Get locales
if [ $LANG == "fr_FR.UTF-8" ]; then
	t_password="Mot de passe"
	t_password_confirmation="Confirmation du mot de passe"
	t_cipher_error="Une erreur est survenue lors du chiffrement."
	t_error="Erreur"
	t_password_error="Les mots de passe ne correspondent pas."
else
	t_password="Password"
	t_password_confirmation="Password confirmation"
	t_cipher_error="An error occured during ciphering."
	t_error="Error"
	t_password_error="Passwords do not match."
fi

# Get cipher password
firstpassword="$(zenity --password --title "$t_password")"
secondpassword="$(zenity --password --title "$t_password_confirmation")"

# If passwords match
if [ $firstpassword == $secondpassword ]; then \

# Cipher selected files and remove the original files
for file in $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS
	do gpg --symmetric --cipher-algo AES256 --quiet --batch \
		--passphrase "$firstpassword" "$file" && shred -zu -n 3 "$file" || \

# Same thing but with aescrypt
#aescrypt -e -p "$firstpassword" "$1" && shred -zu -n 3 "$1" || \

zenity --error --text "$t_cipher_error" \
		--title "$t_error"
done

# Remove password variables from RAM
unset firstpassword
unset secondpassword

# If passwords do not match
else

# Remove password variables from RAM
unset firstpassword
unset secondpassword

zenity --error --text "$t_password_error" \
		--title "$t_error"

fi
