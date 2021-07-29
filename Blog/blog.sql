CREATE DATABASE BLOG;


CREATE TABLE USUARIO 
(
	id INT NOT NULL,
	email VARCHAR(255) NOT NULL,
	CONSTRAINT pk_usuario PRIMARY KEY(id)
)

CREATE TABLE POST
(
	id INT NOT NULL,
	usuario_id INT NOT NULL,
	titulo VARCHAR(255) NOT NULL,
	fecha DATE NOT NULL,
	CONSTRAINT pk_post PRIMARY KEY(id),
	CONSTRAINT fk_post_usuario FOREIGN KEY(usuario_id)
	REFERENCES USUARIO(id)
)

CREATE TABLE COMENTARIO
(
	id INT NOT NULL,
    usuario_id INT NOT NULL,
	post_id INT NOT NULL,
	text VARCHAR(255) NOT NULL,
	fecha DATE NOT NULL,
	CONSTRAINT pk_comentario PRIMARY KEY(id),
	CONSTRAINT fk_comentario_post FOREIGN KEY(post_id)
	REFERENCES POST(id),
	CONSTRAINT fk_comentario_usuario FOREIGN KEY(usuario_id)
	REFERENCES USUARIO(id)
)


--1 Seleccionar el correo, id y título de todos los post publicados por el usuario 5
SELECT u.email , po.id, po.titulo from usuario as u inner join post as po on u.id=po.usuario_id
where u.id=2;

--2 Listar el correo, id y el detalle de todos los comentarios que no hayan sido realizados por el usuario con email usuario06@hotmail.com.
SELECT u.email, co.id, co.text, co.fecha from usuario as u inner join comentario as co on u.id=co.usuario_id
where u.email <> 'usuario06@hotmail.com';

--3 Listar los usuarios que no han publicado ningún post.
select u.email from usuario as u left join post po on u.id=po.usuario_id
where po.usuario_id IS NULL;

--4 Listar todos los post con sus comentarios (incluyendo aquellos que no poseen comentarios).
Select po.titulo, po.fecha, co.text, co.fecha from post as po full outer join comentario co on po.id=co.post_id
order by po.id;

--5 Listar todos los usuarios que hayan publicado un post en Junio.
Select u.email from usuario u inner join post po on u.id=po.usuario_id
where extract (month from po.fecha ) = 6;