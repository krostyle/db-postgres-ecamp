CREATE DATABASE biblioteca;

CREATE TABLE Libro
(
	isbn VARCHAR(255) NOT NULL,
	titulo VARCHAR(255) NOT NULL,
	numero_paginas INT NOT NULL,
	CONSTRAINT pk_libro PRIMARY KEY(isbn)
);

CREATE TABLE Autor
(
	codigo_autor INT NOT NULL,
	nombre VARCHAR(255) NOT NULL,
	apellido VARCHAR(255) NOT NULL,
	fecha_nacimiento DATE NOT NULL,
	fecha_muerte DATE,
	CONSTRAINT pk_autor PRIMARY KEY(codigo_autor)
	
);

CREATE TABLE Socio
(
	rut VARCHAR(255) NOT NULL,
	nombre VARCHAR(255) NOT NULL,
	apellido VARCHAR(255) NOT NULL,
	direccion VARCHAR(255) NOT NULL,
	telefono VARCHAR(255) NOT NULL,
	CONSTRAINT pk_socio PRIMARY KEY(rut)
);

CREATE TABLE prestamo
(
	id_prestamo INT NOT NULL,
	isbn_libro VARCHAR(255) NOT NULL,
	rut_socio VARCHAR(255) NOT NULL,
	fecha_inicio DATE NOT NULL,
	fecha_devolucion DATE NOT NULL,
	fecha_devolucion_real DATE,
	CONSTRAINT pk_prestamo PRIMARY KEY(id_prestamo),
	CONSTRAINT fk_prestamo_libro FOREIGN KEY(isbn_libro) REFERENCES libro(isbn),
	CONSTRAINT fk_prestamo_socio FOREIGN KEY(rut_socio) REFERENCES socio(rut)
);


CREATE TABLE libroautor
(
	id_libroautor INT NOT NULL,
	isbn_libro VARCHAR(255) NOT NULL,
	codigo_autor_autor INT NOT NULL,
	tipo_autor VARCHAR(255) NOT NULL,
	CONSTRAINT pk_libroautor PRIMARY KEY(id_libroautor),
	CONSTRAINT fk_libroautor_libro FOREIGN KEY(isbn_libro) REFERENCES libro(isbn),
	CONSTRAINT fk_libroautor_actor FOREIGN KEY(codigo_autor_autor) REFERENCES autor(codigo_autor)
);


INSERT INTO socio(
	rut, nombre, apellido, direccion, telefono)
	VALUES ('1111111-1', 'JUAN', 'SOTO', 'AVENIDA 1, SANTIAGO', '911111111'),
	('2222222-2','ANA','PEREZ','PASAJE 2, SANTIAGO','922222222'),
	('3333333-3','SANDRA','AGUILAR','AVENIDA 2, SANTIAGO','933333333'),
	('4444444-4','ESTEBAN','JEREZ','AVENIDA 3, SANTIAGO','944444444'),
	('5555555-5','SILVANA','MUÑOZ','PASAJE 3, SANTIAGO','955555555');

INSERT INTO libro(
	isbn, titulo, numero_paginas)
	VALUES ('111-1111111-111', 'CUENTOS DE TERROR', 344),
	('222-2222222-222', 'POESÍAS CONTEMPORANEAS', 167),
	('333-3333333-333', 'HISTORIA DE ASIA', 511),
	('444-4444444-444', 'MANUAL DE MECÁNICA', 298);


INSERT INTO autor(
	codigo_autor, nombre, apellido, fecha_nacimiento, fecha_muerte)
	VALUES (3, 'JOSE', 'SALGADO', '01-01-1968', '01-01-2020'),
	(2, 'SERGIO', 'MARDONES', '01-01-1950','01-01-2012');
	
INSERT INTO autor(
	codigo_autor, nombre, apellido, fecha_nacimiento)	
	VALUES (4, 'ANA', 'SALGADO', '01-01-1972'),
	(1, 'ANDRES', 'ULLOA', '01-01-1982'),
	(5, 'MARTIN', 'PORTA', '01-01-1976');

INSERT INTO libroautor(
	id_libroautor, isbn_libro, codigo_autor_autor, tipo_autor)
	VALUES (1, '111-1111111-111', 3, 'Principal'),
	(2, '111-1111111-111', 4, 'COAUTOR'),
	(3, '222-2222222-222', 1, 'PRINCIPAL'),
	(4, '333-3333333-333', 2, 'PRINCIPAL'),
	(5, '444-4444444-444', 5, 'PRINCIPAL');

INSERT INTO prestamo(
	id_prestamo, isbn_libro, rut_socio, fecha_inicio, fecha_devolucion, fecha_devolucion_real)
	VALUES (1, '111-1111111-111','1111111-1' , '20-01-2020', '27-01-2020', '27-01-2020'),
	(2, '222-2222222-222','5555555-5' , '20-01-2020', '30-01-2020', '30-01-2020'),
	(3, '333-3333333-333','3333333-3' , '22-01-2020', '30-01-2020', '30-01-2020'),
	(4, '444-4444444-444','4444444-4' , '23-01-2020', '30-01-2020', '30-01-2020'),
	(5, '111-1111111-111','2222222-2' , '27-01-2020', '04-02-2020', '04-02-2020'),
	(6, '444-4444444-444','1111111-1' , '31-01-2020', '12-02-2020', '12-02-2020'),
	(7, '222-2222222-222','3333333-3' , '31-01-2020', '30-01-2020', '12-02-2020');


--Consultas

SELECT * FROM LIBRO WHERE numero_paginas<300;

SELECT * FROM AUTOR WHERE fecha_nacimiento>'01-01-1970';

SELECT titulo,COUNT(isbn_libro) as repeticiones FROM libro JOIN prestamo ON libro.isbn = prestamo.isbn_libro
GROUP BY titulo
ORDER BY repeticiones DESC;


SELECT socio.nombre||' '||socio.apellido as nombre_completo , ABS(prestamo.fecha_inicio-prestamo.fecha_devolucion_real) AS dias, 
ABS(prestamo.fecha_inicio-prestamo.fecha_devolucion_real)*100 as deuda
FROM socio INNER JOIN prestamo ON socio.rut=prestamo.rut_socio
WHERE ABS(prestamo.fecha_inicio-prestamo.fecha_devolucion_real)>7;