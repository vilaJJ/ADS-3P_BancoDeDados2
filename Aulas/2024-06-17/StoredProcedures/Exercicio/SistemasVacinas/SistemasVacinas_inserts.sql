/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
17 de junho de 2024 (2024-06-17), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

-- Inserção de dados na tabela Usuarios
INSERT INTO Usuarios (nome, email, senha, data_nascimento, cpf) VALUES
('João Silva', 'joao.silva@example.com', 'senha123', '1985-06-15', '123.456.789-00'),
('Maria Souza', 'maria.souza@example.com', 'senha123', '1990-07-20', '987.654.321-00'),
('Carlos Pereira', 'carlos.pereira@example.com', 'senha123', '1975-08-25', '456.123.789-00'),
('Ana Santos', 'ana.santos@example.com', 'senha123', '1982-09-30', '789.456.123-00'),
('Paulo Costa', 'paulo.costa@example.com', 'senha123', '1995-10-05', '321.654.987-00'),
('Julia Almeida', 'julia.almeida@example.com', 'senha123', '1988-11-10', '654.987.321-00');

-- Inserção de dados na tabela Vacinas
INSERT INTO Vacinas (nome, fabricante, doses_necessarias, intervalo_dias) VALUES
('Vacina A', 'Fabricante X', 2, 30),
('Vacina B', 'Fabricante Y', 1, 0),
('Vacina C', 'Fabricante Z', 3, 60),
('Vacina D', 'Fabricante W', 2, 21),
('Vacina E', 'Fabricante V', 1, 0),
('Vacina F', 'Fabricante U', 2, 28);

-- Inserção de dados na tabela Lotes
INSERT INTO Lotes (vacina_id, numero_lote, data_fabricacao, data_validade, quantidade) VALUES
(1, 'Lote123', '2023-01-01', '2024-01-01', 100),
(2, 'Lote456', '2023-02-01', '2024-02-01', 200),
(3, 'Lote789', '2023-03-01', '2024-03-01', 150),
(4, 'Lote101', '2023-04-01', '2024-04-01', 100),
(5, 'Lote112', '2023-05-01', '2024-05-01', 50),
(6, 'Lote131', '2023-06-01', '2024-06-01', 300);

-- Inserção de dados na tabela Centros
INSERT INTO Centros (nome, endereco, telefone) VALUES
('Centro A', 'Rua 1, Cidade A', '(11) 1111-1111'),
('Centro B', 'Rua 2, Cidade B', '(22) 2222-2222'),
('Centro C', 'Rua 3, Cidade C', '(33) 3333-3333'),
('Centro D', 'Rua 4, Cidade D', '(44) 4444-4444'),
('Centro E', 'Rua 5, Cidade E', '(55) 5555-5555'),
('Centro F', 'Rua 6, Cidade F', '(66) 6666-6666');

-- Inserção de dados na tabela Profissionais
INSERT INTO Profissionais (nome, cpf, cargo, centro_id) VALUES
('Profissional A', '111.111.111-11', 'Enfermeiro', 1),
('Profissional B', '222.222.222-22', 'Médico', 2),
('Profissional C', '333.333.333-33', 'Técnico de Enfermagem', 3),
('Profissional D', '444.444.444-44', 'Médico', 4),
('Profissional E', '555.555.555-55', 'Enfermeiro', 5),
('Profissional F', '666.666.666-66', 'Técnico de Enfermagem', 6);

-- Inserção de dados na tabela Pacientes
INSERT INTO Pacientes (nome, cpf, data_nascimento, endereco) VALUES
('Paciente A', '777.777.777-77', '1980-01-01', 'Endereço 1, Cidade A'),
('Paciente B', '888.888.888-88', '1990-02-02', 'Endereço 2, Cidade B'),
('Paciente C', '999.999.999-99', '2000-03-03', 'Endereço 3, Cidade C'),
('Paciente D', '000.000.000-00', '1985-04-04', 'Endereço 4, Cidade D'),
('Paciente E', '111.222.333-44', '1995-05-05', 'Endereço 5, Cidade E'),
('Paciente F', '555.666.777-88', '2005-06-06', 'Endereço 6, Cidade F');

-- Inserção de dados na tabela Agendamentos
INSERT INTO Agendamentos (paciente_id, vacina_id, centro_id, data_agendamento, status) VALUES
(1, 1, 1, '2023-06-01', 'Agendado'),
(2, 2, 2, '2023-06-02', 'Agendado'),
(3, 3, 3, '2023-06-03', 'Agendado'),
(4, 4, 4, '2023-06-04', 'Agendado'),
(5, 5, 5, '2023-06-05', 'Agendado'),
(6, 6, 6, '2023-06-06', 'Agendado');

-- Inserção de dados na tabela Aplicacoes
INSERT INTO Aplicacoes (agendamento_id, profissional_id, data_aplicacao) VALUES
(1, 1, '2023-06-01'),
(2, 2, '2023-06-02'),
(3, 3, '2023-06-03'),
(4, 4, '2023-06-04'),
(5, 5, '2023-06-05'),
(6, 6, '2023-06-06');

-- Inserção de dados na tabela Efeitos_Adversos
INSERT INTO Efeitos_Adversos (aplicacao_id, descricao, data_ocorrencia) VALUES
(1, 'Dor no braço', '2023-06-02'),
(2, 'Febre', '2023-06-03'),
(3, 'Cefaleia', '2023-06-04'),
(4, 'Fadiga', '2023-06-05'),
(5, 'Dor no local da aplicação', '2023-06-06'),
(6, 'Náusea', '2023-06-07');

-- Inserção de dados na tabela Estoques
INSERT INTO Estoques (centro_id, vacina_id, quantidade) VALUES
(1, 1, 100),
(2, 2, 200),
(3, 3, 150),
(4, 4, 100),
(5, 5, 50),
(6, 6, 300);