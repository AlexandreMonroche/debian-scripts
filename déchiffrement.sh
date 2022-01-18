#! /bin/bash
# Author : Alexandre Monroche
# Description : Script bash de déchiffrement de fichier
# Source : https://www.youtube.com/watch?v=MvJYgUJmYLY Paf LeGeek
# Requirement : zenity, gpg or aescrypt

# Récupération du mot de passe de déchiffrement
password="$(zenity --password --title "Mot de passe")"

# Commande déchiffrant et supprimant le fichier chiffré utilisant gpg
gpg --batch --passphrase "$password" "$1" && rm "$1" || \

# Déchiffrement utilisant aescrypt
#aescrypt -d -p $password $1 && rm $1 || \

zenity --error --text "Une erreur est survenue lors du déchiffrement. Merci de vérifier votre mot de passe." \
		--title "Erreur"
		
# Suppression de la variable stockant le mot de passe
unset password

