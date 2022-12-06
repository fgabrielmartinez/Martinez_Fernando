const fs = require('fs');
const rawdata = fs.readFileSync('./departamentos.json', 'utf8');
var depto = JSON.parse(rawdata);
function getNombre(depto) {
    for (var i = 0; i < depto['Tecnología'].length; i++) {
        console.log(depto['Tecnología'][i]['nombre'] + " " + depto['Tecnología'][i]['puesto']);
    }
}

getNombre(depto);