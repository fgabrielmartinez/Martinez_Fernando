-- 1. Agregar las entidades paises (id, nombre), provincias (id, nombre, idpais) y localidades (id,nombre, cp,id_provincia). Tener en cuenta que: ● En un país hay muchas provincias. ● En una provincia hay muchas localidades.
CREATE TABLE paises (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL
) ;
CREATE TABLE provincias (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
idpais INT UNSIGNED NOT NULL,
FOREIGN KEY (idpais) REFERENCES paises(id)
) ;
CREATE TABLE localidades (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
cp INT UNSIGNED NOT NULL,
id_provincia INT UNSIGNED NOT NULL,
FOREIGN KEY (id_provincia) REFERENCES provincias(id)
);
-- 2. Modificar la tabla empleados usando ALTER TABLE y agregar los campos: ● direccion (varchar) ● id_localidad (pk localidad) –Esta es un relación con la tabla localidades ● email ● telefono ● fecha_ingreso ● tms (timestamp).
ALTER TABLE empleados 
ADD ( direccion VARCHAR(30) NOT NULL,
id_localidad INT UNSIGNED NOT NULL,
email VARCHAR(30) NOT NULL,
telefono VARCHAR(30) NOT NULL,
fecha_ingreso DATE NOT NULL,
tms timestamp  not null,
FOREIGN KEY (id_localidad) REFERENCES localidades(id)
);
-- 3. Modificar la tabla de departamentos usando ALTER TABLE y agregar los campos: ● gasto (double) ● tms (timestamp);
ALTER TABLE departamentos
ADD(
gasto double not null,
tms timestamp );
-- 4. Insertar 5 registros en cada tabla de: paises, provincias, localidades, departamentos, empleados.
INSERT INTO paises(id,nombre) VALUES ('1', 'Argentina');
INSERT INTO paises(id,nombre) VALUES ('2', 'Brasil');
INSERT INTO paises(id,nombre) VALUES ('3', 'Paraguay');
INSERT INTO paises(id,nombre) VALUES ('4', 'Bolivia');
INSERT INTO paises(id,nombre) VALUES ('5', 'Ecuador');
INSERT INTO provincias(id,nombre,idpais) VALUES ('1', 'Misiones','1');
INSERT INTO provincias(id,nombre,idpais) VALUES ('2', 'Corrientes','1');
INSERT INTO provincias(id,nombre,idpais) VALUES ('3', 'Chaco','1');
INSERT INTO provincias(id,nombre,idpais) VALUES ('4', 'Formosa','3');
INSERT INTO provincias(id,nombre,idpais) VALUES ('5', 'Salta','5');
INSERT INTO localidades(id,nombre,cp,id_provincia) VALUES ('1', 'Alem','3315','1');
INSERT INTO localidades(id,nombre,cp,id_provincia) VALUES ('2', 'Posadas','3300','2');
INSERT INTO localidades(id,nombre,cp,id_provincia) VALUES ('3', 'Garupá','3304','3');
INSERT INTO localidades(id,nombre,cp,id_provincia) VALUES ('4', 'Apóstoles','3350','4');
INSERT INTO localidades(id,nombre,cp,id_provincia) VALUES ('5', 'Oberá','3360','5');
INSERT INTO departamentos(iddepartamento,nombre,presupuesto,estado,gasto,tms) VALUES ('9', 'Marketing','10000','1','1000','2022-10-26 20:44:00');
INSERT INTO departamentos(iddepartamento,nombre,presupuesto,estado,gasto,tms) VALUES ('10', 'Mantenimiento','15000','1','2000','2022-10-10 16:52:00');
INSERT INTO departamentos(iddepartamento,nombre,presupuesto,estado,gasto,tms) VALUES ('11', 'Jurídico','20000','1','3000','2022-11-26 21:44:00');
INSERT INTO departamentos(iddepartamento,nombre,presupuesto,estado,gasto,tms) VALUES ('12', 'Ventas','80000','0','4000','2021-10-11 07:42:00');
INSERT INTO departamentos(iddepartamento,nombre,presupuesto,estado,gasto,tms) VALUES ('13', 'Maestranza','5000','1','1500','2020-05-23 08:30:00');
INSERT INTO empleados(idemplaedo,cuil_cuit,nombre,apellido,id_departamento,estado,direccion,id_localidad,email,telefono,fecha_ingreso,tms) VALUES ('1','24-71651565-3', 'Mariel','Machado','10','1','America 1084','1','mariel@gmail.com','3754455555','2008-05-10','2022-10-26 20:44:00');
INSERT INTO empleados(idemplaedo,cuil_cuit,nombre,apellido,id_departamento,estado,direccion,id_localidad,email,telefono,fecha_ingreso,tms) VALUES ('2','23-65651565-3', 'Adriana','Morales','11','1','Suipacha 2284','1','Adriana@gmail.com','3754436554','2009-05-10','2022-11-26 20:44:00');
INSERT INTO empleados(idemplaedo,cuil_cuit,nombre,apellido,id_departamento,estado,direccion,id_localidad,email,telefono,fecha_ingreso,tms) VALUES ('3','23-65656465-3', 'Jorge','Lopez','12','1','Belgrano 5654','1','Jorge@gmail.com','3754436666','2008-05-20','2022-11-26 20:35:00');
INSERT INTO empleados(idemplaedo,cuil_cuit,nombre,apellido,id_departamento,estado,direccion,id_localidad,email,telefono,fecha_ingreso,tms) VALUES ('4','23-62146465-3', 'Luis','Do Santos','13','1','Junin 3563','2','Luis@gmail.com','3754436888','2008-05-21','2021-11-26 20:35:00');
INSERT INTO empleados(idemplaedo,cuil_cuit,nombre,apellido,id_departamento,estado,direccion,id_localidad,email,telefono,fecha_ingreso,tms) VALUES ('5','23-78946465-3', 'Pedro','Perez','9','1','Ayacucho 1223','2','Pedro@gmail.com','3755536888','2010-05-21','2021-01-26 20:13:00');
-- 5. Modificar el nombre de la tabla “pedidos” por “movimientos”. RENAME TABLE
RENAME TABLE pedidos  TO movimientos;
-- 6. Agregar las entidades: ● Productos (id, nombre, descripcion, id_marca fk, stock, precio, estado, tms) ● Marcas (id, nombre, descripción, imagen, id_proveedor, estado, tms) ● Proveedores (id, razon_social, nombre, apellido, naturaleza (fisica o juridica), cuit,id_localidad fk, estado,tms) ● Cajas (id,horainicio(datatime),horacierre(datatime), estado, tms) Notas: Muchos productos tienen una sola marca, o una marca tiene uno o muchos productos. Un proveedor está en una localidad.
CREATE TABLE marcas (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
descripcion VARCHAR(100) NOT NULL,
imagen VARCHAR(100) NOT NULL,
id_proveedor INT UNSIGNED NOT NULL,
estado BOOLEAN,
tms timestamp  not null
);
CREATE TABLE productos (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
descripcion VARCHAR(100) NOT NULL,
id_marca INT UNSIGNED NOT NULL,
FOREIGN KEY (id_marca) REFERENCES marcas(id),
stock INT  NOT NULL,
precio double not null,
estado BOOLEAN,
tms timestamp  not null
);
CREATE TABLE proveedores (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
razon_social VARCHAR(100) NOT NULL,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,
naturaleza VARCHAR(100) NOT NULL,
cuit VARCHAR(20) NOT NULL,
id_localidad INT UNSIGNED NOT NULL,
FOREIGN KEY (id_localidad) REFERENCES localidades(id),
estado BOOLEAN,
tms timestamp  not null
);
CREATE TABLE cajas (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
horainicio DATETIME,
horacierre DATETIME,
estado BOOLEAN,
tms timestamp  not null
);
-- 7. Insertar 5 registros en cada tabla del punto 6. Tener en cuenta que el script debe ejecutarse secuencialmente y no fallar.
INSERT INTO proveedores(id,razon_social,nombre,apellido,naturaleza,cuit,id_localidad,estado,tms) VALUES ('1','BremenSA', 'Cacho','Barbaro','fisica','23-35455462-9','1','1','2022-10-06 20:15:00');
INSERT INTO proveedores(id,razon_social,nombre,apellido,naturaleza,cuit,id_localidad,estado,tms) VALUES ('2','JuangonzalesSA', 'Juan','Gonzales','fisica','23-35666662-9','1','2','2022-05-06 20:13:00');
INSERT INTO proveedores(id,razon_social,nombre,apellido,naturaleza,cuit,id_localidad,estado,tms) VALUES ('3','ErnestoNiveiroSA', 'Ernesto','Niveiro','juridica','23-36554442-9','1','3','2021-05-03 20:22:00');
INSERT INTO proveedores(id,razon_social,nombre,apellido,naturaleza,cuit,id_localidad,estado,tms) VALUES ('4','JuanNavarroSA', 'Juan','Navarro','fisica','23-45556662-9','1','1','2020-08-06 21:13:00');
INSERT INTO proveedores(id,razon_social,nombre,apellido,naturaleza,cuit,id_localidad,estado,tms) VALUES ('5','DistribuidorSI', 'Pedro','Corrales','fisica','23-35124516-9','1','4','2021-02-09 10:18:00');
INSERT INTO marcas(id,nombre,descripcion,imagen,id_proveedor,estado,tms) VALUES ('1','Bremen', 'Mayorista','verde','1','1','2021-10-26 05:42:00');
INSERT INTO marcas(id,nombre,descripcion,imagen,id_proveedor,estado,tms) VALUES ('2','Bahco', 'Minorista','rojo','2','1','2022-11-13 07:48:00');
INSERT INTO marcas(id,nombre,descripcion,imagen,id_proveedor,estado,tms) VALUES ('3','Himpa', 'Mayorista','amarillo','3','1','2020-11-22 08:42:00');
INSERT INTO marcas(id,nombre,descripcion,imagen,id_proveedor,estado,tms) VALUES ('4','tramontina', 'minorista','azul','4','1','2022-11-05 09:42:00');
INSERT INTO marcas(id,nombre,descripcion,imagen,id_proveedor,estado,tms) VALUES ('5','huskwarna', 'Mayorista','gris','2','1','2020-10-22 13:42:00');
INSERT INTO productos(id,nombre,descripcion,id_marca,stock,precio,estado,tms) VALUES ('1','Clavo', 'clavo1','1','100','5.8','1','2022-10-26 20:44:00');
INSERT INTO productos(id,nombre,descripcion,id_marca,stock,precio,estado,tms) VALUES ('2','Tornillo', 'philips','1','200','8','1','2022-11-26 21:44:00');
INSERT INTO productos(id,nombre,descripcion,id_marca,stock,precio,estado,tms) VALUES ('3','Remache', 'remache1','1','150','3.2','1','2021-10-26 20:33:00');
INSERT INTO productos(id,nombre,descripcion,id_marca,stock,precio,estado,tms) VALUES ('4','Bisagra', 'bisagra2','2','20','45','1','2020-10-26 13:44:00');
INSERT INTO productos(id,nombre,descripcion,id_marca,stock,precio,estado,tms) VALUES ('5','Picaporte', 'biselado','2','15','150','1','2021-6-16 10:55:00');
INSERT INTO cajas(id,horainicio,horacierre,estado,tms) VALUES ('1','2022-10-26 05:42:00', '2022-10-26 17:15:00','1','2022-10-26 17:15:00');
INSERT INTO cajas(id,horainicio,horacierre,estado,tms) VALUES ('2','2022-10-27 05:35:00', '2022-10-27 17:19:00','1','2022-10-27 17:19:00');
INSERT INTO cajas(id,horainicio,horacierre,estado,tms) VALUES ('3','2022-10-28 05:38:00', '2022-10-28 17:16:00','1','2022-10-28 17:16:00');
INSERT INTO cajas(id,horainicio,horacierre,estado,tms) VALUES ('4','2022-10-29 05:39:00', '2022-10-29 17:25:00','1','2022-10-29 17:25:00');
INSERT INTO cajas(id,horainicio,horacierre,estado,tms) VALUES ('5','2022-10-30 05:40:00', '2022-10-30 17:30:00','1','2022-10-30 17:30:00');
-- 8. Listar el nombre, presupuesto, gastos y diferencia(presupuesto-gasto) de todos los departamentos con estado activo o 1.
SELECT nombre, presupuesto,gasto,(presupuesto-gasto) AS diferencia FROM departamentos WHERE estado=1;
-- 9. Listar todas todas las localidades agrupadas por pais. En la vista se deberia ver el nombre del pais y el nombre de la localidad
SELECT paises.nombre AS pais,localidades.nombre AS localidad FROM localidades INNER JOIN paises INNER JOIN provincias WHERE paises.id=provincias.idpais AND provincias.id=localidades.id_provincia ORDER BY paises.nombre;
-- 10. Modificar (UPADTE): ● el telefono de un empleado cuando el id es igual a uno que hayan declarado. ● el fecha_ingreso y la localidad de otro empleado.
UPDATE empleados
SET  telefono = 3754458385
WHERE idemplaedo=2;
UPDATE empleados
SET  fecha_ingreso = '2010-05-10', id_localidad = '2'
WHERE idemplaedo=3;
-- 11. Insertar 5 vendedores.
INSERT INTO vendedores(id,nombre,apellido,cuitcuil,comisión) VALUES ('1','Pedro','Perez','23-65451236-8','20');
INSERT INTO vendedores(id,nombre,apellido,cuitcuil,comisión) VALUES ('2','Juan','villalba','23-64512358-8','30');
INSERT INTO vendedores(id,nombre,apellido,cuitcuil,comisión) VALUES ('3','Gabriel','Gonzales','23-15468795-8','15');
INSERT INTO vendedores(id,nombre,apellido,cuitcuil,comisión) VALUES ('4','Fernando','Garcia','23-26548456-8','50');
INSERT INTO vendedores(id,nombre,apellido,cuitcuil,comisión) VALUES ('5','Luis','Lopez','23-36548951-9','10');
-- 12. Modificar la tabla movimientos y agregar los campos: id_producto fk, estado, tms(timestamp), tipo_movimiento (ingreso, egreso, pedido)
ALTER TABLE movimientos
ADD(
id_producto INT UNSIGNED NOT NULL,
FOREIGN KEY (id_producto) REFERENCES productos(id),
estado BOOLEAN,
tms TIMESTAMP ,
tipo_movimiento VARCHAR(10) NOT NULL
);
-- 13. Insertar 5 movimientos distintos.
INSERT INTO movimientos(id,cantidad,fecha,id_cliente,id_vendedor,id_producto,estado,tms,tipo_movimiento) VALUES ('1','10','2022-10-27','1','1','1','1','2022-10-27 12:15:00','egreso');
INSERT INTO movimientos(id,cantidad,fecha,id_cliente,id_vendedor,id_producto,estado,tms,tipo_movimiento) VALUES ('2','20','2022-10-28','2','3','3','1','2022-10-28 10:25:00','ingreso');
INSERT INTO movimientos(id,cantidad,fecha,id_cliente,id_vendedor,id_producto,estado,tms,tipo_movimiento) VALUES ('3','50','2022-10-29','5','2','2','0','2022-10-29 09:23:00','pedido');
INSERT INTO movimientos(id,cantidad,fecha,id_cliente,id_vendedor,id_producto,estado,tms,tipo_movimiento) VALUES ('4','100','2022-10-30','4','1','2','1','2022-11-01 07:53:00','egreso');
INSERT INTO movimientos(id,cantidad,fecha,id_cliente,id_vendedor,id_producto,estado,tms,tipo_movimiento) VALUES ('5','10','2022-11-08','4','2','3','1','2022-11-08 09:45:00','ingreso');
-- 14. Borrar lógicamente (UPDATE de la columna estado): ● 2 movimientos que fueron cargados mal ● un pais que tenga al menos 3 localidades
UPDATE movimientos
SET estado=0
WHERE movimientos.id=2 OR movimientos.id=5;

