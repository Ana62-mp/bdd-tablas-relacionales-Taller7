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

-- PARTE 4: Insertar datos

-- Insertar libros
INSERT INTO libros (codigo, titulo, paginas) VALUES
('L001', 'Base de Datos', 250),
('L002', 'Programacion Java', 320),
('L003', 'Desarrollo Web', 280),
('L004', 'Inteligencia Artificial', 400);

SELECT * FROM libros;

-- Insertar autores
INSERT INTO autores (id, nombre, pais) VALUES
(1, 'Carlos Perez', 'Ecuador'),
(2, 'Ana Gomez', 'Colombia'),
(3, 'Luis Martinez', 'Mexico');

SELECT * FROM autores;

-- Insertar relaciones entre libros y autores
INSERT INTO libro_autor 
(la_libro_codigo_fk, la_autor_id_fk, anio_publicacion) VALUES
('L001', 1, 2019),
('L002', 1, 2021),
('L003', 2, 2022),
('L004', 3, 2023),
('L001', 2, 2020);

INSERT INTO libro_autor 
(la_libro_codigo_fk, la_autor_id_fk, anio_publicacion) VALUES
('L004', 2, 2015);

INSERT INTO libro_autor 
(la_libro_codigo_fk, la_autor_id_fk, anio_publicacion) VALUES
('L004', 1, 2023);

SELECT * FROM libro_autor;

