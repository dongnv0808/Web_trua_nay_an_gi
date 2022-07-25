const User = require('../model/user');
const qs = require('qs');
const fs = require('fs');

class UserController {
    constructor() {
        this.user = new User();
    }
    //show form đăng nhập
    showLoginForm (req, res) {
        fs.readFile('views/login.html', 'utf-8', (err, data) => {
            if (err) {
                console.log(err);
            }else {
                res.writeHead(200, {'Content-Type': 'text/html'});
                res.write(data);
                return res.end();
            }
        })
    };
    //lấy dữ liệu nhập vào để đối chiếu với database
    login(req, res) {
        let success = false;
        let data = '';
        req.on('data', chuck => {
            data += chuck
        });
        req.on('end', async () => {
            let userInfo = qs.parse(data);
            let dataUser = await this.user.getUser();
            // console.log('dataUser: ' + dataUser)
            for (let user of dataUser) {
                if (userInfo.email == user.email && userInfo.password == user.password) {
                    console.log('Đăng nhập thành công!');
                    success = true;
                }
            }
            if (success = false){
                console.log('tài khoản không tồn tại!')
            }

        })
    };

    //show form đăng kí
    showResisterForm(req, res) {
        fs.readFile('views/resister.html', 'utf-8', (err, data) => {
            if (err) {
                console.log(err);
            }else {
                res.writeHead(200, {'Content-Type': 'text/html'});
                res.write(data);
                return res.end();
            }
        })
    }

    createUser(req, res) {
        let success = true;
        let data = '';
        req.on('data', (chuck) => {
            data += chuck;
        });
        req.on('end', () => {
            let user = qs.parse(data);
            let regexPassword = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/;
            if (!regexPassword.test(user.password)){
                console.log('Mật khẩu phải có hơn 8 kí tự và ít nhất 1 số!');
            }else {
                if(user.password != user.passwordConfirm){
                    console.log('Mật khẩu xác nhận không đúng!');
                }else {
                    let dataUser = this.user.getUser();
                    for (let userCheck of dataUser) {
                        if(user.email == userCheck.email) {
                            console.log('email đã tồn tại!')
                            success = false;
                        }else if (user.phone == userCheck.phone) {
                            console.log('Số điện thoại đã tồn tại')
                            success = false;
                        }
                    };
                    if (success = true) {
                        this.user.createUser(user);
                        res.writeHead(301, {
                            location: '/resister'
                        });
                        return res.end();
                    }
                }
            }
        })
    }

}
module.exports = UserController;