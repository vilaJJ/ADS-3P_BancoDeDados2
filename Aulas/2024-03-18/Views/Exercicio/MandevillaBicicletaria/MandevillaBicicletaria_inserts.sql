/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
18 de março de 2024 (2024-03-18), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

INSERT INTO Clientes (Nome, CPF, Email, Telefone) VALUES
('Ana Beatriz', '23456789012', 'ana.beatriz@email.com', '31987654321'),
('Carlos Eduardo', '34567890123', 'carlos.eduardo@email.com', '41987654321'),
('Daniela Rocha', '45678901234', 'daniela.rocha@email.com', '51987654321'),
('Eduardo Lima', '56789012345', 'eduardo.lima@email.com', '61987654321'),
('Fernanda Costa', '67890123456', 'fernanda.costa@email.com', '71987654321'),
('Gustavo Henrique', '78901234567', 'gustavo.henrique@email.com', '81987654321'),
('Helena Souza', '89012345678', 'helena.souza@email.com', '91987654321'),
('Ícaro Santos', '90123456789', 'icaro.santos@email.com', '101987654321');

INSERT INTO Cidades (Nome, Estado) VALUES
('Belo Horizonte', 'MG'),
('Porto Alegre', 'RS'),
('Salvador', 'BA'),
('Fortaleza', 'CE'),
('Brasília', 'DF'),
('Curitiba', 'PR'),
('Manaus', 'AM'),
('Recife', 'PE');

INSERT INTO TiposBicicletas (Descricao) VALUES
('Urbana'),
('Speed'),
('Mountain'),
('Elétrica'),
('Dobrável'),
('BMX'),
('Fixa'),
('Híbrida');

INSERT INTO Bicicletas (TipoBicicleta_Codigo, Cidade_Codigo, Status) VALUES
(1, 1, 'Disponível'),
(2, 2, 'Disponível'),
(3, 3, 'Disponível'),
(4, 4, 'Disponível'),
(5, 5, 'Disponível'),
(6, 6, 'Disponível'),
(7, 7, 'Disponível'),
(8, 8, 'Disponível');

INSERT INTO Valores (TipoBicicleta_Codigo, ValorHora) VALUES
(1, 5.00),
(2, 7.50),
(3, 8.00),
(4, 10.00),
(5, 6.50),
(6, 5.50),
(7, 4.50),
(8, 9.00);

INSERT INTO Locacoes (Cliente_Codigo, Bicicleta_Codigo, DataInicio, DataFim, ValorTotal) VALUES
(3, 3, '2023-03-03 08:00:00', '2023-03-03 10:00:00', 16.00),
(4, 4, '2023-03-04 14:00:00', '2023-03-04 15:00:00', 10.00),
(5, 5, '2023-03-05 09:00:00', '2023-03-05 09:30:00', 3.25),
(6, 6, '2023-03-06 12:00:00', '2023-03-06 14:00:00', 11.00),
(7, 7, '2023-03-07 16:00:00', '2023-03-07 17:30:00', 6.75),
(8, 8, '2023-03-08 18:00:00', '2023-03-08 19:00:00', 9.00),
(2, 1, '2023-03-09 20:00:00', '2023-03-09 22:00:00', 10.00),
(1, 2, '2023-03-10 13:00:00', '2023-03-10 14:00:00', 7.50);

INSERT INTO Bonus (Cliente_Codigo, Pontos) VALUES
(3, 150),
(4, 250),
(5, 350),
(6, 50),
(7, 75),
(8, 125),
(2, 175),
(1, 225);

INSERT INTO Lucros (Data, Valor) VALUES
('2023-03-03', 600.00),
('2023-03-04', 850.00),
('2023-03-05', 900.00),
('2023-03-06', 950.00),
('2023-03-07', 1000.00),
('2023-03-08', 1050.00),
('2023-03-09', 1100.00),
('2023-03-10', 1150.00);