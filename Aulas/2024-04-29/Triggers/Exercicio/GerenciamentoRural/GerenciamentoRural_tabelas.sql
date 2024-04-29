/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
29 de abril de 2024 (2024-04-29), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

CREATE TABLE Fazenda (
    FazendaID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Localizacao VARCHAR(255)
);

CREATE TABLE Gado (
    GadoID INT AUTO_INCREMENT PRIMARY KEY,
    FazendaID INT,
    Nome VARCHAR(50),
    Raca VARCHAR(50),
    DataNascimento DATE,
    PesoAtual FLOAT,
    FOREIGN KEY (FazendaID) REFERENCES Fazenda(FazendaID)
);

CREATE TABLE Veterinario (
    VeterinarioID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Especialidade VARCHAR(100)
);

CREATE TABLE Vacinacao (
    VacinacaoID INT AUTO_INCREMENT PRIMARY KEY,
    GadoID INT,
    VeterinarioID INT,
    DataVacina DATE,
    NomeVacina VARCHAR(100),
    FOREIGN KEY (GadoID) REFERENCES Gado(GadoID),
    FOREIGN KEY (VeterinarioID) REFERENCES Veterinario(VeterinarioID)
);

CREATE TABLE Alimentacao (
    AlimentacaoID INT AUTO_INCREMENT PRIMARY KEY,
    GadoID INT,
    DataAlimentacao DATE,
    TipoAlimento VARCHAR(100),
    Quantidade FLOAT,
    FOREIGN KEY (GadoID) REFERENCES Gado(GadoID)
);

CREATE TABLE AuditoriaGado (
    AuditoriaID INT AUTO_INCREMENT PRIMARY KEY,
    TipoOperacao CHAR(1),
    GadoID INT,
    NomeAntigo VARCHAR(50),
    RacaAntiga VARCHAR(50),
    DataHoraOperacao DATETIME DEFAULT CURRENT_TIMESTAMP
);
