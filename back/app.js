var http = require("http");
var url = require("url");
var path = require("path");
var fs = require("fs");

http.createServer(function(req, res) {
    var pathname = url.parse(req.url).pathname;
    /*
    res.write(pathname);
    res.end();
    return;
    */
    var serverPath = path.join('../front/',pathname);
    
    if(pathname == '/'){
        res.writeHead(200,'OK');//{"Content-Type": "text/html"});
        fs.createReadStream('../front/index.html').pipe(res);
        return;
    }
    path.exists(serverPath, function(exists) {
        if(exists){
            var ext = path.extname(serverPath);
            ext = ext ? ext.slice(1):'unknow';
            
            res.writeHead(200,{"Content-Type": "text/plain"});
            var paths = pathname.split('/');
            if(paths.length > 0)
                res.write(paths[0]);

        }else{
            res.writeHead(404,{'Content-Type':'text/html'});
            fs.createReadStream('../front/404.html').pipe(res);
            console.log('Path not found : ' +  serverPath);
        }
    });
    /*
    res.writeHead(200,{"Content-Type": "text/plain"});
    res.write(serverPath);
    res.end();
    */
}).listen(process.env.PORT, process.env.IP);


function loadStream(res){
    res.write('abc');
    res.end();
}