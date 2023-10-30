# Vagrant by RoxsRoss

---
*Vagrant* es una herramienta o aplicación de líneas de comando utilizada en el sector IT, especialmente por desarrolladores. Permite la creación de entornos de desarrollo virtualizados que pueden ser reproducidos y compartidos de una forma muy fácil.

---
Usando virtualbox. Sin tener que instalar ningún binario en el host.


```
+------------------------------------------------------+
| Host (private_network_ip)                            |
|     +-----------------------------------+            |
|     | Vagrant box                       |            |
|     |    +------------------------------+            |
|     |    |                              |            |
|     |    |   +--------------------------+            |
|     |    |   |                          |
|     |    |   |                          |            |
|     |    |   |                          | <--+curl   |
|     |    |   |                          |     browser|
|     |    |   |                          |            |
|     |    |   |                          |            |
|     |    |   |                          |            |
|     |    |   |                          |            |
+-----+----+---+--------------------------+------------+
```


## Pre-requisitos

Vagrant (https://www.vagrantup.com/docs/installation/)
VirtualBox instalado https://www.virtualbox.org/


# Como usamos Vagrant

## comandos de Vagrant que te debes de aprender

`vagrant init`
Con este comando creas un archivo Vagrantfile vacío.

`vagrant init hashicorp/bionic64`
Si lo que quieres es crear un Vagrantfile apuntando a un box concreto, simplemente tienes que poner el nombre o la URL al final.

`vagrant up`
Arranca una máquina virtual. En el directorio tiene que haber un archivo Vagrantfile (lógicamente)

`vagrant suspend`
Guarda el estado de la máquina virtual y temporalmente cierra la máquina virtual. Si volvemos a ejecutar vagrant up la máquina virtual se restaurará rápidamente en el punto donde la dejamos.

`vagrant ssh`
Entras en la máquina virtual que tienes arrancada usando ssh. Vagrant usa automáticamente sus claves ssh y las copia en la máquina virtual, es por eso que no es necesario autenticarse con usuario y contraseña.

`vagrant provision`
Vuelve a ejecutar tu script de arranque (si lo has actualizado) sin tener que crear la máquina virtual desde cero.

`vagrant reload`
Resetea la máquina virtual a su estado inicial y vuelve a lanzar el script de arranque.

`vagrant destroy`
Borra la máquina y el disco virtual creado, aunque conserva el box de inicio.

