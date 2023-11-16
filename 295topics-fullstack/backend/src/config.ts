if (process.env.NODE_ENV === 'development') {
    require('dotenv').config;
}
// Manejo de la señal SIGTERM
process.on('SIGTERM', () => {
    console.log('Received SIGTERM. Gracefully shutting down...');
    process.exit(0);
});

export default {
    database: {
        url: process.env.DATABASE_URL || 'mongodb://localhost:27017',
        name: process.env.DATABASE_NAME || 'TopicstoreDb'
    },
    app: {
        host: process.env.HOST || 'localhost',
        port: +process.env.PORT || 5000
    }
}