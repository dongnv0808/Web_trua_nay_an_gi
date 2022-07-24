const http = require('http');
const fs = require('fs');
const url = require('url')
const qs = require('qs');
// const LoginController = require('./controller/login-controller.js')
const UserController = require('../Web_trua_nay_an_gi/controller/user-controller')

// let loginController = new LoginController();
let usercontroller = new UserController();

let server = http.createServer((req, res) => {
    let urlParse = url.parse(req.url);
    let urlPart = urlParse.pathname;
    let method = req.method;
    switch (urlPart) {
        case '/' :
            if(method == 'GET'){
                usercontroller.showLoginForm(req, res);
            }else {
                usercontroller.login(req, res);
            }
            break;
        case '/resister':
            if (method == 'GET'){
                usercontroller.showResisterForm(req, res);

            }else {
                usercontroller.createUser(req, res);
            }
            break;
    }
});

server.listen(8080, () => {
    console.log('server running is localhost:8080 ')
})
