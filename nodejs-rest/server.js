// Required Libraries
var Logger  = require('bunyan');
var restify = require('restify');

// Create the Logger
var log = new Logger({
  name: 'my-app-logger',
  streams: [
    {
      stream: process.stdout,
      level:  'debug'
    },
    {
      path:  'my-app.log',
      level: 'trace'
    }
  ],
  serializers: {
    req: Logger.stdSerializers.req
    //res: restify.bunyan.serializers.response,
  }
});

// Create the Server
log.info("Starting Server");
var server = restify.createServer({
  name: 'my-app',         // name of your app
  log:  log               // pass in a bunyan logger instance, the logger is part of the request object
});

// Handlers
server.get('/hello/:name',

  // Response
  function(req,res,next)
  {
    req.log.debug("Starting Server");

    // Do some stuff with the appropriate model
    // TODO: Recommend injecting the logger into the model
    var my_model = require("./lib/model/test");
    var test     = my_model.do_stuff();

    // Send the response
    res.send('hello ' + test);
    next();
  }
);

// respond is typically a custom anonymous function specific to the handler
//server.head('/hello/:name',respond);

server.listen(8080);



