/* global __dirname */
var express = require('express');
var app = express();

//static files
app.use(express.static(__dirname + '/public', { maxAge: 0 }));


app.get('/', function(req, res) {
    res.sendFile(__dirname + '/index.html');
});


app.listen(4000, function() {
    console.log('Example app listening on port 4000!');
});