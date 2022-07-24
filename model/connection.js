const mysql = require('mysql');

class Connection{
    static createConnection(){
        let configToMySQL = {
            host: 'localhost',
            user: 'root',
            password: '123456aA@',
            database: 'db'
        }
        return mysql.createConnection(configToMySQL);
    }
}

module.exports = Connection;