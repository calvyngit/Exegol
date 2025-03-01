#!/bin/bash

# Cloner le thème Powerlevel10k dans le répertoire des thèmes personnalisés d'Oh My Zsh
git clone https://github.com/romkatv/powerlevel10k.git /root/.oh-my-zsh/custom/themes/powerlevel10k

# Vérifier si le clonage a réussi
if [ $? -ne 0 ]; then
    echo "Erreur lors du clonage du dépôt Powerlevel10k."
    exit 1
fi

# Chemin vers le fichier .zshrc
ZSHRC_FILE="/root/.zshrc"

# Vérifier si le fichier .zshrc existe
if [ ! -f "$ZSHRC_FILE" ]; then
    echo "Le fichier .zshrc n'existe pas dans le répertoire /root."
    exit 1
fi

# Sauvegarder l'ancien fichier .zshrc
cp "$ZSHRC_FILE" "$ZSHRC_FILE.bak"

# Remplacer la ligne ZSH_THEME
sed -i 's/^ZSH_THEME="gentoo"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' "$ZSHRC_FILE"
echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >> ~/.zshrc

# Afficher un message de confirmation
echo "Le thème Zsh a été mis à jour vers Powerlevel10k."
echo "Vous pouvez recharger votre configuration avec : source ~/.zshrc"
