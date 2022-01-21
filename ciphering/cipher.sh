#! /bin/bash
# Author : Alexandre Monroche
# Description : Script bash de chiffrement de fichier
# Source : https://www.youtube.com/watch?v=MvJYgUJmYLY Paf LeGeek
# Requirement : zenity, gpg or aescrypt

# Récupération du mot de passe de chiffrement
firstpassword="$(zenity --password --title "Mot de passe")"
secondpassword="$(zenity --password --title "Confirmation du mot de passe")"

# Si les mots de passe correspondent
if [ $firstpassword == $secondpassword ]; then \

# Commande chiffrant et effaçant le fichier originel utilisant gpg
gpg --symmetric --cipher-algo AES256 --quiet --batch \
--passphrase "$firstpassword" "$@" && shred -zu -n 3 "$@" || \

# Chiffrement utilisant aescrypt
#aescrypt -e -p "$firstpassword" "$1" && shred -zu -n 3 "$1" || \

zenity --error --text "Une erreur est survenue lors du chiffrement." \
		--title "Erreur"

# Suppression des variables stockant les mots de passe
unset firstpassword
unset secondpassword

else
# Si les mots de passe ne correspondent pas

# Suppression des variables stockant les mots de passe
unset firstpassword
unset secondpassword

zenity --error --text "Les mots de passe ne correspondent pas." \
		--title "Erreur"

fi
