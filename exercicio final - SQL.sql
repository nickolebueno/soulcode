-- Cria��o do banco de dados
CREATE DATABASE biblioteca_database;
GO

-- Usar o banco de dados criado
USE biblioteca_database;
GO

-- Cria��o da tabela Autores
CREATE TABLE Autores (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    sobrenome VARCHAR(100)
);

-- Cria��o da tabela Livros
CREATE TABLE Livros (
    id INT PRIMARY KEY,
    titulo VARCHAR(200),
    editora VARCHAR(100),
    edicao INT,
    num_paginas INT,
    cod_autor INT,
    FOREIGN KEY (cod_autor) REFERENCES Autores(id)
);

-- Inser��o de registros na tabela Autores
INSERT INTO Autores (id, nome, sobrenome)
VALUES
(1, 'Harry', 'Potter'),
(2, 'Ron', 'Weasley'),
(3, 'Hermione', 'Granger'),
(4, 'Albus', 'Dumbledore'),
(5, 'Severus', 'Snape'),
(6, 'Sirius', 'Black'),
(7, 'Rubeus', 'Hagrid'),
(8, 'Minerva', 'McGonagall'),
(9, 'Draco', 'Malfoy'),
(10, 'Neville', 'Longbottom'),
(11, 'Ginny', 'Weasley'),
(12, 'Fred', 'Weasley'),
(13, 'George', 'Weasley'),
(14, 'Luna', 'Lovegood'),
(15, 'Cedric', 'Diggory'),
(16, 'Cho', 'Chang'),
(17, 'Fleur', 'Delacour'),
(18, 'Viktor', 'Krum'),
(19, 'Cormac', 'McLaggen'),
(20, 'Percy', 'Weasley');

-- Inser��o de registros na tabela Livros (exemplo com 5 livros)
INSERT INTO Livros (id, titulo, editora, edicao, num_paginas, cod_autor)
VALUES
(1, 'Harry Potter e a Pedra Filosofal', 'Rocco', 1, 332, 1),
(2, 'Harry Potter e a C�mara Secreta', 'Rocco', 1, 360, 1),
(3, 'Harry Potter e o Prisioneiro de Azkaban', 'Rocco', 1, 318, 1),
(4, 'Harry Potter e o C�lice de Fogo', 'Rocco', 1, 640, 1),
(5, 'Harry Potter e a Ordem da F�nix', 'Rocco', 1, 768, 1);

-- Consultas solicitadas:

-- 1. Listar as editoras existentes
SELECT DISTINCT editora FROM Livros;

-- 2. Listar toda a informa��o dos livros existentes ordenadas por t�tulo
SELECT * FROM Livros ORDER BY titulo;

-- 3. Listar o t�tulo, editora, edi��o e c�digo do autor de todos os livros ordenada por t�tulo
SELECT Livros.titulo, Livros.editora, Livros.edicao, Livros.cod_autor, Autores.nome, Autores.sobrenome
FROM Livros
JOIN Autores ON Livros.cod_autor = Autores.id
ORDER BY Livros.titulo;

-- 4. Lista os nomes de todas as editoras em ordem alfab�tica
SELECT DISTINCT editora FROM Livros ORDER BY editora;

-- 5. Listar os livros que possuem o n�mero de p�ginas maior que 300
SELECT * FROM Livros WHERE num_paginas > 300;

-- 6. Listar os livros que possuem o n�mero de p�ginas entre 200 e 300
SELECT * FROM Livros WHERE num_paginas BETWEEN 200 AND 300;

-- 7. Selecionar os livros que tem seus t�tulos come�ados com a letra �F�
SELECT * FROM Livros WHERE titulo LIKE 'F%';

-- 8. Selecionar os autores que possuem Ara�jo no final de seus nomes
SELECT * FROM Autores WHERE sobrenome LIKE '%Ara�jo';

-- 9. Selecionar os livros que
