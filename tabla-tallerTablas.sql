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

-- PARTE 3: Tabla de Rompimiento

CREATE TABLE libro_autor(
	la_libro_codigo_fk varchar(5) NOT NULL,
	la_autor_id_fk int NOT NULL,
	anio_publicacion int NOT NULL,

	--PRIMARY KEY DE LA TABLA
	CONSTRAINT pk_libro_autor PRIMARY KEY (la_libro_codigo_fk, la_autor_id_fk),

	--FOREIGN KEY DE LA TABLA
	CONSTRAINT  fk_libro FOREIGN KEY(la_libro_codigo_fk) REFERENCES libros(codigo),
	CONSTRAINT  fk_autor FOREIGN KEY(la_autor_id_fk) REFERENCES autores(id)
);

