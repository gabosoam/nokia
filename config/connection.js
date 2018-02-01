﻿'use strict';
let mysql = require('mysql'),
    db_config = {
        host: 'localhost',
        user: 'root',
        password: '12345',
        database: 'nokia',
        port: '3306'
    },
    myConn = mysql.createConnection(db_config);

    myConn.connect(function(err){
      return (err)? console.log(`conexión fallida ${err.stack}`) : console.log(`conectado a la base de datos` );
    });

module.exports = myConn;
