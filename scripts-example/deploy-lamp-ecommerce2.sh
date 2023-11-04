#!/bin/bash
#Variable
repo="The-DevOps-Journey-101"
USERID=$(id -u)
#colores
LRED='\033[1;31m'
LGREEN='\033[1;32m'
NC='\033[0m'
LBLUE='\033[0;34m'
LYELLOW='\033[1;33m'



if [ "${USERID}" -ne 0 ]; then
    echo -e "\n${LRED}Correr con usuario ROOT${NC}"
    exit
fi 

echo "====================================="
apt-get update
echo -e "\n${LGREEN}El Servidor se encuentra Actualizado ...${NC}"

apt install -y git
echo -e "\n${LYELLOW}instalando GIT ...${NC}"

#### base de datos maria db ######
 
if dpkg -s mariadb-server > /dev/null 2>&1; then
    echo -e "\n${LBLUE}El Servidor se encuentra Actualizado ...${NC}"
else    
    echo -e "\n${LYELLOW}instalando MARIA DB ...${NC}"
    apt install -y mariadb-server
###Iniciando la base de datos
    systemctl start mariadb
    systemctl enable mariadb

 echo -e "\n${LBLUE}Configurando base de datos ...${NC}"
###Configuracion de la base de datos 
    mysql -e "
    CREATE DATABASE ecomdb;
    CREATE USER 'ecomuser'@'localhost' IDENTIFIED BY 'ecompassword';
    GRANT ALL PRIVILEGES ON *.* TO 'ecomuser'@'localhost';
    FLUSH PRIVILEGES;"

###crear script de insertar datos en tabla
cat > db-load-script.sql <<-EOF
USE ecomdb;
CREATE TABLE products (id mediumint(8) unsigned NOT NULL auto_increment,Name varchar(255) default NULL,Price varchar(255) default NULL, ImageUrl varchar(255) default NULL,PRIMARY KEY (id)) AUTO_INCREMENT=1;
INSERT INTO products (Name,Price,ImageUrl) VALUES ("Laptop","100","c-1.png"),("Drone","200","c-2.png"),("VR","300","c-3.png"),("Tablet","50","c-5.png"),("Watch","90","c-6.png"),("Phone Covers","20","c-7.png"),("Phone","80","c-8.png"),("Laptop","150","c-4.png");
EOF
#ejecutar script
mysql < db-load-script.sql

fi #cierre condicional

#apache [WEB]

if dpkg -s apache2 > /dev/null 2>&1; then
    echo -e "\n${LBLUE}El Apache2 se encuentra ya instalado ...${NC}"
else    
    echo -e "\n\e[92mInstalando Apache2 ...\033[0m\n"
    apt install -y apache2
    apt install -y php libapache2-mod-php php-mysql
    systemctl start apache2
    systemctl enable apache2
    mv /var/www/html/index.html /var/www/html/index.html.bkp
fi


if [ -d "$repo" ]; then
    echo -e "\n${LBLUE}La carpeta $repo existe ...${NC}"
    rm -rf $repo
fi

echo -e "\n${LYELLOW}instalando WEB ...${NC}"
sleep 1
git clone https://github.com/roxsross/$repo.git 
cp -r $repo/CLASE-02/lamp-app-ecommerce/* /var/www/html
sed -i 's/172.20.1.101/localhost/g' /var/www/html/index.php
echo "====================================="

### reload
systemctl reload apache2