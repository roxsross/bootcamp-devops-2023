# Jenkins en Minikube/killercoda

Este repositorio es un tutorial sobre cómo implementar Jenkins en un clúster local de Kubernetes utilizando Minikube.

## Requisitos
- minikube
- Helm 3

## Instalación de Jenkins


### Helm Chart

```sh
helm repo add jenkins https://charts.jenkins.io
helm repo update
```

### Obtener los valores predeterminados Helm (optional)

```sh
helm show values jenkins/jenkins > values.yaml
```

### Instalar Jenkins con Helm
 
Vamos a construir nuestra propia imagen personalizada de Jenkins con los complementos que necesitamos.


```sh
docker build -t <docker url>/jenkins .
docker push <docker url>/jenkins
```
Crear un secreto para docker

```sh
kubectl create secret docker-registry registry --docker-server='<Docker registry URL here>' --docker-username='<docker registry username>' --docker-password='<password here>' --docker-email='<docker registry email>'
```

Asegúrate de que Minikube tenga el controlador de ingress [Nginx habilitado], si no lo está

```sh
minikube addons enable ingress
```

Asegúrate de que tu imagen docker, previamente construida se actualice en el archivo de values de helm

```
  componentName: "jenkins-controller"
  image: roxsross12/jenkins #imagen personalizada
  tag: "1.0.0"
  imagePullPolicy: "Always"
  imagePullSecretName: registry
```
### Importante [Si usan Killercoda ]

deben modificar el service a NodePort

```
serviceType: ClusterIP # cambiar a NodePort
```

```sh
kubectl create namespace jenkins
helm install jenkins jenkins/jenkins -n jenkins -f values.yaml
```

### Revisamos 

```sh
kubectl get all -n jenkins

NAME            READY   STATUS    RESTARTS   AGE
pod/jenkins-0   2/2     Running   0          2m36s

NAME                    TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
service/jenkins         NodePort    10.105.138.113   <none>        8080:30660/TCP   2m36s
service/jenkins-agent   ClusterIP   10.98.29.74      <none>        50000/TCP        2m36s

NAME                       READY   AGE
statefulset.apps/jenkins   1/1     2m36s

```

### Acceder a Jenkins

Puedes acceder a Jenkins mediante port forwarding del servicio de Jenkins

```sh
kubectl port-forward svc/jenkins 8080:8080
```
>http://localhost:8080/jenkins


Una vez en la página de inicio de sesión, obtén la contraseña de administrador con el siguiente comando

```sh
kubectl exec --namespace jenkins -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/additional/chart-admin-password && echo
```
```
kubectl exec --namespace jenkins -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/additional/chart-admin-password && echo
YKGMFdmFD6AO0dgeFlxVMR

```
