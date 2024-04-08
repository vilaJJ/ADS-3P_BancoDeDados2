/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
08 de abril de 2024 (2024-04-08), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

CREATE TABLE Clientes (
    Codigo INT AUTO_INCREMENT,
    Nome VARCHAR(255),
    Endereco VARCHAR(255),
    Telefone VARCHAR(20),
    CONSTRAINT PK_Clientes PRIMARY KEY(Codigo)
);

CREATE TABLE Funcionarios (
    Codigo INT AUTO_INCREMENT,
    Nome VARCHAR(255),
    Cargo VARCHAR(100),
    Salario DECIMAL(10, 2),
    CONSTRAINT PK_Funcionarios PRIMARY KEY (Codigo)
);

CREATE TABLE Servicos (
    Codigo INT AUTO_INCREMENT,
    Descricao VARCHAR(255),
    Preco DECIMAL(10, 2),
    CONSTRAINT PK_Servicos PRIMARY KEY (Codigo)
);

CREATE TABLE OrdensServico (
    Codigo INT AUTO_INCREMENT,
    Cliente_Codigo INT,
    Servico_Codigo INT,
    Data DATE,
    Status VARCHAR(50),
    CONSTRAINT PK_OrdensServico PRIMARY KEY (Codigo),
    CONSTRAINT FK_OrdensServico_Clientes FOREIGN KEY (Cliente_Codigo) REFERENCES Clientes(Codigo),
    CONSTRAINT FK_OrdensServico_Servicos FOREIGN KEY (Servico_Codigo) REFERENCES Servicos(Codigo)
);

CREATE TABLE Fornecedores (
    Codigo INT AUTO_INCREMENT,
    Nome VARCHAR(255),
    Endereco VARCHAR(255),
    ProdutoFornecido VARCHAR(55),
    CONSTRAINT PK_Fornecedores PRIMARY KEY (Codigo)
);

CREATE TABLE Produtos (
    Codigo INT AUTO_INCREMENT,
    Nome VARCHAR(255),
    Preco DECIMAL(10, 2),
    Fornecedor_Codigo INT,
    CONSTRAINT PK_Produtos PRIMARY KEY (Codigo),
    FOREIGN KEY (Fornecedor_Codigo) REFERENCES Fornecedores(Codigo)
);

CREATE TABLE OrdensCompra (
    Codigo INT AUTO_INCREMENT,
    Produto_Codigo INT,
    Quantidade INT,
    Data DATE,
    CONSTRAINT PK_OrdensCompra PRIMARY KEY (Codigo),
    CONSTRAINT FK_OrdensCompra_Produtos FOREIGN KEY (Produto_Codigo) REFERENCES Produtos(Codigo)
);

CREATE TABLE Agendamentos (
    Codigo INT AUTO_INCREMENT,
    Ordem_Codigo INT,
    Funcionario_Codigo INT,
    DataAgendamento DATE,
    CONSTRAINT PK_Agendamentos PRIMARY KEY (Codigo),
    CONSTRAINT FK_Agendamentos_OrdensServico FOREIGN KEY (Ordem_Codigo) REFERENCES OrdensServico(Codigo),
    CONSTRAINT FK_Agendamentos_Funcionarios FOREIGN KEY (Funcionario_Codigo) REFERENCES Funcionarios(Codigo)
);
