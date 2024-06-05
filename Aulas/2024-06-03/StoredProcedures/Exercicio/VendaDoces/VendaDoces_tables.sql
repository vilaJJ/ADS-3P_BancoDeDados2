/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
03 de junho de 2024 (2024-06-03), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Endereco VARCHAR(255),
    Telefone VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE Fornecedores (
    FornecedorID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Contato VARCHAR(100),
    Telefone VARCHAR(15),
    Email VARCHAR(100)
);


CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY AUTO_INCREMENT,
    FornecedorID INT NOT NULL,
    Nome VARCHAR(100),
    Descricao TEXT,
    Preco DECIMAL(10, 2),
    Estoque INT,
    CONSTRAINT FK_Produtos_Fornecedores FOREIGN KEY (FornecedorID) REFERENCES Fornecedores(FornecedorID)
        ON DELETE CASCADE
);

CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY AUTO_INCREMENT,
    ClienteID INT,
    DataPedido DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE DetalhesPedidos (
    DetalhePedidoID INT PRIMARY KEY AUTO_INCREMENT,
    PedidoID INT,
    ProdutoID INT,
    Quantidade INT,
    Preco DECIMAL(10, 2),
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),
    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID)
);
