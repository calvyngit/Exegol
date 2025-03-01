#!/bin/bash

# Demander les informations obligatoires à l'utilisateur
read -p "Veuillez entrer l'IP de votre machine hôte (machine attaquante) : " HOST
while [ -z "$HOST" ]; do
    echo "L'IP de la machine hôte est obligatoire."
    read -p "Veuillez entrer l'IP de votre machine hôte (machine attaquante) : " HOST
done

read -p "Veuillez entrer l'IP de la machine victime : " TARGET
while [ -z "$TARGET" ]; do
    echo "L'IP de la machine victime est obligatoire."
    read -p "Veuillez entrer l'IP de la machine victime : " TARGET
done

read -p "Veuillez entrer le nom du challenge/CTF : " challenge_name
while [ -z "$challenge_name" ]; do
    echo "Le nom du challenge/CTF est obligatoire."
    read -p "Veuillez entrer le nom du challenge/CTF : " challenge_name
done

# Demander les informations optionnelles
read -p "Veuillez entrer le domaine (optionnel, appuyez sur Entrée pour ignorer) : " DOMAIN
read -p "Veuillez entrer un nom d'utilisateur (optionnel, appuyez sur Entrée pour ignorer) : " USERNAME
read -p "Veuillez entrer un mot de passe (optionnel, appuyez sur Entrée pour ignorer) : " PASSWORD
read -p "Veuillez entrer un hash (optionnel, appuyez sur Entrée pour ignorer) : " HASH

# Exporter les variables comme variables d'environnement
export HOST="$HOST"
export TARGET="$TARGET"
export CHALLENGE_NAME="$challenge_name"

if [ -n "$DOMAIN" ]; then
    export DOMAIN="$DOMAIN"
fi

if [ -n "$username" ]; then
    export USERNAME="$USERNAME"
fi

if [ -n "$password" ]; then
    export PASSWORD="$PASSWORD"
fi

if [ -n "$hash" ]; then
    export HASH="$HASH"
fi

# Créer un répertoire dans /workspace avec le nom du challenge/CTF
workspace_dir="/workspace/$challenge_name"
mkdir -p "$workspace_dir"

# Afficher un message de confirmation
echo "Répertoire créé : $workspace_dir"
echo "Variables d'environnement définies :"
echo "HOST=$HOST"
echo "TARGET=$TARGET"
echo "CHALLENGE_NAME=$challenge_name"


if [ -n "$DOMAIN" ]; then
    echo "DOMAIN=$DOMAIN"
fi

if [ -n "$USERNAME" ]; then
    echo "USERNAME=$USERNAME"
fi

if [ -n "$PASSWORD" ]; then
    echo "PASSWORD=$PASSWORD"
fi

if [ -n "$HASH" ]; then
    echo "HASH=$HASH"
fi
