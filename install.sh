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

# Installation de paquets Python et systèmes
cd /tmp
python3 -m pip install --user uploadserver
apt install ripgrep
apt install medusa -y
pip3 install wsgidav cheroot pyftpdlib

# Installation d'outils supplémentaires
apt-get install snmp-mibs-downloader ripgrep
apt install glow

# Modifier la configuration SSH pour autoriser l'authentification par mot de passe
echo "PermitRootLogin prohibit-password" >> /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config

# Ajouter des dépôts Debian Jessie
echo "deb http://ftp.fr.debian.org/debian/ jessie main non-free" >> /etc/apt/sources.list
echo "deb-src http://ftp.fr.debian.org/debian/ jessie main non-free" >> /etc/apt/sources.list
echo "deb http://http.kali.org/kali kali-rolling main contrib non-free non-free-firmware" | sudo tee /etc/apt/sources.list

# Cloner des dépôts supplémentaires
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Télécharger des scripts spécifiques dans les bons répertoires
cd /opt/resources/windows
wget https://raw.githubusercontent.com/calvyngit/Exegol/refs/heads/main/win/winfast.sh

cd /opt/resources/linux
wget https://raw.githubusercontent.com/calvyngit/Exegol/refs/heads/main/Linux/linfast.sh

# Modifications visuelles
sed -i 's/"#"/"%{$fg[green]%}➜ %{$reset_color%}"/g' /opt/.exegol_shells_rc
sed -i 's/"%m"/"${HOSTNAME#exegol-}"/g' /opt/.exegol_shells_rc
sed -i 's/(%Z)//g' ~/.zshrc

chmod +x /opt/tools/Exegol-history/env.sh
# Supprimer le script d'installation
rm /workspace/install.sh
