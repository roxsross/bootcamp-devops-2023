#!/bin/bash

repo="devops-static-web"

if [ "$(id -u)" -ne 0 ]; then
    echo -e "\033[33mCorrer con usuario ROOT\033[0m"
    exit
fi 

echo "====================================="
apt-get update
echo -e "\e[92mEl Servidor se encuentra Actualizado ...\033[0m\n"

apt install -y git
echo -e "\n\033[33mGit se ha instalado\033[0m\n"

if dpkg -s apache2 > /dev/null 2>&1; then
    echo -e "\n\e[96mApache esta realmente instalado \033[0m\n"
else    
    echo -e "\n\e[92mInstalando Apache2 ...\033[0m\n"
    apt install -y git apache2
    systemctl start apache2
    systemctl enable apache2
fi

if [ -d "$repo" ]; then
    echo "La carpeta $repo existe"
    rm -rf $repo
fi

echo -e "\n\e[92mInstalling web ...\033[0m\n"
sleep 1
git clone -b devops-mariobros https://github.com/roxsross/$repo.git 
cp -r $repo/* /var/www/html