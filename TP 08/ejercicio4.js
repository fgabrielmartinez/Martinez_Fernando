const fs = require('fs');
const rawdata = fs.readFileSync('./personas.json', 'utf8');
var persona = JSON.parse(rawdata);
function getNombre (persona){
for (var i = 0; i < persona['personas'].length; i++) {
    aux = persona['personas'][i]['Localidad']
    if (aux == 'Posadas') {
        console.log(persona['personas'][i]['Nombre'] + " " + persona['personas'][i]['Apellido']);
    }
}}

getNombre(persona);