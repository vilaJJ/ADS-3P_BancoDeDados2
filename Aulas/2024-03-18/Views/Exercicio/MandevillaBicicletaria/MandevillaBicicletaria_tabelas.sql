/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
18 de março de 2024 (2024-03-18), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

CREATE TABLE Lucros(
    Codigo INT AUTO_INCREMENT,
    Data DATE NOT NULL,
    Valor DECIMAL(10,2) NOT NULL,
    CONSTRAINT PK_Lucros PRIMARY KEY(Codigo)
);

CREATE TABLE Clientes(
    Codigo INT AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(11) NOT NULL,
    Email VARCHAR(100) NULL,
    Telefone VARCHAR(20) NOT NULL,
    CONSTRAINT PK_Clientes PRIMARY KEY(Codigo)
);

CREATE TABLE Bonus(
    Codigo INT AUTO_INCREMENT,
    Cliente_Codigo INT NOT NULL,
    Pontos INT NOT NULL,
    CONSTRAINT PK_Bonus PRIMARY KEY(Codigo),
    CONSTRAINT FK_Bonus_Clientes FOREIGN KEY(Cliente_Codigo) REFERENCES Clientes(Codigo)
);

CREATE TABLE Cidades(
    Codigo INT AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Estado VARCHAR(50) NOT NULL,
    CONSTRAINT PK_Cidades PRIMARY KEY(Codigo)
);

CREATE TABLE TiposBicicletas(
    Codigo INT AUTO_INCREMENT,
    Descricao VARCHAR(255) NOT NULL,
    CONSTRAINT PK_TiposBicicletas PRIMARY KEY(Codigo)
);

CREATE TABLE Valores(
    Codigo INT AUTO_INCREMENT,
    TipoBicicleta_Codigo INT NOT NULL,
    ValorHora DECIMAL(10,2) NOT NULL,
    CONSTRAINT PK_Valores PRIMARY KEY(Codigo),
    CONSTRAINT FK_Valores_TiposBicicletas FOREIGN KEY(TipoBicicleta_Codigo) REFERENCES TiposBicicletas(Codigo)
);

CREATE TABLE Bicicletas(
    Codigo INT AUTO_INCREMENT,
    TipoBicicleta_Codigo INT NOT NULL,
    Cidade_Codigo INT NOT NULL,
    Status VARCHAR(50) NOT NULL,
    CONSTRAINT PK_Bicicletas PRIMARY KEY(Codigo),
    CONSTRAINT FK_Bicicletas_TiposBicicletas FOREIGN KEY(TipoBicicleta_Codigo) REFERENCES TiposBicicletas(Codigo),
    CONSTRAINT FK_Bicicletas_Cidades FOREIGN KEY(Cidade_Codigo) REFERENCES Cidades(Codigo)
);

CREATE TABLE Locacoes(
    Codigo INT AUTO_INCREMENT,
    Cliente_Codigo INT NOT NULL,
    Bicicleta_Codigo INT NOT NULL,
    DataInicio DATETIME NOT NULL,
    DataFim DATETIME NULL,
    ValorTotal DECIMAL(10,2) NULL,
    CONSTRAINT PK_Locacoes PRIMARY KEY(Codigo),
    CONSTRAINT FK_Locacoes_Clientes FOREIGN KEY(Cliente_Codigo) REFERENCES Clientes(Codigo),
    CONSTRAINT FK_Locacoes_Bicicletas FOREIGN KEY(Bicicleta_Codigo) REFERENCES Bicicletas(Codigo)
);