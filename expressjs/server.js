var express = require('express');
var path    = require('path');
var app     = express();

// Set the template engine
app.set('views','./views');
app.set('view engine','jade');
app.engine('jade', require('jade').__express);

// Routes
var context_path = 'my-app';
var hello_path   = path.join(context_path + "hello.txt");


app.get("/" + hello_path, function(req, res){
  res.send('Hello World');
});

app.get('/', function (req, res) {
  res.render('index', { title: 'Hey', message: 'Hello there!'});
});

var server = app.listen(3000, function() {
    console.log('Listening on port %d', server.address().port);
});
