-- Cria��o do banco de dados
CREATE DATABASE minha_base_dedados;
GO

-- Uso do banco de dados rec�m-criado
USE minha_base_dedados;
GO

-- Cria��o da tabela Professor
CREATE TABLE Professor (
    id INT PRIMARY KEY,
    nome VARCHAR(50),
    sobrenome VARCHAR(50),
    id_disciplina INT,
    cpf VARCHAR(11),
    senha VARCHAR(100) -- Ser� armazenada de forma criptografada
);
GO

-- Inser��o de registros na tabela Professor
INSERT INTO Professor (id, nome, sobrenome, id_disciplina, cpf, senha)
VALUES
(1, 'Jo�o', 'Silva', 1, '12345678901', 'senha123'),
(2, 'Maria', 'Santos', 2, '98765432101', 'senha456'),
(3, 'Pedro', 'Souza', 3, '45678912301', 'senha789'),
(4, 'Ana', 'Ferreira', 1, '32165498701', 'senhaabc'),
(5, 'Lucas', 'Oliveira', 2, '78912345601', 'senhaxyz');
GO

-- Cria��o da tabela Disciplinas
CREATE TABLE Disciplinas (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    id_professor INT
);
GO

-- Inser��o de registros na tabela Disciplinas
INSERT INTO Disciplinas (id, nome, id_professor)
VALUES
(1, 'Matem�tica', 1),
(2, 'Hist�ria', 2),
(3, 'Geografia', 3),
(4, 'Ci�ncias', 1),
(5, 'Portugu�s', 2);
GO

-- Cria��o da tabela Alunos
CREATE TABLE Alunos (
    id INT PRIMARY KEY,
    nome VARCHAR(50),
    sobrenome VARCHAR(50),
    cpf VARCHAR(11),
    senha VARCHAR(100) -- Ser� armazenada de forma criptografada
);
GO

-- Inser��o de registros na tabela Alunos
INSERT INTO Alunos (id, nome, sobrenome, cpf, senha)
VALUES
(1, 'Carlos', 'Silveira', '11122233344', 'senha123'),
(2, 'Juliana', 'Oliveira', '22233344455', 'senha456'),
(3, 'Marcos', 'Santos', '33344455566', 'senha789'),
(4, 'Fernanda', 'Pereira', '44455566677', 'senhaabc'),
(5, 'Mariana', 'Ferreira', '55566677788', 'senhaxyz');
GO

-- Adiciona a coluna 'turma' na tabela Alunos
ALTER TABLE Alunos
ADD turma VARCHAR(10);
GO

-- Atualiza os registros na tabela Alunos para definir a turma
UPDATE Alunos SET turma = 'A' WHERE id = 1;
UPDATE Alunos SET turma = 'B' WHERE id = 2;
UPDATE Alunos SET turma = 'A' WHERE id = 3;
UPDATE Alunos SET turma = 'C' WHERE id = 4;
UPDATE Alunos SET turma = 'B' WHERE id = 5;
GO

-- Desconectar do banco de dados
USE master;
GO

-- Descartar as restri��es de chave estrangeira, se existirem
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_TYPE = 'FOREIGN KEY' AND TABLE_NAME = 'Professor')
BEGIN
    ALTER TABLE Disciplinas DROP CONSTRAINT FK_Professor;
END;

-- Descartar as tabelas, se existirem
IF OBJECT_ID('Professor', 'U') IS NOT NULL
    DROP TABLE Professor;
IF OBJECT_ID('Disciplinas', 'U') IS NOT NULL
    DROP TABLE Disciplinas;
IF OBJECT_ID('Alunos', 'U') IS NOT NULL
    DROP TABLE Alunos;

-- Descartar o banco de dados, se existir
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'minha_base_dedados')
BEGIN
    ALTER DATABASE minha_base_dedados SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE minha_base_dedados;
END;

