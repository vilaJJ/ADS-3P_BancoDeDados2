/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
27 de maio de 2024 (2024-05-27), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

CREATE TABLE Categoria (
  Codigo INT(11) AUTO_INCREMENT,
  Nome VARCHAR(45) NULL,
  Desconto DECIMAL(5,2) NULL,
  CONSTRAINT PK_Categoria PRIMARY KEY (Codigo)
);


CREATE TABLE Produto (
  Codigo INT(11) AUTO_INCREMENT,
  Nome VARCHAR(45) NULL,
  Preco DECIMAL(10,2) NULL,
  Categoria_Codigo INT(11) NOT NULL,
  CONSTRAINT PK_Produto PRIMARY KEY (Codigo),
  CONSTRAINT FK_Produto_Categoria FOREIGN KEY (Categoria_Codigo) REFERENCES Categoria (Codigo)
);
   
CREATE TABLE Cliente (
  Codigo INT(11) AUTO_INCREMENT,
  Nome VARCHAR(45) NULL,
  CPF CHAR(14) NULL,
  Idade INT(3) NULL,
  Cidade VARCHAR(45) NULL,
  CONSTRAINT PK_Cliente PRIMARY KEY (Codigo)
);


CREATE TABLE Pedido (
  Codigo INT(11) NOT NULL AUTO_INCREMENT,
  Produto_Codigo INT(11) NOT NULL,
  Cliente_Codigo INT(11) NOT NULL,
  CONSTRAINT PK_Pedido PRIMARY KEY (Codigo),  
  CONSTRAINT FK_Pedido_Produto FOREIGN KEY (Produto_Codigo) REFERENCES Produto (Codigo),
  CONSTRAINT FK_Pedido_Cliente FOREIGN KEY (Cliente_Codigo) REFERENCES Cliente (Codigo)
);