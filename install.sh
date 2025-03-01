# Cloner le dépôt Exegol-Ressources et entrer dans le dossier
apt update
git clone https://github.com/calvyngit/Exegol
cd Exegol

# Ajouter des configurations à tmux.conf
cat .tmux.conf >> ~/.tmux.conf
cat .tmux.conf.local >> ~/.tmux.conf.local
cat aliases >> /opt/.exegol_aliases

# Déplacer des fichiers et répertoires dans les bons emplacements
mv ./win/* /opt/resources/windows
mv ./Linux/* /opt/resources/linux
mv ./env.sh /opt/tools/Exegol-history/

# Revenir à la racine et supprimer le dossier cloné
cd ..
rm -rf Exegol

# Modifier la configuration SSH pour autoriser l'authentification par mot de passe
echo "PermitRootLogin prohibit-password" >> /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config

# Ajouter des dépôts kali
echo "deb http://http.kali.org/kali kali-rolling main contrib non-free non-free-firmware" | sudo tee /etc/apt/sources.list

# Cloner des dépôts supplémentaires
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/romkatv/powerlevel10k.git /root/.oh-my-zsh/custom/themes/powerlevel10k

# Télécharger des scripts spécifiques dans les bons répertoires
cd /opt/resources/windows
wget https://raw.githubusercontent.com/calvyngit/Exegol/refs/heads/main/win/winfast.sh

cd /opt/resources/linux
wget https://raw.githubusercontent.com/calvyngit/Exegol/refs/heads/main/Linux/linfast.sh


# Modifications visuelles
sed -i 's/"#"/"%{$fg[green]%}➜ %{$reset_color%}"/g' /opt/.exegol_shells_rc
sed -i 's/"%m"/"${HOSTNAME#exegol-}"/g' /opt/.exegol_shells_rc
sed -i 's/^ZSH_THEME="gentoo"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' "/root/.zshrc"

chmod +x /opt/tools/Exegol-history/env.sh


# Supprimer le script d'installation
rm /workspace/install.sh
