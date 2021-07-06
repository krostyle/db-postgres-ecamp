CREATE DATABASE POSTS;

CREATE TABLE posts
(
    id integer NOT NULL,
    nombre_usuario varchar(255) NOT NULL,
    fecha_creacion date NOT NULL,
    contenido varchar(255) NOT NULL,
    descripcion varchar(255) NOT NULL,
    CONSTRAINT fk_id_posts PRIMARY KEY (id)
);