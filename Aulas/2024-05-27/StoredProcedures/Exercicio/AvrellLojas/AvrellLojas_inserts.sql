/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
27 de maio de 2024 (2024-05-27), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

INSERT INTO Categoria (Nome, Desconto) VALUES
('Eletrônicos', 10),
('Móveis', 5),
('Vestuário', 20),
('Alimentos', 15),
('Brinquedos', 25),
('Ferramentas', 8);

INSERT INTO Produto (Nome, Preco, Categoria_Codigo) VALUES
('Televisão', 2000, 1),
('Sofá', 500, 2),
('Camisa', 100, 3),
('Arroz', 20, 4),
('Carrinho de Brinquedo', 50, 5),
('Martelo', 30, 6);

INSERT INTO Cliente (Nome, CPF, Idade, Cidade) VALUES
('João Silva', '111.111.111-11', 30, 'São Jerônimo'),
('Maria Santos', '222.222.222-22', 25, 'Porto Alegre'),
('Carlos Oliveira', '333.333.333-33', 40, 'São Jerônimo'),
('Ana Costa', '444.444.444-44', 35, 'Rio de Janeiro'),
('Paula Souza', '555.555.555-55', 28, 'São Paulo'),
('Pedro Gomes', '666.666.666-66', 32, 'São Jerônimo');

INSERT INTO Pedido (Produto_Codigo, Cliente_Codigo) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);