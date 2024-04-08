/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
08 de abril de 2024 (2024-04-08), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

INSERT INTO Clientes (Nome, Endereco, Telefone) VALUES
('João Silva', 'Rua das Flores, 123', '11 98765-4321'),
('Maria Oliveira', 'Avenida Central, 456', '21 98765-4321'),
('Carlos Souza', 'Rua do Lago, 789', '31 98765-4321'),
('Ana Costa', 'Alameda dos Anjos, 101', '41 98765-4321'),
('Pedro Amaral', 'Travessa da Praia, 202', '51 98765-4321');

INSERT INTO Funcionarios (Nome, Cargo, Salario) VALUES
('José Ramos', 'Eletricista', 2500.00),
('Luciana Martins', 'Jardineira', 2200.00),
('Ricardo Nunes', 'Encanador', 2300.00),
('Márcia Lima', 'Limpeza', 2100.00),
('Eduardo Rocha', 'Pintor', 2400.00);

INSERT INTO Servicos (Descricao, Preco) VALUES
('Instalação elétrica', 200.00),
('Manutenção de jardim', 150.00),
('Reparo hidráulico', 180.00),
('Serviço de limpeza', 130.00),
('Pintura residencial', 250.00);

INSERT INTO OrdensServico (Cliente_Codigo, Servico_Codigo, Data, Status) VALUES
(1, 1, '2023-10-01', 'Concluído'),
(2, 2, '2023-10-05', 'Em andamento'),
(3, 3, '2023-10-10', 'Concluído'),
(4, 4, '2023-10-15', 'Cancelado'),
(5, 5, '2023-10-20', 'Concluído');

INSERT INTO Fornecedores (Nome, Endereco, ProdutoFornecido) VALUES
('Fornecimentos XYZ', 'Rua Industrial, 100', 'Materiais elétricos'),
('Jardim & Cia', 'Avenida das Flores, 200', 'Insumos para jardinagem'),
('Hidráulica Central', 'Alameda dos Encanadores, 300', 'Peças hidráulicas'),
('Limpeza Total', 'Travessa dos Limpeza, 400', 'Produtos de limpeza'),
('Pinturas Qualitá', 'Rua das Artes, 500', 'Tintas e pincéis');

INSERT INTO Produtos (Nome, Preco, Fornecedor_Codigo) VALUES
('Cabo elétrico', 50.00, 1),
('Adubo', 20.00, 2),
('Torneira', 30.00, 3),
('Detergente', 10.00, 4),
('Tinta látex', 60.00, 5);

INSERT INTO OrdensCompra (Produto_Codigo, Quantidade, Data) VALUES
(1, 100, '2023-09-25'),
(2, 50, '2023-09-26'),
(3, 30, '2023-09-27'),
(4, 200, '2023-09-28'),
(5, 40, '2023-09-29');

INSERT INTO Agendamentos (Ordem_Codigo, Funcionario_Codigo, DataAgendamento) VALUES
(1, 1, '2023-10-02'),
(2, 2, '2023-10-06'),
(3, 3, '2023-10-11'),
(4, 4, '2023-10-16'),
(5, 5, '2023-10-21');
