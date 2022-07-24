const http = require('http');
const url = require('url');


let server = http.createServer((req, res) => {
    let urlParse = url.parse(req.url);
    let urlPath = urlParse.pathname;
    let method = req.method;

    switch(urlParse){
        case '/':{
            //Web Home
            break;
        };
        case '/register-user': {

            break;
        };
        case '/register-collaborator': {

            break;
        };
        case '/login': {

            break;
        };
        case '/admin/product-list': {
            
            break;
        };
        case '/collaborator-page': {

            break;
        };
        case '/user-products': {

        };
        case ''
    }
})
server.listen(8080, () => {
    console.log('Server is running on http://localhost:8080')
})