DROP DATABASE posts

CREATE DATABASE POSTS;

/*PARTE 1*/
CREATE TABLE posts
(
    id integer NOT NULL,
    nombre_usuario varchar(255) NOT NULL,
    fecha_creacion date NOT NULL,
    contenido varchar(255) NOT NULL,
    descripcion varchar(255) NOT NULL,
    CONSTRAINT pk_id_posts PRIMARY KEY (id)
);

INSERT INTO posts(
	id, nombre_usuario, fecha_creacion, contenido, descripcion)
	VALUES (1, 'Pamela', '06-07-2021', 'Post 1', 'Este es el primero post de Pamela');

INSERT INTO posts(
	id, nombre_usuario, fecha_creacion, contenido, descripcion)
	VALUES (2, 'Pamela', '06-07-2021', 'Post 2', 'Este es el segundo post de Pamela');

INSERT INTO posts(
	id, nombre_usuario, fecha_creacion, contenido, descripcion)
	VALUES (3, 'Carlos', '06-07-2021', 'Post 1', 'Este es el primer post de Carlos');

ALTER TABLE posts
    ADD COLUMN titulo varchar(255);

UPDATE posts
	SET titulo = 'Titulos Post 1 Pamela'
	WHERE id=1;

UPDATE posts
	SET titulo = 'Titulos Post 2 Pamela'
	WHERE id=2;

UPDATE posts
	SET titulo = 'Titulos Post 1 Carlos'
	WHERE id=3;

INSERT INTO posts(
	id, nombre_usuario, fecha_creacion, contenido, descripcion,titulo)
	VALUES (4, 'Pedro', '06-07-2021', 'Post 1', 'Este es el primero post de Pedro','Titulo Post 1 Pedro');
	
INSERT INTO posts(
	id, nombre_usuario, fecha_creacion, contenido, descripcion,titulo)
	VALUES (5, 'Pedro', '06-07-2021', 'Post 2', 'Este es el segundo post de Pedro','Titulo Post 2 Pedro');

DELETE FROM posts
	WHERE id=3;

INSERT INTO posts(
	id, nombre_usuario, fecha_creacion, contenido, descripcion,titulo)
	VALUES (6, 'Carlos', '06-07-2021', 'Post 2', 'Este es el segundo post de Carlos','Titulo Post 2 Carlos');


/*PARTE 2*/