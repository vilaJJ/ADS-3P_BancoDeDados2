/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
17 de junho de 2024 (2024-06-17), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

-- Tabela Usuarios
CREATE TABLE Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    senha VARCHAR(100),
    data_nascimento DATE,
    cpf VARCHAR(14)
);

-- Tabela Vacinas
CREATE TABLE Vacinas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    fabricante VARCHAR(100),
    doses_necessarias INT,
    intervalo_dias INT
);

-- Tabela Lotes
CREATE TABLE Lotes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vacina_id INT,
    numero_lote VARCHAR(100),
    data_fabricacao DATE,
    data_validade DATE,
    quantidade INT,
    FOREIGN KEY (vacina_id) REFERENCES Vacinas(id)
);

-- Tabela Centros
CREATE TABLE Centros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    endereco VARCHAR(200),
    telefone VARCHAR(15)
);

-- Tabela Profissionais
CREATE TABLE Profissionais (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cpf VARCHAR(14),
    cargo VARCHAR(100),
    centro_id INT,
    FOREIGN KEY (centro_id) REFERENCES Centros(id)
);

-- Tabela Pacientes
CREATE TABLE Pacientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cpf VARCHAR(14),
    data_nascimento DATE,
    endereco VARCHAR(200)
);

-- Tabela Agendamentos
CREATE TABLE Agendamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    paciente_id INT,
    vacina_id INT,
    centro_id INT,
    data_agendamento DATE,
    status VARCHAR(50),
    FOREIGN KEY (paciente_id) REFERENCES Pacientes(id),
    FOREIGN KEY (vacina_id) REFERENCES Vacinas(id),
    FOREIGN KEY (centro_id) REFERENCES Centros(id)
);

-- Tabela Aplicacoes
CREATE TABLE Aplicacoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    agendamento_id INT,
    profissional_id INT,
    data_aplicacao DATE,
    FOREIGN KEY (agendamento_id) REFERENCES Agendamentos(id),
    FOREIGN KEY (profissional_id) REFERENCES Profissionais(id)
);

-- Tabela Efeitos_Adversos
CREATE TABLE Efeitos_Adversos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aplicacao_id INT,
    descricao VARCHAR(255),
    data_ocorrencia DATE,
    FOREIGN KEY (aplicacao_id) REFERENCES Aplicacoes(id)
);

-- Tabela Estoques
CREATE TABLE Estoques (
    id INT AUTO_INCREMENT PRIMARY KEY,
    centro_id INT,
    vacina_id INT,
    quantidade INT,
    FOREIGN KEY (centro_id) REFERENCES Centros(id),
    FOREIGN KEY (vacina_id) REFERENCES Vacinas(id)
);
