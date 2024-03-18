/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
11 de março de 2024 (2024-03-11), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

CREATE TABLE Assuntos(
    Codigo INT AUTO_INCREMENT,
    Nome VARCHAR(45) NOT NULL,
    CONSTRAINT PK_Assuntos PRIMARY KEY(Codigo)
);

CREATE TABLE Livros(
    Codigo INT AUTO_INCREMENT,
    Titulo VARCHAR(60) NOT NULL,
    Autor VARCHAR(60) NOT NULL,
    DataLancamento DATE NOT NULL,
    Copias INT NOT NULL,
    Assunto_Codigo INT NOT NULL,
    CONSTRAINT PK_Livros PRIMARY KEY(Codigo),
    CONSTRAINT FK_Livros_Assuntos FOREIGN KEY(Assunto_Codigo) REFERENCES Assuntos(Codigo)
);

CREATE TABLE Alunos(
    Codigo INT AUTO_INCREMENT,
    Nome VARCHAR(40) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Fone VARCHAR(15) NOT NULL,
    CONSTRAINT PK_Alunos PRIMARY KEY(Codigo)
);

CREATE TABLE Emprestimos(
    Codigo INT AUTO_INCREMENT,
    DataEmprestimo DATE NOT NULL,
    DataPrevista DATE NOT NULL,
    DataDevolucao DATE NULL,
    Multa DECIMAL(10,2) NULL,
    Aluno_Codigo INT NOT NULL,
    Livro_Codigo INT NOT NULL,
    CONSTRAINT PK_Emprestimos PRIMARY KEY(Codigo),
    CONSTRAINT FK_Emprestimos_Alunos FOREIGN KEY(Aluno_Codigo) REFERENCES Alunos(Codigo),
    CONSTRAINT FK_Emprestimos_Livros FOREIGN KEY(Livro_Codigo) REFERENCES Livros(Codigo)
);