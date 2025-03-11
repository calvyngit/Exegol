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
read -p "Veuillez entrer l'IP du contrôleur de domaine (optionnel, appuyez sur Entrée pour ignorer) : " DC_IP

# Fichier de configuration shell
config_file="$HOME/.zshrc"

# Ajouter les variables d'environnement au fichier de configuration
{
    echo "export HOST=\"$HOST\""
    echo "export TARGET=\"$TARGET\""
    echo "export CHALLENGE_NAME=\"$challenge_name\""

    if [ -n "$DOMAIN" ]; then
        echo "export DOMAIN=\"$DOMAIN\""
    fi

    if [ -n "$USERNAME" ]; then
        echo "export USERNAME=\"$USERNAME\""
    fi

    if [ -n "$PASSWORD" ]; then
        echo "export PASSWORD=\"$PASSWORD\""
    fi

    if [ -n "$HASH" ]; then
        echo "export HASH=\"$HASH\""
    fi

    if [ -n "$DC_IP" ]; then
        echo "export DC_IP=\"$DC_IP\""
    fi
} >> "$config_file"

# Créer un répertoire dans /workspace avec le nom du challenge/CTF
workspace_dir="/workspace/$challenge_name"
mkdir -p "$workspace_dir"

# Afficher un message de confirmation
echo "Répertoire créé : $workspace_dir"
echo "Variables d'environnement définies dans $config_file :"
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

# Recharger le fichier de configuration pour appliquer les changements
source "$config_file"
