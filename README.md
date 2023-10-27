# IV Edición Bootcamp DevOps by RoxsRoss
![JavaScript](https://img.shields.io/badge/-JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=black)
![Node.js](https://img.shields.io/badge/-Node.js-339933?style=for-the-badge&logo=node.js&logoColor=white)
![HTML5](https://img.shields.io/badge/-HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
![Terraform](https://img.shields.io/badge/terraform-7B42BC?logo=terraform&logoColor=white&style=for-the-badge)
![VSCode](https://img.shields.io/badge/Visual_Studio_Code-0078D4?style=for-the-badge&logo=visual%20studio%20code&logoColor=white)
![kubernetes](https://img.shields.io/badge/kubernetes-326CE5?logo=kubernetes&logoColor=white&style=for-the-badge)
![Azure](https://img.shields.io/badge/azure-0078D4?logo=microsoft-azure&logoColor=white&style=for-the-badge)
![Amazon](https://img.shields.io/badge/Amazon_AWS-232F3E?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Gcp](https://img.shields.io/badge/Google_Cloud-4285F4?style=for-the-badge&logo=google-cloud&logoColor=white)
![Docker](https://img.shields.io/badge/docker-2496ED?logo=docker&logoColor=white&style=for-the-badge)
![python](https://img.shields.io/badge/python-3776AB?logo=python&logoColor=white&style=for-the-badge)
![golang](https://img.shields.io/badge/Go-00ADD8?style=for-the-badge&logo=go&logoColor=white)
![github Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=github-actions&logoColor=white)
![Gitlab](https://img.shields.io/badge/GitLab-330F63?style=for-the-badge&logo=gitlab&logoColor=white)
![Jenkins](	https://img.shields.io/badge/Jenkins-D24939?style=for-the-badge&logo=Jenkins&logoColor=white)
![city](https://img.shields.io/badge/TeamCity-000000?style=for-the-badge&logo=TeamCity&logoColor=white)

---
![](https://github.com/roxsross/roxsross/blob/main/images/roxsross-banner-1.png)

🔥🔥🔥🔥

### by RoxsRoss

---
El **desafío final** es surfear las olas en práctica y desafiar los conocimientos sobre las herramientas tecnológicas y conceptos teóricos aprendidos durante estos meses.
En las clases vimos: Intro DevOps, Git, Docker, Kubernetes, CI/CD, Jenkins, Github Actions, Cloud, Security, etc.

## **Objetivos**:
- Utilizar todo lo aprendido durante el bootcamp
- Proponer y llevar a cabo una solución general a la problemática
- Simular el caso real del ciclo de vida de una aplicación
- La automatización es la clave
- Crear y mantener entornos productivos y no productivos (develop, testing)
- Aprender a utilizar nuevas Tools
- Aprender a trabajar en equipo para resolver dudas o problemáticas

## **Requerimiento:**
La empresa **ZERO Technology**, solicita al Equipo de DevOps Trainer SuperPower 🚀 la contenerizacion de su aplicacion "Products DevOps" en la que incluye:

Los proyectos estan formados por servicios (**frontend** y **backends**) el requerimiento apunta a desplegarlo en un cluster de Kubernetes. 

- Frontend
- Backend: products , merchandise & shopping-cart

Apuntando a lograr administrar el ciclo de las aplicaciones dentro del cluster de forma transparente y que además se pueda automatizar el deploy desde el repositorio.

#### Frontend
Aplicacion realizada en express y se expone en el puerto 3000

### Backend products
Aplicacion realizada en express y se expone en el puerto 3001

### Backend shopping-cart
Aplicacion realizada en express y se expone en el puerto 3002

### Backend merchandise
Aplicacion realizada en express y se expone en el puerto 3003


#### Build Docker 
- Para construir ejecutamos lo siguiente:
```
    docker build -t ms-frontend:1.0 frontend
    docker build -t ms-products:1.0 products
    docker build -t ms-merchandise:1.0 merchandise
    docker build -t ms-shopping-cart:1.0 shopping-cart
```
#### Prueba Local
    cd micro-service-name 
    npm install
    npm run
    

#### Iniciar los contenedores 
    docker run -d -p 3000:3000 \
    -e PRODUCTS_SERVICE=host.docker.internal \
    -e SHOPPING_CART_SERVICE=host.docker.internal \
    -e MERCHANDISE_SERVICE=host.docker.internal \
    ms-frontend:1.0

    docker run -d -p 3001:3001 ms-products:1.0
    docker run -d -p 3002:3002 ms-shopping-cart:1.0
    docker run -d -p 3003:3003 ms-merchandise:1.0

## **Arquitectura del Cluster:**
Dentro del cluster se proponen dos **entornos**: uno no productivo (**dev**) y uno productivo (**prod**). Cada entorno debe ser creado y administrado de forma independiente 

Los servicios se van a administrar a partir de manifiestos para desplegar las aplicaciones en kubernetes. 

- Pueden aprovisionar usando minikube,  k3s ó killercoda

<p align="center"><img src="./assets/minikube.jpeg" width="400"/></p>

> Si la opcion es usar EC2 
### Infra:
- Aprovisionar 2 servidores AWS EC2 con Terraform (server-dev, server-prd)
- Crear los ficheros de terraform + userdata (docker+docker-compose)

## **CICD**
Como plataforma para versionar el código e implementar el CI/CD pipeline se va a utilizar alguna de las siguientes opciones: 
- **Jenkins**
- **Github Actions**
- **Gitlab**

> Siguiendo la estrategia de branching por entornos.

## **CICD:**
Se debe configurar un CI/CD pipeline que implemente las siguientes stages básicos:
- Build de la imágen de Dockerfile
- Push de la imágen a DockerHub
- Controlar la version de la aplicacion
- Deploy de la aplicación en algunas de estas opciones:
    - Minikube
    - EC2 (docker-docker-compose)
    - EC2 + k3s

Luego agregar:
- Stage de aprobación manual antes del deploy cuando el entorno al que se va a deployar es producción
- Notificación del resultado del pipeline por Slack/Telegram

<p align="center"><img src="./assets/cicd.png" width="400"/></p>

## **Arquitectura:**
Realizar un diseño gráfico de las herramientas y servicios que utilizarían si implementaran esta solución en una Cloud (AWS, GCP, Azure, etcétera).

## **Observaciones y recomendaciones:**
- La arquitectura de la aplicación está formada por servicios backends y frontend los cuales deberían tener su propio repositorio.
- Se puede realizar un docker-compose para probar local la aplicación en su conjunto.
- Se puede deployar ingress para frontend, backend para poder utilizar una url configurada en */etc/hosts* ó usando wildcard DNS https://nip.io/ .
- Cada servicio debe tener su dockerfile.
- Documentación


## Resultado

![](docs/1.png)
![](docs/2.png)
![](docs/3.png)
![](docs/4.png)
![](docs/5.png)

> Busca los logros donde no hay límites by @roxsross

<p align="center"><img src="./assets/devopsFinal.png" width="400"/></p>
<p align="center"><img src="./assets/devopsFinal1.png" width="400"/></p>

## Contribuciones

Como siempre, cualquier contribución es bienvenida, simplemente forkeá este repo y enviame una PR.  

### ✉️  &nbsp;Contactos 

Me puedes encontrar en:

[![site](https://img.shields.io/badge/Hashnode-2962FF?style=for-the-badge&logo=hashnode&logoColor=white&link=https://blog.295devops.com) ](https://blog.295devops.com)
[![Blog](https://img.shields.io/badge/dev.to-0A0A0A?style=for-the-badge&logo=devdotto&logoColor=white&link=https://dev.to/roxsross)](https://dev.to/roxsross)
![Twitter](https://img.shields.io/twitter/follow/roxsross?style=for-the-badge)
[![Linkedin Badge](https://img.shields.io/badge/-LinkedIn-blue?style=for-the-badge&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/roxsross/)](https://www.linkedin.com/in/roxsross/)
[![Instagram Badge](https://img.shields.io/badge/-Instagram-purple?style=for-the-badge&logo=instagram&logoColor=white&link=https://www.instagram.com/roxsross)](https://www.instagram.com/roxsross/)
[![Youtube Badge](https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white&link=https://www.youtube.com/channel/UCa-FcaB75ZtqWd1YCWW6INQ)](https://www.youtube.com/channel/UCa-FcaB75ZtqWd1YCWW6INQ)


<samp>
"Para entender algo no debes entenderlo sino serlo"
<samp>
  </div>
  
   [![Comprar](https://img.shields.io/badge/Buy_Me_A_Coffee-FFDD00?style=for-the-badge&logo=buy-me-a-coffee&logoColor=black&link=https://www.buymeacoffee.com/roxsross)](https://www.buymeacoffee.com/roxsross)
