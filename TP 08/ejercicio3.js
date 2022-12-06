'use strict';
const fs = require('fs');
fs.readFile('personas.json', (err, data) => {
if (err) throw err;
console.log(JSON.stringify(data));
});
// me devuelve una serie de numeros//
console.log(data);
// ReferenceError: data is not defined