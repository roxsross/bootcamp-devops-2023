# Guía

Esta guía pretende dar una breve introducción al concepto de "_docker networks_".

1. Docker se encarga de los aspectos de red para que los contenedores puedan comunicarse con otros contenedores y también con el Docker Host. Los contenedores podrán comunicarse con cada uno de los hosts y su configuración de red puede ser altamente personalizable gracias a las Docker networks. Este networking también se puede integrar con "orquestadores" como Docker Compose y Docker Swarm.
2. Puedes ver las redes de Docker disponibles con el comando `docker network ls`
3. Puedes inspeccionar la configuración de una red con el comando `docker network inspect networkname`
4. Podemos echar a andar un contenedor de Ubuntu con el siguiente comando `docker run -it -d ubuntu:latest`, y verificar la red default de docker con `docker network inspect bridge`. Esto nos mostrará el contenedor conectado a la red default de Docker
5. Podemos crear nuestras propias redes más customizables con el comando `docker network create --driver drivername networkname`. El driver default es `bridge`. Intentemos crear una con el siguiente comando: `docker network create --driver bridge my_new_network`
6. Ahora podemos volver a instanciar un nuevo contenedor de Ubuntu pero conectándolo a nuestra propia red: `docker run -it --network my_new_network -d ubuntu:latest`. Y de igual manera, podemos inspeccionar nuestra red utilizando el comando `docker network inspect my_new_network`

## Recursos

- <https://docs.docker.com/network/>
