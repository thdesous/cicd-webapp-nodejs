var express = require('express');
var app = express();
var exports = module.exports = {};

function welcomeMessage(){
    var message = "Hello World";
    return message;
}

// set the view engine to ejs
app.set('view engine', 'ejs');

app.get('/', function (req, res) {
    // var message = "Hello World";
    res.render("index", {message: welcomeMessage()});
});

var server = app.listen(3000, function () {
    console.log("Node server is running on http://localhost:3000");
});

module.exports = server;
module.exports.welcomeMessage = welcomeMessage;