#!/bin/bash

# Demander les informations obligatoires à l'utilisateur
read -p "Veuillez entrer l'IP de votre machine hôte (machine attaquante) : " host_ip
while [ -z "$host_ip" ]; do
    echo "L'IP de la machine hôte est obligatoire."
    read -p "Veuillez entrer l'IP de votre machine hôte (machine attaquante) : " host_ip
done

read -p "Veuillez entrer l'IP de la machine victime : " victim_ip
while [ -z "$victim_ip" ]; do
    echo "L'IP de la machine victime est obligatoire."
    read -p "Veuillez entrer l'IP de la machine victime : " victim_ip
done

read -p "Veuillez entrer le nom du challenge/CTF : " challenge_name
while [ -z "$challenge_name" ]; do
    echo "Le nom du challenge/CTF est obligatoire."
    read -p "Veuillez entrer le nom du challenge/CTF : " challenge_name
done

# Demander les informations optionnelles
read -p "Veuillez entrer le domaine (optionnel, appuyez sur Entrée pour ignorer) : " domain
read -p "Veuillez entrer un nom d'utilisateur (optionnel, appuyez sur Entrée pour ignorer) : " username
read -p "Veuillez entrer un mot de passe (optionnel, appuyez sur Entrée pour ignorer) : " password
read -p "Veuillez entrer un hash (optionnel, appuyez sur Entrée pour ignorer) : " hash

# Exporter les variables comme variables d'environnement
export HOST_IP="$host_ip"
export VICTIM_IP="$victim_ip"
export CHALLENGE_NAME="$challenge_name"

if [ -n "$domain" ]; then
    export DOMAIN="$domain"
fi

if [ -n "$username" ]; then
    export USERNAME="$username"
fi

if [ -n "$password" ]; then
    export PASSWORD="$password"
fi

if [ -n "$hash" ]; then
    export HASH="$hash"
fi

# Créer un répertoire dans /workspace avec le nom du challenge/CTF
workspace_dir="/workspace/$CHALLENGE_NAME"
mkdir -p "$workspace_dir"

# Afficher un message de confirmation
echo "Répertoire créé : $workspace_dir"
echo "Variables d'environnement définies :"
echo "HOST_IP=$HOST_IP"
echo "VICTIM_IP=$VICTIM_IP"
echo "CHALLENGE_NAME=$CHALLENGE_NAME"

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
