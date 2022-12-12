require("rootpath")();
const express = require('express');
const app = express();

const usuariosDB = require("../datasource/usuariosDB.js");


app.get('/', getAll);

app.get('/:nickname', getBynickname);

app.post('/', create);

app.put('/:nickname', update);

app.delete('/del/:nickname', eliminar);

app.delete('/:idusuario', eliminacionlogica);

// Metododo para listar todas las personas 
function getAll(req, res) {
    usuariosDB.getAll(function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para buscar usuarios por nickname
function getBynickname(req, res) {
    usuariosDB.getBynickname(req.params.nickname,function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para agregar usuarios
function create(req, res) {
    usuariosDB.create(req.body, function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para modificar usuarios
function update(req, res) {
    usuariosDB.update(req.params.nickname, req.body, function (result) {
        if (result.code == 3) {
            res.status(500).send(err);
        } else if (result.code == 2) {
            res.status(404).json(result);
        } else {
            res.json(result);
        }
    });
}
// Metodo par eliminar fisicamente usuarios de la base de datos
function eliminar(req, res) {
    usuariosDB.delete(req.params.nickname,  function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            if (result.detail.affectedRows == 0) {
                res.status(404).json(result);
            } else {
                res.json(result);
            }
        }
    });
}
// Metodo par eliminar usuarios cambiando el estado a 0
function eliminacionlogica(req, res) {
    usuariosDB.logdelete(req.params.idusuario, function (result) {
        if (result.code == 3) {
            res.status(500).send(err);
        } else if (result.code == 2) {
                res.status(404).json(result);  
        } else if (result.code == 1) {      
            res.json(result);
        }
    });
}

module.exports = app;