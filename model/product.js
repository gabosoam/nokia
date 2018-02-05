var connection = require('../config/connection.js');


module.exports = {

    read: function (callback) {
        connection.query('SELECT  * FROM  v_product', function (error, results, fields) {
            if (error) {

                callback('error en la consulta: ' + error, null);
            } else {
              
                callback(null, results);

            }
        });
    },

    searchBarcode: function (barcode,callback) {
        connection.query('SELECT  id FROM product WHERE barcode=?;',barcode, function (error, results, fields) {
            if (error) {
                callback(error, null);
            } else {
            
                if (results.length==0) {
                    callback(false);
                } else {
                    callback(true);
                }

            }
        });
    },

    updateFromBill: function (data, cb) {
        connection.query({
            sql: 'UPDATE `product` SET `location`=?, `observation`=? WHERE (`id`=?)',
            values: [data.idlocation, data.observation.toUpperCase(), data.id]
        }, function (err, results, fields) {
            if (err) {
    
                cb(err, null);
            } else {
                cb(null, results)
            }
        })

    },

    readBill: function (bill, callback) {
        connection.query('Select * from billdetail where id=?', bill, function (error, results, fields) {
            if (error) {
                console.log(error)
                callback('error en la consulta: ' + error, null);
            } else {
                console.log(results)
                callback(null, results);

            }
        });
    },

    readBillPrice: function (bill, callback) {
        connection.query('CALL p_billprice(?)', bill, function (error, results, fields) {
            if (error) {

                callback('error en la consulta: ' + error, null);
            } else {
                callback(null, results[0]);

            }
        });
    },

    update: function (datos, callback) {
     
        connection.query('UPDATE product SET barcode=?,model=? WHERE (id=?) LIMIT 1', [datos.barcode.toUpperCase(), datos.code, datos.id], function (error, results, fields) {//
            if (error) {
                console.log(error)
                callback('error en la consulta: ' + error, null);
            } else {
                callback(null, results);

            }
        });
    },


    delete: function (datos, callback) {
        connection.query('DELETE FROM product WHERE id=?', [datos.id], function (error, results, fields) {//
            if (error) {
                callback('error en la consulta: ' + error, null);
            } else {
                callback(null, results);

            }
        });
    },
    create: function (datos, callback) {
        connection.query('INSERT INTO product (barcode,model) VALUES (?,?)', [datos.barcode.toUpperCase(), datos.code], function (error, results, fields) {
            if (error) {

                callback(error, null)
            } else {
                callback(null, results)
            }
        });
    },

  
}


