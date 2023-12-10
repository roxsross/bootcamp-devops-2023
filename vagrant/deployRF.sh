#!/bin/bash

#Declaración de variables
USERID=$(id -u)
REPO="https://github.com/romancete85/linuxdeploy.git"
FOLDER="bootcamp-devops-2023"
RAMA="clase2-linux-bash"
APP="app-295devops-travel"

#Colours
LRED='\033[1;31m'
LGREEN='\033[1;32m'
NC='\033[0m'
LBLUE='\033[0;34m'
LYELLOW='\033[1;33m'

echo  -e "\n${LGREEN} ########################################################################${NC}"
echo  -e "\n${LGREEN} ##########################STAGE 1: [Init]#########################${NC}"
echo  -e "\n${LGREEN} ########################################################################${NC}"


#Validation of root user
if [ "${USERID}" -ne 0 ]; then
    echo -e "\n${LRED} Must be ROOT user${NC}"
    exit
fi 

#Server update  
echo " System Update"
apt-get update
echo -e "\n${LGREEN}Server is up to date ...${NC}"


#Git install check
if dpkg -s git > /dev/null 2>&1; then
    echo -e "\n${LBLUE} Git is up to date ...${NC}"
else    
    echo -e "\n${LYELLOW}Installing Git ...${NC}"
    apt install -y git
fi


# maria db install check
if dpkg -s mariadb-server > /dev/null 2>&1; then
    echo -e "\n${LBLUE}The DB Server is up to date ...${NC}"
else    
    echo -e "\n${LYELLOW}Installing MARIA DB ...${NC}"
    apt install -y mariadb-server
    
#DB Inicializing
    systemctl start mariadb
    systemctl enable mariadb
fi 


#Apache2 [WEB] Install Check
if dpkg -s apache2 > /dev/null 2>&1; then
    echo -e "\n${LBLUE}Apache already installed ...${NC}"
else    
    echo -e "\n${LYELLOW}Instalando Apache2 ...\033[0m\n"
    apt install -y apache2
    apt install -y php libapache2-mod-php php-mysql php-mbstring php-zip php-gd php-json php-curl
    systemctl start apache2
    systemctl enable apache2
    #Config Apache
    php -v
    mv /var/www/html/index.html /var/www/html/index.html.bkp
fi


echo  -e "\n${LGREEN} ########################################################################${NC}"
echo  -e "\n${LGREEN} ##########################STAGE 2: [Build]#########################${NC}"
echo  -e "\n${LGREEN} ########################################################################${NC}"


# Config Git account
git config --global user.name "romancete85"
git config --global user.email "romanfandrich@hotmail.com"

# Repo check and install
if [ -d "$FOLDER" ]; then
    echo -e "\n${LBLUE}The folder $FOLDER exists ...${NC}"
    cd ${FOLDER}
    git pull origin clase2-linux-bash
