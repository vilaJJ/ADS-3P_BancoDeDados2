/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
04 de março de 2024 (2024-03-04), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

CREATE TABLE Modelos(
    Codigo INT,
    Construtor VARCHAR(20) NOT NULL,
    Versao VARCHAR(20) NOT NULL,
    QntdMotores INT NOT NULL,
    CONSTRAINT PK_Modelos PRIMARY KEY(Codigo)
);

CREATE TABLE Aeroportos(
    Codigo INT,
    Nome VARCHAR(30) NOT NULL,
    Local VARCHAR(30) NOT NULL,
    Pais VARCHAR(30) NOT NULL,
    CONSTRAINT PK_Aeroportos PRIMARY KEY(Codigo)
);

CREATE TABLE Avioes(
    Codigo INT,
    Nome VARCHAR(30) NOT NULL,
    Modelo_Codigo INT NOT NULL,
    CONSTRAINT PK_Avioes PRIMARY KEY(Codigo),
    CONSTRAINT FK_Avioes_Modelos FOREIGN KEY(Modelo_Codigo) REFERENCES Modelos(Codigo)
);

CREATE TABLE Voos(
    Codigo INT,
    Aeroporto_Inicio INT NOT NULL,
    Aeroporto_Fim INT NOT NULL,
    Transportadora VARCHAR(10) NOT NULL,
    HorasVoo DECIMAL(5,1) NOT NULL,
    Aviao_Codigo INT NOT NULL,
    CONSTRAINT PK_Voos PRIMARY KEY(Codigo),
    CONSTRAINT FK_Voos_Aeroportos_Inicio FOREIGN KEY(Aeroporto_Inicio) REFERENCES Aeroportos(Codigo),
    CONSTRAINT FK_Voos_Aeroportos_Fim FOREIGN KEY(Aeroporto_Fim) REFERENCES Aeroportos(Codigo),
    CONSTRAINT FK_Voos_Avioes FOREIGN KEY(Aviao_Codigo) REFERENCES Avioes(Codigo)
);