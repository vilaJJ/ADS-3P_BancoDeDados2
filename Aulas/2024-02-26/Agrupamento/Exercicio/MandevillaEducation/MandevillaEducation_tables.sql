/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
26 de fevereiro de 2024 (2024-02-26), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

CREATE TABLE Professor(
    Codigo INT NOT NULL,
    Nome VARCHAR(30) NOT NULL,
    Cidade VARCHAR(30) NOT NULL,
    Rua VARCHAR(30) NOT NULL,
    CONSTRAINT PK_Professor PRIMARY KEY(Codigo)
);

CREATE TABLE Aluno(
    Codigo INT NOT NULL,
    Nome VARCHAR(30) NOT NULL,
    Cidade VARCHAR(30) NOT NULL,
    Rua VARCHAR(30) NOT NULL,
    CONSTRAINT PK_Aluno PRIMARY KEY(Codigo)
);

CREATE TABLE Curso(
    Codigo INT NOT NULL,
    Nome VARCHAR(30) NOT NULL,
    CONSTRAINT PK_Curso PRIMARY KEY(Codigo)
);

CREATE TABLE Disciplina(
    Codigo INT NOT NULL,
    Curso_Codigo INT NOT NULL,
    Nome VARCHAR(30) NOT NULL,
    QuantidadeAulas INT NOT NULL,
    CONSTRAINT PK_Disciplina PRIMARY KEY(Codigo),
    CONSTRAINT FK_Disciplina_Curso FOREIGN KEY(Curso_Codigo) REFERENCES Curso(Codigo)
);

CREATE TABLE DisciplinaProfessor(
    Disciplina_Codigo INT NOT NULL,
    Professor_Codigo INT NOT NULL,
    Ano YEAR NOT NULL,
    CONSTRAINT PK_DisciplinaProfessor PRIMARY KEY(Disciplina_Codigo, Professor_Codigo),
    CONSTRAINT FK_DisciplinaProfessor_Disciplina FOREIGN KEY(Disciplina_Codigo) REFERENCES Disciplina(Codigo),
    CONSTRAINT FK_DisciplinaProfessor_Professor FOREIGN KEY(Professor_Codigo) REFERENCES Professor(Codigo)
);

CREATE TABLE Matricula(
    Aluno_Codigo INT NOT NULL,
    Disciplina_Codigo INT NOT NULL,
    Ano YEAR NOT NULL,
    CONSTRAINT PK_Matricula PRIMARY KEY(Aluno_Codigo, Disciplina_Codigo),
    CONSTRAINT FK_Matricula_Aluno FOREIGN KEY(Aluno_Codigo) REFERENCES Aluno(Codigo),
    CONSTRAINT FK_Matricula_Disciplina FOREIGN KEY(Disciplina_Codigo) REFERENCES Disciplina(Codigo)
);