const mysql = require('mysql');

class Connection {
    static createConnection () {
        let configToMySQL = {
            host: 'localhost',
            user: 'root',
            password: '257946',
            database: 'module3'
        };
        return mysql.createConnection(configToMySQL);
    }
};
module.exports = Connection;
