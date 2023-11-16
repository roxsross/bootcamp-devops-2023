// mongo-script.js

const dbName = 'TopicstoreDb';
const collectionName = 'Topics';
const db = db.getSiblingDB(dbName);

db.createCollection(collectionName);
db[collectionName].insertMany([
    { "Name": "Desplegando el Futuro: Innovación Continua con Docker y DevOps" },
    { "Name": "Navegando en la Ola de la Innovación: Estrategias Docker y Prácticas DevOps" },
    { "Name": "Construyendo Puentes hacia el Mañana: Innovación en la Nube con Docker y DevOps" },
    { "Name": "DevOps en Acción: Transformando Ideas en Innovación con Docker" },
    { "Name": "Dockerizando el Camino hacia la Eficiencia: Innovación Impulsada por DevOps" },
    { "Name": "Reimaginando el Desarrollo: Historias de Éxito en Innovación con Docker y DevOps" },
    { "Name": "Más Allá de los Límites: Explorando la Innovación a través de Docker y Prácticas DevOps" },
    { "Name": "Innovación en el Ciclo de Vida del Software: Una Odisea con Docker y DevOps" },
    { "Name": "Empoderando la Innovación: Estrategias Contemporáneas con Docker y DevOps" }
]);
