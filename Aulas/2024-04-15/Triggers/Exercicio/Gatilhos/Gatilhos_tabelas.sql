/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
15 de abril de 2024 (2024-04-15), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

CREATE TABLE Alunos (
    Codigo INT AUTO_INCREMENT,
    Nome VARCHAR(100),
    Email VARCHAR(100),
    DataCriacao DATETIME,
    CONSTRAINT PK_Alunos PRIMARY KEY(Codigo)
);

CREATE TABLE Professores (
    Codigo INT AUTO_INCREMENT,
    Nome VARCHAR(100),
    Departamento VARCHAR(100),
    CONSTRAINT PK_Professores PRIMARY KEY(Codigo)
);

CREATE TABLE Cursos (
    Codigo INT AUTO_INCREMENT,
    Nome VARCHAR(100),
    Professor_Codigo INT,
    CONSTRAINT PK_Cursos PRIMARY KEY(Codigo),
    CONSTRAINT FK_Cursos_Professores FOREIGN KEY(Professor_Codigo) REFERENCES Professores(Codigo)
);

CREATE TABLE LogDepartamento (
    Codigo INT AUTO_INCREMENT,
    Professor_Codigo INT,
    DepartamentoAnterior VARCHAR(100),
    DepartamentoNovo VARCHAR(100),
    DataMudanca DATETIME,
    CONSTRAINT PK_LogDepartamento PRIMARY KEY(Codigo)
);

CREATE TABLE LogDeletados (
    Codigo INT AUTO_INCREMENT,
    Aluno_Codigo INT,
    Nome VARCHAR(100),
    Email VARCHAR(100),
    DataDelete DATETIME,
    CONSTRAINT PK_LogDeletados PRIMARY KEY(Codigo)
);