ALTER TABLE paises
ADD (estado boolean);
UPDATE paises SET estado = 1 WHERE (id = '1');
UPDATE paises SET estado = 1 WHERE (id = '2');
UPDATE paises SET estado = 1 WHERE (id = '3');
UPDATE paises SET estado = 1 WHERE (id = '4');
UPDATE paises SET estado = 1 WHERE (id = '5');

UPDATE paises SET estado = 0 WHERE (id ='1');
-- 15. Modificar el campo stock de la tabla productos teniendo en cuenta la cantidad de la tabla de movimientos. Sumar el stock si es un ingreso, restar si es un egreso. Esto hacerlo de manera manual en base los 5 movimientos insertados en el punto 13. Es decir deben haber 5 updates de la tabla producto.
UPDATE productos,movimientos
SET stock=stock+movimientos.cantidad
WHERE productos.id=movimientos.id_producto AND tipo_movimiento='ingreso';

UPDATE productos,movimientos
SET stock=stock-movimientos.cantidad
WHERE productos.id=movimientos.id_producto AND tipo_movimiento='egreso';

-- 16. Cear la tabla parametros (id, tms,cosas(json), id_usuario)
CREATE TABLE parametros(
id INT UNSIGNED NOT NULL,
tms TIMESTAMP,
cosas JSON ,
id_usuario INT UNSIGNED NOT NULL
);

