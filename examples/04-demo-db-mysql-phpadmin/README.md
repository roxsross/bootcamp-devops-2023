# demo-db-mysql-phpadmin

Ejecución de un par de contenedores de `MySQL` y de `PHPMyAdmin` que estén conectados entre si.

```bash

# Inicia container de MySQL: 

docker run --name=db -p 3306:3306 -e MYSQL_ROOT_PASSWORD=secret-pw -d mysql:8.1

#Puedes revisar los logs del contenedor con:
docker logs db

# Puedes conectarte al contenedor con:
docker exec -it db bash` 

#luego conectarte a MySQL por medio del comando 

mysql -u root -p

#Para salir de la terminal interactiva del contenedor, primero hay que salir de MySQL por medio de `exit`, y una vez fuera podemos tecler la combinación `Ctrl+P` y `Ctrl+Q` para salir. Esto no detendrá nuestro contenedor

# Inicia container de `PHPMyAdmin`: 

docker run -d --name=my-admin -p 82:80 --link db:db phpmyadmin:5.2.1

#Podrás ver tu contenedor de `PHPMyAdmin` corriendo desde <http://localhost:82/>
#Una vez ahí introduce las credenciales correctas para acceder y comenzar a jugar con tus contenedores
#Una vez que hayas jugado un poco con los contenedores, asegúrate de detenerlos y borrarlos utilizando 
docker stop
#para detenerlos
docker rm` 
#para removerlos

```