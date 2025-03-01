# Exegol

Bienvenue sur mon repository dédié à Exegol. Il est basé sur le repo Exegol de Frozenka(https://github.com/Frozenka/Exegol-Ressources), avec un ajout personnel au niveau des variables d'environnement tels que : $HOST, $TARGET, $DOMAIN(optionnel), $USER(optionnel) et $PASSWORD(optionnel). J'ai également supprimé des alias et des outils dont je n'ai pas l'utilité pour le moment afin d'alléger l'installation.

# Installation du script

Exécuter cette commande dans votre terminal afin d'installer ma personnalisation pour Exegol

``` wget https://raw.githubusercontent.com/calvyngit/Exegol/refs/heads/main/load_user_setup.sh && cat load_user_setup.sh > ~/.exegol/my-resources/setup/load_user_setup.sh && rm load_user_setup.sh ```

# Définition des variables d'environnement

Afin de définir vos propres variables d'environnement et d'exploiter les commandes préenregistrées dans le fichier .zsh_history d'Exegol, vous pouvez lancer le script suivant :

``` /opt/tools/Exegol-history/env.sh ```

Ce script va vous demander de définir l'IP de votre machine hôte (machine attaquante), la machine victime, le domaine(optionnel, remplissez si vous l'avez), un username(optionnel), un mot de passe(optionnel) ou un hash(optionnel).

