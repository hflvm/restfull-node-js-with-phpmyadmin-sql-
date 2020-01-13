const mysql = require('mysql');
const express = require('express');
var app = express();
const bodyparser = require('body-parser');

app.use(bodyparser.json());

var mysqlConnection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'teriaq_node',
    multipleStatements: true
});

mysqlConnection.connect((err) => {
    if (!err)
        console.log('DB connection succeded.');
    else
        console.log('DB connection failed \n Error : ' + JSON.stringify(err, undefined, 2));
});


const port = process.env.PORT || 8086;
app.listen(port , ()=>console.log(`listening on port ${port}`));

//Get all doctors
app.get('/api/doctors', (req, res) => {
    mysqlConnection.query('SELECT * FROM doctor', (err, rows, fields) => {
        if (!err)
            res.send(rows);
        else
            console.log(err);
    })
});

//Get an doctors
app.get('/api/doctors/:id', (req, res) => {
    mysqlConnection.query('SELECT * FROM doctor WHERE DocID = ?', [req.params.id], (err, rows, fields) => {
        if (!err)
            res.send(rows);
        else
            console.log(err);
    })
});

//Insert an doctors
app.post('/api/doctors', (req, res) => {
    let doc = req.body;
    var sql = "INSERT INTO doctor(DocUsername,DocPassword,DocEmail,DocPhone,DocAddress,DocIDCard,DocFullName,Your_specialty_id) VALUES ?";
var values =[[doc.DocUsername,doc.DocPassword,doc.DocEmail,
doc.DocPhone,doc.DocAddress,doc.DocIDCard,doc.DocFullName,
doc.Your_specialty_id]];
    mysqlConnection.query(sql, [values], (err, rows, fields) => {
        if (!err)
                res.send('Inserted doctor id : ');

        else
            console.log(err);
    })
});

//Update an doctors
app.put('/api/doctors/:id', (req, res) => {
    let doc = req.body;
    var sql = "UPDATE doctor SET DocUsername = ?,DocPassword = ?,DocEmail = ?,DocPhone = ?,DocAddress = ?,DocIDCard = ?,DocFullName = ?,Your_specialty_id = ? WHERE DocID = ?";

    mysqlConnection.query(sql, [doc.DocUsername,doc.DocPassword,doc.DocEmail,
    doc.DocPhone,doc.DocAddress,doc.DocIDCard,doc.DocFullName,
    doc.Your_specialty_id,req.params.id], (err, rows, fields) => {
        if (!err)
            res.send('Updated successfully');
        else
            console.log(err);
    })
});

//Delete an doctors
app.delete('/api/doctors/:id', (req, res) => {
    mysqlConnection.query('DELETE FROM doctor WHERE DocID = ?', [req.params.id], (err, rows, fields) => {
        if (!err)
            res.send('Deleted successfully.');
        else
            console.log(err);
    })
});

// الحمد لله
