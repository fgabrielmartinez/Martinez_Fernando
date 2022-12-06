'use strict';
let jsonData = require('./personas.json');
console.log(JSON.stringify(jsonData));
//  muestra el objeto personas.json como una cadena 
console.log(JSON.parse(jsonData));
//  da error porque espera una cadena para transformar en objeto y le entregamos un objeto