# 295topics-backend

## Probando Local

Esta aplicación tiene una dependencia directa con MongoDB. Para ejecutarla localmente de forma predeterminada, la aplicación espera que MongoDB esté escuchando en el puerto 27017.

Se conectará a la base de datos TopicstoreDb en el servidor MongoDB y trabajará con la colección Topics.

Es importante mencionar que la cadena de conexión predeterminada es mongodb://localhost:27017, la cual se puede anular utilizando variables de entorno.

A continuación, se muestran las variables de entorno que podemos configurar:

```ini
DATABASE_URL=
DATABASE_NAME=
HOST=
PORT=
```

Ten en cuenta que `HOST` se establece de forma predeterminada en `localhost` y `PORT` en `5000`. Estos son los ajustes para determinar dónde está escuchando la aplicación HTTP. No es necesario cambiarlos.

Con la base de datos ejecutándose localmente, puedes verificar la aplicación ejecutando:

> NOTA: Si es la primera vez que la ejecutas, no habrá datos disponibles.

```bash
npm start
```

probando

```bash
curl http://localhost:5000/api/topics
```

Si deseas ingresar algunos datos, puedes intentar:

```bash
curl -d '{"Name":"Devops"}' -H "Content-Type: application/json" -X POST http://localhost:5000/api/topics
curl -d '{"Name":"K8s"}' -H "Content-Type: application/json" -X POST http://localhost:5000/api/topics
curl -d '{"Name":"Docker"}' -H "Content-Type: application/json" -X POST http://localhost:5000/api/topics
curl -d '{"Name":"Prometheus"}' -H "Content-Type: application/json" -X POST http://localhost:5000/api/topics
```
