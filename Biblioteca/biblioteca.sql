CREATE DATABASE biblioteca;

CREATE TABLE Libro
(
	isbn INT,
	titulo VARCHAR(255),
	numero_paginas INT,
	CONSTRAINT pk_libro PRIMARY KEY(isbn)
);