CREATE TABLE Clientes(
    Codigo INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Endereco VARCHAR(50) NOT NULL,
    CPF CHAR(14)
);

CREATE TABLE Veiculos(
    Codigo INT PRIMARY KEY AUTO_INCREMENT,
    Marca VARCHAR(50) NOT NULL,
    Modelo VARCHAR(50) NOT NULL,
    Descricao VARCHAR(50) NOT NULL,
    Cor VARCHAR(40) NOT NULL,
    Placa CHAR(8) NOT NULL
);

CREATE TABLE Manutencoes(
    Codigo INT PRIMARY KEY AUTO_INCREMENT,
    Veiculo_Codigo INT NOT NULL,
    Descricao VARCHAR(60) NOT NULL,
    Valor DECIMAL(10,2),
    CONSTRAINT FK_Manutencoes_Veiculos FOREIGN KEY(Veiculo_Codigo) REFERENCES Veiculos(Codigo)
);

CREATE TABLE Contratos(
    Codigo INT PRIMARY KEY AUTO_INCREMENT,
    Cliente_Codigo INT NOT NULL,
    Veiculo_Codigo INT NOT NULL,
    Data DATE NULL,
    PrecoDiaria DECIMAL(10,2) NULL,
    ValorSeguro DECIMAL(10,2) NULL,
    CONSTRAINT FK_Contratos_Clientes FOREIGN KEY(Cliente_Codigo) REFERENCES Clientes(Codigo),
    CONSTRAINT FK_Contratos_Veiculos FOREIGN KEY(Veiculo_Codigo) REFERENCES Veiculos(Codigo)
);