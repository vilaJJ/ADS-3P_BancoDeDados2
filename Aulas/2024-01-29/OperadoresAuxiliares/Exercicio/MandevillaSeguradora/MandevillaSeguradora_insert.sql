INSERT INTO Clientes(Nome, Endereco, CPF) VALUES
('Juan Felipe Alves Flores', 'Rua das Bananeiras, 123', '165.136.481-82'),
('Bárbara Ohana Santos Silva', 'Rua da Goiabada, 789', '163.846.241-85'),
('Maria Eduarda Batista Sousa', 'Rua das Laranjeiras, 456', '102.456.268-13');

INSERT INTO Veiculos(Marca, Modelo, Descricao, Cor, Placa) VALUES
('Fiat', 'Mille Uno Fire', '2008 - Placa Mercosul', 'Preto', 'MWI-6F58'),
('Chevrolet', 'Cobalt LTZ', '2017 - Placa Mercosul', 'Cinza', 'QKG-4C20'),
('Honda', 'CG Fan 160', '2018 - Placa antiga', 'Vermelha', 'MWZ-6324');

INSERT INTO Manutencoes(Veiculo_Codigo, Descricao, Valor) VALUES
(1, 'Troca da embreagem', 700),
(2, 'Pintura do para-choque', 650),
(3, 'Troca dos freios', 95.99);

INSERT INTO Contratos(Cliente_Codigo, Veiculo_Codigo, Data, PrecoDiaria, ValorSeguro) VALUES
(1, 1, '2023-06-03', 5.99, 109.99),
(2, 3, '2024-01-06', 2.79, 74.99),
(3, 2, '2024-01-15', 9.49, 144.49);