//Módulos
const fetch = (...args) => import('node-fetch').then(({default: fetch}) => fetch(...args));
const express = require('express');
const fs = require('fs');

// Ruta al archivo package.json
const packageJsonPath = './package.json';

    app = express();

const LOCAL  = 'http://localhost:5000/api/topics';
const HOST = '0.0.0.0' || 'localhost';
const PORT = 3000;

app.set('view engine', 'ejs');

// Lee el contenido del archivo package.json
app.get('/getVersion', (req, res) => {
    fs.readFile(packageJsonPath, 'utf8', (err, data) => {
        if (err) {
            console.error(err);
            res.status(500).json({ error: 'Internal Server Error' });
            return;
        }

        const packageJson = JSON.parse(data);
        const version = packageJson.version;

        // Devuelve la versión como JSON
        res.json({ version });
    });
});

app.get('/', async (req, res) => {
    try {
        //Recuperar topics de la API
        const response = await fetch(process.env.API_URI || LOCAL);
        const topics = await response.json();

        res.render('index', { topics });
    } catch (error) {
        console.error('Error fetching topics:', error);
        res.status(500).send('Internal Server Error');
    }
});
app.listen(PORT, HOST)

console.log(`Server running on http://${HOST}:${PORT} with API_URI: ${process.env.API_URI || LOCAL}`);
