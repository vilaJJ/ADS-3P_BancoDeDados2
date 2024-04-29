/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
29 de abril de 2024 (2024-04-29), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

-- Inserção na tabela Fazenda
INSERT INTO Fazenda (Nome, Localizacao) VALUES
('Fazenda Santa Fé', 'Cidade Alta, MG'),
('Fazenda Boa Esperança', 'Vale do Rio Doce, MG'),
('Fazenda São Jorge', 'Planalto Central, GO');

-- Inserção na tabela Gado
INSERT INTO Gado (FazendaID, Nome, Raca, DataNascimento, PesoAtual) VALUES
(1, 'Boi1', 'Nelore', '2018-03-21', 450.0),
(2, 'Boi2', 'Angus', '2019-04-15', 500.0),
(3, 'Boi3', 'Hereford', '2020-05-10', 530.0);

-- Inserção na tabela Veterinario
INSERT INTO Veterinario (Nome, Especialidade) VALUES
('Dr. Ana', 'Bovinos'),
('Dr. Carlos', 'Suínos'),
('Dr. Maria', 'Equinos');

-- Inserção na tabela Vacinacao
INSERT INTO Vacinacao (GadoID, VeterinarioID, DataVacina, NomeVacina) VALUES
(1, 1, '2021-06-01', 'Febre Aftosa'),
(2, 1, '2021-06-01', 'Brucelose'),
(3, 1, '2021-06-01', 'Raiva');

-- Inserção na tabela Alimentação
INSERT INTO Alimentacao (GadoID, DataAlimentacao, TipoAlimento, Quantidade) VALUES
(1, '2021-07-01', 'Milho', 5.0),
(2, '2021-07-02', 'Soja', 4.5),
(3, '2021-07-03', 'Capim', 6.0);