-- 1. Lista el apellido de todos los empleados.
 SELECT apellido FROM empleados;
-- 2. Lista el apellido de los empleados eliminando los apellidos que estén repetidos. 
SELECT DISTINCT apellido FROM empleados;
-- 3. Lista todas las columnas de la tabla empleados. 
SELECT * FROM empleados;
-- 4. Lista el nombre y apellido de todos los empleados.
SELECT nombre, apellido FROM empleados ;
-- 5. Lista el cuit/cuil de los departamentos de los empleados que aparecen en la tabla empleados. 
SELECT cuil_cuit FROM empleados INNER JOIN departamentos WHERE id_departamento=iddepartamento ;
-- 6. Lista el nombre y apellido de los empleados en una única columna.
SELECT CONCAT_WS(' ', nombre,apellido) AS nombre_apellido FROM empleados ;
-- 7. Lista el nombre y apellido de los empleados en una única columna, convirtiendo todos los caracteres en mayúscula.
SELECT UPPER(CONCAT_WS(' ', nombre,apellido)) AS nombre_apellido FROM empleados ;
-- Lista el nombre y apellido de los empleados en una única columna, convirtiendo todos los caracteres en minúscula.
SELECT LOWER(CONCAT_WS(' ', nombre,apellido)) AS nombre_apellido FROM empleados ;
-- 9. Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.
SELECT nombre, presupuesto FROM departamentos ORDER BY presupuesto ASC;
-- 10. Lista el nombre de todos los departamentos ordenados de forma ascendente.
SELECT nombre FROM departamentos ORDER BY nombre ASC;
-- 11. Lista el nombre de todos los departamentos ordenados de forma descendente. 
SELECT nombre FROM departamentos ORDER BY nombre DESC;
-- 12. Lista el apellido y el nombre de todos los empleados, ordenados de forma alfabética tendiendo en cuenta en primer lugar su apellido y luego su nombre.
SELECT nombre,apellido FROM empleados ORDER BY apellido , nombre asc;
-- 13. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.
SELECT nombre, presupuesto FROM departamentos ORDER BY presupuesto DESC LIMIT 3;
-- 14. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.
SELECT nombre, presupuesto FROM departamentos ORDER BY presupuesto ASC LIMIT 3;
-- 15. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto mayor o igual a $150000.
SELECT nombre, presupuesto FROM departamentos WHERE presupuesto > 150000;
-- 16. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto entre $100000 y $200000. Sin utilizar el operador BETWEEN.
SELECT nombre, presupuesto FROM departamentos WHERE presupuesto > 100000 AND presupuesto < 200000;
-- 17. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre $100000 y $200000. Sin utilizar el operador BETWEEN.
SELECT nombre, presupuesto FROM departamentos WHERE presupuesto < 100000 AND presupuesto > 200000;
-- 18. Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre $100000 y $200000. Utilizando el operador BETWEEN.
SELECT nombre, presupuesto FROM departamentos WHERE presupuesto BETWEEN 100000 AND 200000;
-- 19. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre $100000 y $200000. Utilizando el operador BETWEEN.
SELECT nombre, presupuesto FROM departamentos WHERE presupuesto NOT BETWEEN 100000 AND 200000;
-- 20. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
SELECT empleados.nombre,empleados.apellido,departamentos.nombre AS departamento,departamentos.presupuesto  FROM departamentos INNER JOIN empleados WHERE iddepartamento=id_departamento ;
-- 21. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno. Ordena el resultado, en primer lugar por el nombre del departamento (en orden alfabético) y en segundo lugar por apellido y el nombre de los empleados.
SELECT empleados.nombre,empleados.apellido,departamentos.nombre AS departamento,departamentos.presupuesto  FROM departamentos INNER JOIN empleados WHERE iddepartamento=id_departamento ORDER BY departamentos.nombre,empleados.nombre;
-- 22. Devuelve un listado con el código y el nombre del departamento, solamente de aquellos departamentos que tienen empleados.
SELECT DISTINCT departamentos.iddepartamento, departamentos.nombre AS departamento FROM departamentos INNER JOIN empleados WHERE iddepartamento=id_departamento;
-- 23. Devuelve el nombre del departamento donde trabaja el empleado que tiene el cuit 27-38382980-3.
SELECT  departamentos.nombre AS departamento FROM departamentos INNER JOIN empleados WHERE empleados.cuil_cuit="27-38382980-3" AND iddepartamento=id_departamento;
-- 24. Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz.
SELECT  departamentos.nombre AS departamento FROM departamentos INNER JOIN empleados WHERE empleados.nombre="Pepe" AND empleados.apellido="Ruiz" AND iddepartamento=id_departamento;
-- 25. Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D. Ordena el resultado alfabéticamente.
SELECT  empleados.nombre, empleados.apellido FROM departamentos INNER JOIN empleados WHERE departamentos.nombre ="I+D" AND iddepartamento=id_departamento ORDER BY empleados.nombre ASC;
-- 26. Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas, Contabilidad o I+D. Ordena el resultado alfabéticamente.
SELECT DISTINCT  empleados.nombre, empleados.apellido FROM empleados WHERE id_departamento ="2" or id_departamento ="4" or id_departamento ="5" order BY nombre ASC;
-- 27. Devuelve una lista con el nombre de los empleados que tienen los departamentos que no tienen un presupuesto entre $100000 y $200000.
SELECT empleados.nombre FROM empleados INNER JOIN departamentos WHERE departamentos.presupuesto NOT BETWEEN 100000 AND 200000 and iddepartamento=id_departamento;