else
    echo -e "Cloning Repo"
    git clone  https://github.com/roxsross/$FOLDER.git
    cd ${FOLDER}
    git pull origin clase2-linux-bash
    echo $FOLDER

    cp -r ~/$FOLDER/app-295devops-travel/* /var/www/html
fi


# DATABASE "Devopstravel" check
echo -e "CHECKING DB SOURCE"
if mysqlshow devopstravel > /dev/null 2>&1; then
    echo -e "The DB devopstravel already exists"
else
    echo -e "Creating DATABASE"
    # Solicitar la contraseña
    read -s -p "Ingresa la contraseña para el usuario 'codeuser': " password
    # Ejecuta las consultas MySQL con la contraseña proporcionada
    mysql -e "CREATE DATABASE devopstravel;
              CREATE USER 'codeuser'@'localhost' IDENTIFIED BY '$password';
              GRANT ALL PRIVILEGES ON *.* TO 'codeuser'@'localhost';
              FLUSH PRIVILEGES;"
    echo -e "DB CREATED"
    mysql < ~/$FOLDER/app-295devops-travel/database/devopstravel.sql  # tables insert
    #mysql < ~/filesystem/bootcamp-devops-2023/app-295devops-travel/database/devopstravel.sql
    echo -e "DB TABLES INSERTED"
fi      

 #Apache config, Soporte extension PHP
    sed -i 's/index.html/index.php index.html/g' /etc/apache2/mods-enabled/dir.conf
    #sudo sed -i 's/DirectoryIndex index.html/DirectoryIndex index.php index.html/' /etc/apache2/mods-enabled/dir.conf
    systemctl reload apache2
    echo "----------------EXTENSION PHP ENABLED-----------------------------"


# Solicitar al usuario que ingrese la nueva contraseña de la base de datos
read -s -p "Ingrese la nueva contraseña de la base de datos: " db_password
echo "Pass CREATED"

# Ruta al archivo config.php
config_file="/var/www/html/config.php"

# Actualizar la contraseña en el archivo config.php
sed -i "s/\$dbPassword = \".*\";/\$dbPassword = \"$db_password\";/" $config_file
echo "Contraseña de la base de datos actualizada en $config_file"

#sed -i 's/""/"codepass"/g' /var/www/html/config.php

# CODE tEST
if test -f "/var/www/html/index.php"; then
    echo "  "
    echo -e "\n${LBLUE} CODIGO OK ...${NC}"
fi


echo  -e "\n${LGREEN} ########################################################################${NC}"
echo  -e "\n${LGREEN} ##########################STAGE 3: [Deploy]#########################${NC}"
echo  -e "\n${LGREEN} ########################################################################${NC}"


#Reload Apache service
echo -e "\n${LYELLOW} Reloading Apache and Mariadb... ...${NC}"
systemctl reload apache2
systemctl restart mariadb
echo -e "\n${LYELLOW} Apache and Mariadb reloaded  ...${NC}"

#Verificar la aplicacion
curl localhost
#copy web files
echo -e "\n${LYELLOW} Localhost OK ...${NC}"


echo  -e "\n${LGREEN} ########################################################################${NC}"
echo  -e "\n${LGREEN} ##########################STAGE 4: [Notify]#########################${NC}"
echo  -e "\n${LGREEN} ########################################################################${NC}"


#Discord web hook
DISCORD=https://discord.com/api/webhooks/1154865920741752872/au1jkQ7v9LgQJ131qFnFqP-WWehD40poZJXRGEYUDErXHLQJ_BBszUFtVj8g3pu9bm7h

#Variables
REPO_NAME="romancete85/linuxdeploy"
REPO_URL=https://github.com/$REPO_NAME
WEB_URL="localhost"

HTTP_STATUS=$(curl -Is "$WEB_URL" | head -n 1)

if [[ "$HTTP_STATUS" == *"200"* ]]; then
    DEPLOYMENT_INFO2="Despliegue del repositorio $REPO_NAME: "
    DEPLOYMENT_INFO="La página web $WEB_URL está en línea."
    COMMIT="Commit: $(git rev-parse --short HEAD)"
    AUTHOR="Autor: Roman Fandrich" 
    DESCRIPTION="Descripción: $(git log -1 --pretty=format:'%s')"
else
  DEPLOYMENT_INFO="La página web $WEB_URL no está en línea."
fi

MESSAGE="$DEPLOYMENT_INFO2\n$DEPLOYMENT_INFO\n$COMMIT\n$AUTHOR\n$REPO_URL\n$DESCRIPTION"

curl -X POST -H "Content-Type: application/json" \
     -d '{
       "content": "'"${MESSAGE}"'"
     }' "$DISCORD"


# Final Message
echo  -e "\n${LGREEN} #################"295DevOps Travel installation successfull"#############################${NC}"
echo  -e "\n${LGREEN} ##################"Please go to http://localhost to test"#########################${NC}"
echo  -e "\n${LGREEN} ########################################################################${NC}"
