SELECT * FROM cliente;
SELECT * FROM compra;
SELECT * FROM producto;
SELECT * FROM detalle_compra;

/*2. El cliente usuario01 ha realizado la siguiente compra:
● producto: producto9
● cantidad: 5
● fecha: fecha del sistema
Mediante el uso de transacciones, realiza las consultas correspondientes para este
requerimiento y luego consulta la tabla producto para validar si fue efectivamente
descontado en el stock.
*/
BEGIN TRANSACTION;
INSERT INTO compra(
	id,cliente_id, fecha)
	VALUES (nextval('compra_id_seq'),1, current_date);
UPDATE producto
	SET stock=stock-5
	WHERE id=9;
SELECT * FROM producto WHERE id=9;
ROLLBACK;
COMMIT;
--NO SE LOGRA HACER LA TRANSACCIÓN YA QUE NO SE CUMPLE LA CONDICIÓN CHECK

/*3. El cliente usuario02 ha realizado la siguiente compra:
● producto: producto1, producto 2, producto 8
● cantidad: 3 de cada producto
● fecha: fecha del sistema
Mediante el uso de transacciones, realiza las consultas correspondientes para este
requerimiento y luego consulta la tabla producto para validar que si alguno de ellos
se queda sin stock, no se realice la compra.
*/
BEGIN TRANSACTION;
INSERT INTO compra(
	id,cliente_id, fecha)
	VALUES (nextval('compra_id_seq'),2, current_date);
INSERT INTO compra(
	id,cliente_id, fecha)
	VALUES (nextval('compra_id_seq'),2, current_date);
INSERT INTO compra(
	id,cliente_id, fecha)
	VALUES (nextval('compra_id_seq'),2, current_date);
	
UPDATE producto
	SET stock=stock-3
	WHERE id=1;
UPDATE producto
	SET stock=stock-3
	WHERE id=2;
UPDATE producto
	SET stock=stock-3
	WHERE id=8;
ROLLBACK;
COMMIT;
SELECT * FROM producto WHERE id = 1 OR id = 2 OR id = 8;
--NO SE LOGRA HACER LA TRANSACCIÓN YA QUE NO SE CUMPLE LA CONDICIÓN CHECK


/*4. Realizar las siguientes consultas:
a. Deshabilitar el AUTOCOMMIT
b. Insertar un nuevo cliente
c. Confirmar que fue agregado en la tabla cliente
d. Realizar un ROLLBACK
e. Confirmar que se restauró la información, sin considerar la inserción del
punto b
f. Habilitar de nuevo el AUTOCOMMIT*/

--\SET AUTOCOMMIT OFF;
INSERT INTO cliente(
	id, nombre, email)
	VALUES (nextval('cliente_id_seq'), 'diego', 'diego@gmail.com');
SELECT * FROM cliente WHERE nombre = 'diego';
ROLLBACK;
SELECT * FROM cliente;
-- \SET AUTOCOMMIT ON;