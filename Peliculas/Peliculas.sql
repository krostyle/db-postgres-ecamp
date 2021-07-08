CREATE DATABASE peliculas;

CREATE TABLE peliculas
(
    id integer NOT NULL,
    pelicula varchar(255) NOT NULL,
    anno_estreno int NOT NULL,
    director varchar(255) NOT NULL,
    CONSTRAINT pk_id_peliculas PRIMARY KEY (id)
);

CREATE TABLE reparto
(
	id_pelicula integer NOT NULL,
	nombre_actor varchar(255) NOT NULL,
	CONSTRAINT fk_reparto_peliculas
	FOREIGN KEY(id_pelicula)
	REFERENCES peliculas(id)
);


/*\COPY peliculas FROM 'C:\Users\Diego Bustamantes\Desktop\Diego\Proyectos\Workspace\Ecamp\05-PostgreSQL\db-postgres-ecamp\Peliculas\peliculas.csv' csv header;*/
/*\COPY reparto FROM 'C:\Users\Diego Bustamantes\Desktop\Diego\Proyectos\Workspace\Ecamp\05-PostgreSQL\db-postgres-ecamp\Peliculas\reparto.csv' csv*/

SELECT * FROM peliculas;
SELECT * FROM reparto;

/*Obtener el ID de la película “Titanic”.*/
SELECT id FROM peliculas WHERE pelicula = 'Titanic';

/*Listar a todos los actores que aparecen en la película "Titanic"*/
SELECT reparto.nombre_actor FROM reparto JOIN peliculas ON reparto.id_pelicula=peliculas.id
WHERE peliculas.pelicula='Titanic'

/*Consultar en cuántas películas del top 100 participa Harrison Ford.*/
SELECT count(peliculas.pelicula) FROM peliculas JOIN reparto ON peliculas.id=reparto.id_pelicula
WHERE reparto.nombre_actor='Harrison Ford';

/*Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente.*/
SELECT peliculaFROM peliculas
WHERE anno_estreno BETWEEN 1990 AND 1999
ORDER BY pelicula ASC;

/*Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser
nombrado para la consulta como “longitud_titulo”.
*/
SELECT pelicula, LENGTH(pelicula) as longitud_titulo FROM peliculas;

/*Consultar cual es la longitud más grande entre todos los títulos de las películas.
*/

SELECT pelicula,LENGTH(pelicula) AS longitud FROM peliculas
WHERE LENGTH(pelicula) = (SELECT MAX(LENGTH(pelicula)) FROM peliculas);