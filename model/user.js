let Connection = require('../model/connection');
const {combine} = require("qs/lib/utils");
const qs = require('qs');
const fs = require('fs');

class User {
    ID;
    Name;
    Password;
    Email;
    Phone;

    constructor() {
        this.connection = Connection.createConnection();
        this.connection.connect((err) => {
            if (err) {
                console.log(err)
            }else {
                console.log('connect success!')
            }
        });
    }

    get ID() {
        return this._ID;
    }

    set ID(value) {
        this._ID = value;
    }

    get Name() {
        return this._Name;
    }

    set Name(value) {
        this._Name = value;
    }

    get Password() {
        return this._Password;
    }

    set Password(value) {
        this._Password = value;
    }

    get Email() {
        return this._Email;
    }

    set Email(value) {
        this._Email = value;
    }

    get Phone() {
        return this._Phone;
    }

    set Phone(value) {
        this._Phone = value;
    }
    getUser() {
        return new Promise((resolve, reject) => {
            this.connection.query('select * from users', (err, data) => {
                if(err) {
                    return reject (err)
                }else {
                    return resolve (data)
                }
            });
        });
    }

    createUser(user) {
        let insertQuery = `insert into users (name, password, email, phone) VALUES
                                                                                ('${user.name}', '${user.password}', '${user.email}', '${user.phone}');`
        this.connection.query(insertQuery, (err, data) => {
            if (err) {
                console.log('create error: ' + err)
            }else {
                console.log('create success!')
            }
        })
    }
};
module.exports = User;
