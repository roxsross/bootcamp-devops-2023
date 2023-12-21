# Configuración de GitLab y Jenkins  (Kubernetes)

Manifiestos de Kubernetes para implementación local a través de Minikube/killercoda/Otros, enfocándose en la integración de GitLab y Jenkins.

## 1. Prerrequisitos

Antes de comenzar, asegúrate de tener instalado el siguiente software en tu sistema:

- Git
- Docker
- Minikube (con kubectl)


### Comencemos con las configuraciones iniciales

En tu terminal...

```bash
minikube start --driver docker
```

Este código debería iniciar Minikube.

#### Primero, comienza a configurar e implementar GitLab

Ejecuta estos comandos paso a paso

```bash
kubectl create ns gitlab
```

```bash
kubectl apply -f gitlab-deployment.yaml -n gitlab
```

luego

```bash
kubectl apply -f gitlab-runner-deployment.yaml -n gitlab
```

Y finalmente

```bash
kubectl apply -f gitlab-service.yaml -n gitlab
```

Después de ejecutar estos comandos, espera un poco, luego puedes verificar si la implementación fue exitosa visitando la dirección local de GitLab. Para hacer esto, necesitas conocer la dirección IP de tu Minikube, que puedes obtener mediante este comando

```bash
minikube ip
```

Así que visita el resultado de este comando + NodePort del servicio de GitLab. Supongamos que el resultado del comando `minikube ip` es <alguna-dirección-ip> y el NodePort está en el código:

```yaml
ports:
    - name: http
      protocol: TCP
      port: 80
      targetPort: 80
      nodePort: 30100
```

En resultado, visita `<http://alguna-dirección-ip>:30100/`

#### Ahora es el turno de Jenkins

Recomiendo realizar una imagen personalizada que contenga kubectl, docker, helm etc
podrias usar

```bash
roxsross12/jenkins:1.0.0
```

Ejecuta estos comandos paso a paso

```bash
kubectl create ns jenkins
```

```bash
kubectl apply -f jenkins-persistentvolume.yaml -n jenkins
```

```bash
kubectl apply -f jenkins-persistentvolumeclaim.yaml -n jenkins
```

```bash
kubectl apply -f jenkins-deployment.yaml -n jenkins
```

```bash
kubectl apply -f jenkins-service.yaml -n jenkins
```

Y finalmente

```bash
kubectl create clusterrolebinding jenkins --clusterrole cluster-admin --serviceaccount=jenkins:default
```

Después de esperar un tiempo, puedes visitar la consola web como hicimos para GitLab anteriormente:

```yaml
      nodePort: 30200
```

```bash
http://<tu-ip-de-minikube>:30200
```

