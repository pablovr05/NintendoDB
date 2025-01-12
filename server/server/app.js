const express = require('express');
const path = require('path');
const fs = require('fs').promises;
const app = express();
const port = 3000;

const filePath0 = path.join(__dirname, 'data', 'consoles.json');
const filePath1 = path.join(__dirname, 'data', 'jocs.json');
const filePath2 = path.join(__dirname, 'data', 'personatges.json');

// Verificar si el archivo existe
try {
    fs.access(filePath0);
    console.log('El archivo jocs.json fue detectado.');
} catch (err) {
    console.error('El archivo no fue detectado:', err);
}

// Verificar si el archivo existe
try {
    fs.access(filePath1);
    console.log('El archivo jocs.json fue detectado.');
} catch (err) {
    console.error('El archivo no fue detectado:', err);
}

// Verificar si el archivo existe
try {
    fs.access(filePath2);
    console.log('El archivo jocs.json fue detectado.');
} catch (err) {
    console.error('El archivo no fue detectado:', err);
}

app.use(express.static('public'));

app.get('/', async (req, res) => {
    res.send(`Hello World /`);
});

app.post('/api/consoles', async (req, res) => {
    try {
        // Leer el archivo jocs.json
        const data = await fs.readFile(filePath0, 'utf8');
        const jsonData = JSON.parse(data); // Convertir a objeto JSON
        res.json(jsonData); // Enviar JSON como respuesta
    } catch (error) {
        console.error('Error leyendo el archivo consoles.json:', error);
        res.status(500).send({ error: 'No se pudo leer el archivo consoles.json' });
    }
});

app.post('/api/jocs', async (req, res) => {
    try {
        // Usar la ruta absoluta para leer el archivo
        const data = await fs.readFile(filePath1, 'utf8');
        const jsonData = JSON.parse(data); // Convertir a objeto JSON
        res.json(jsonData); // Enviar JSON como respuesta
    } catch (error) {
        console.error('Error leyendo el archivo jocs.json:', error);
        res.status(500).send({ error: 'No se pudo leer el archivo jocs.json' });
    }
});

app.post('/api/personatges', async (req, res) => {
    try {
        // Leer el archivo jocs.json
        const data = await fs.readFile(filePath2, 'utf8');
        const jsonData = JSON.parse(data); // Convertir a objeto JSON
        res.json(jsonData); // Enviar JSON como respuesta
    } catch (error) {
        console.error('Error leyendo el archivo personatges.json:', error);
        res.status(500).send({ error: 'No se pudo leer el archivo personatges.json' });
    }
});

app.post('/images/:imageName', async (req, res) => {
    try {
        const imagePath = `images/${req.params.imageName}`;
        res.sendFile(imagePath, { root: __dirname }, (err) => {
            if (err) {
                console.error('Error enviando la imagen:', err);
                res.status(404).send({ error: 'Imagen no encontrada' });
            }
        });
    } catch (error) {
        console.error('Error procesando la solicitud de imagen:', error);
        res.status(500).send({ error: 'Error interno del servidor' });
    }
});

const httpServer = app.listen(port, appListen);
function appListen() {
    console.log(`Example app listening on: http://localhost:${port}`);
}

process.on('SIGTERM', shutDown);
process.on('SIGINT', shutDown);
function shutDown() {
    console.log('Received kill signal, shutting down gracefully');
    httpServer.close();
    process.exit(0);
}
