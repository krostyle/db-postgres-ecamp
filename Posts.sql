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

CREATE TABLE comentarios
(
    id integer NOT NULL,
    fecha date NOT NULL,
    hora_creacion time  NOT NULL,
    contenido varchar(255) NOT NULL,
	id_post integer NOT NULL,
    CONSTRAINT pk_id_comentarios PRIMARY KEY (id)
);

ALTER TABLE comentarios
	ADD CONSTRAINT fk_comentarios_posts
	FOREIGN KEY (id_post)
	REFERENCES posts(id)
	


INSERT INTO comentarios(
	id, fecha, hora_creacion, contenido, id_post)
	VALUES (1, current_date, current_time,'Comentario 1 de Pamela' , 1);
	
INSERT INTO comentarios(
	id, fecha, hora_creacion, contenido, id_post)
	VALUES (2, current_date, current_time,'Comentario 2 de Pamela' , 1);

INSERT INTO comentarios(
	id, fecha, hora_creacion, contenido, id_post)
	VALUES (3, current_date, current_time,'Comentario 1 de Carlos' , 6);
	
INSERT INTO comentarios(
	id, fecha, hora_creacion, contenido, id_post)
	VALUES (4, current_date, current_time,'Comentario 2 de Carlos' , 6);
	
INSERT INTO comentarios(
	id, fecha, hora_creacion, contenido, id_post)
	VALUES (5, current_date, current_time,'Comentario 3 de Carlos' , 6);
	
INSERT INTO comentarios(
	id, fecha, hora_creacion, contenido, id_post)
	VALUES (6, current_date, current_time,'Comentario 4 de Carlos' , 6);


INSERT INTO posts(
	id, nombre_usuario, fecha_creacion, contenido, descripcion,titulo)
	VALUES (7, 'Margarita', current_date, 'Post 1', 'Este es el primero post de Margarita','Titulo Post 1 Margarita')
	
INSERT INTO comentarios(
	id, fecha, hora_creacion, contenido, id_post)
	VALUES (7, current_date, current_time,'Comentario 1 de Margarita' , 7);
	
INSERT INTO comentarios(
	id, fecha, hora_creacion, contenido, id_post)
	VALUES (8, current_date, current_time,'Comentario 2 de Margarita' , 7);
	
INSERT INTO comentarios(
	id, fecha, hora_creacion, contenido, id_post)
	VALUES (9, current_date, current_time,'Comentario 3 de Margarita' , 7);
	
INSERT INTO comentarios(
	id, fecha, hora_creacion, contenido, id_post)
	VALUES (10, current_date, current_time,'Comentario 4 de Margarita' , 7);
	
INSERT INTO comentarios(
	id, fecha, hora_creacion, contenido, id_post)
	VALUES (11, current_date, current_time,'Comentario 5 de Margarita' , 7);

SELECT * FROM posts JOIN comentarios ON posts.id=comentarios.id_post;

SELECT * FROM posts;

SELECT * FROM comentarios;