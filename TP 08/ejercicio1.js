const fs = require('fs');
let rawdata = fs.readFileSync('./personas.json');
console.log(JSON.stringify(rawdata));

// me devuelve una serie de numeros//
//const fs = require('fs');
let rawdata2 = fs.readFileSync('./personas.json');
console.log(JSON.parse(rawdata2));

// me devuelve el objeto personas.json con sus valores//