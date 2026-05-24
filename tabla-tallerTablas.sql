-- PARTE 1: Creación base de datos
CREATE DATABASE biblioteca_db;

--PARTE2: Crear la tabla libros y tabla autores

DROP TABLE IF EXISTS libros;
DROP TABLE IF EXISTS autores;

CREATE TABLE libros(
	codigo varchar(5) PRIMARY KEY,
	titulo varchar(50) NOT NULL,
	paginas int NOT NULL
);

CREATE TABLE autores(
	id int PRIMARY KEY,
	nombre varchar(50) NOT NULL,
	pais varchar(30) NOT NULL
);