-- 17. Insertar en la tabla parametros teniendo en cuenta la columna cosas:
-- ● {"idDeLaCosa": 101, "permisos": "PUT, GET"}
-- ● {"vistasPermitidas":"menuPrincipal,menuSecundario,ventas,estadisticaVentas,listaCliente",
-- “grupo": "ventas"}
-- ● {"zonaHoraria": "America/Argentina/BuenosAires"}
-- ● {"fechaInicioActividades": 01/01/2019, "mesAperturaCaja": "Enero", "mesCierreCaja":
-- "Diciembre"}
-- ● {"balancesAniosAnteriores": {"2019": {"ingreso": "7374901.93","egreso":
-- "3732538,75"},"2020":{"ingreso": "27442665,12","egreso": "8522331,82"},"2021": {"ingreso":
-- "31634912,57","egreso": "9757142,66"}}}
-- Nota: Rellenar a criterio los campos id, tms,id_usuario
INSERT INTO parametros (id,tms,cosas,id_usuario) VALUES ('1','2022-10-27 12:12:00','{"idDeLaCosa": 101, "permisos": "PUT, GET"}','1');
INSERT INTO parametros (id,tms,cosas,id_usuario) VALUES ('2','2022-02-12 10:25:00','{"vistasPermitidas":"menuPrincipal,menuSecundario,ventas,estadisticaVentas,listaCliente","grupo": "ventas"}','1');
INSERT INTO parametros (id,tms,cosas,id_usuario) VALUES ('3','2021-03-15 11:36:00','{"zonaHoraria": "America/Argentina/BuenosAires"}','1');
INSERT INTO parametros (id,tms,cosas,id_usuario) VALUES ('4','2022-01-01 13:54:00','{"fechaInicioActividades": "01/01/2019", "mesAperturaCaja": "Enero", "mesCierreCaja":"Diciembre"}','2');
INSERT INTO parametros (id,tms,cosas,id_usuario) VALUES ('5','2022-02-28 22:11:00','{"balancesAniosAnteriores": {"2019": {"ingreso": "7374901.93","egreso":"3732538,75"},"2020":{"ingreso": "27442665,12","egreso": "8522331,82"},"2021": {"ingreso":"31634912,57","egreso": "9757142,66"}}}','3');
