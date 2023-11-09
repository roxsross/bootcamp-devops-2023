# Mysql con Docker

```bash
# Construir imagen de nodejs
docker run -d --name mysql-container -e MYSQL_ROOT_PASSWORD=my-data-pass -v /data/mysql-data:/var/lib/mysql mysql

# Acceder a MySQL a traves del contenedor
docker exec -it mysql-container bash

# Ejecutar data/mysql-data.sql en el contenedor
mysql -u root -p
USE base_de_datos;

# Detener y eliminar el contenedor MySQL
docker stop mysql-container
docker rm mysql-container

# Vuelve a ejecutar el contenedor MySQL
docker run -d --name mysql-container -e MYSQL_ROOT_PASSWORD=secret -v /data/mysql-data:/var/lib/mysql mysql

# Acceder a MySQL a traves de Docker
docker exec -it mysql-container bash

# Vuelve a acceder a MySQL y verifica que los datos que habías agregado anteriormente aún estén allí
mysql -u root -p
USE base_de_datos;
SELECT * FROM usuarios;
```