/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
03 de junho de 2024 (2024-06-03), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

INSERT INTO Clientes (Nome, Endereco, Telefone, Email) VALUES
('Maria Silva', 'Rua das Flores, 123', '1111-1111', 'maria@exemplo.com'),
('João Souza', 'Avenida Brasil, 456', '2222-2222', 'joao@exemplo.com'),
('Ana Pereira', 'Praça da Sé, 789', '3333-3333', 'ana@exemplo.com'),
('Carlos Santos', 'Rua XV de Novembro, 101', '4444-4444', 'carlos@exemplo.com'),
('Lucia Lima', 'Avenida Paulista, 202', '5555-5555', 'lucia@exemplo.com');

INSERT INTO Fornecedores (Nome, Contato, Telefone, Email) VALUES
('Fornecedor A', 'contatoA@exemplo.com', '6666-6666', 'contatoA@exemplo.com'),
('Fornecedor B', 'contatoB@exemplo.com', '7777-7777', 'contatoB@exemplo.com'),
('Fornecedor C', 'contatoC@exemplo.com', '8888-8888', 'contatoC@exemplo.com'),
('Fornecedor D', 'contatoD@exemplo.com', '9999-9999', 'contatoD@exemplo.com'),
('Fornecedor E', 'contatoE@exemplo.com', '1010-1010', 'contatoE@exemplo.com');

INSERT INTO Produtos (Nome, FornecedorID, Descricao, Preco, Estoque) VALUES
('Brigadeiro', 2, 'Doce de chocolate com granulado', 1.50, 100),
('Beijinho', 3, 'Doce de coco com açúcar', 1.50, 80),
('Cajuzinho', 3, 'Doce de amendoim com chocolate', 1.70, 60),
('Bala de Coco', 1, 'Bala de coco tradicional', 0.50, 200),
('Pé de Moleque', 4, 'Doce de amendoim caramelizado', 2.00, 50);

INSERT INTO Pedidos (ClienteID, DataPedido) VALUES
(1, '2024-05-01'),
(2, '2024-05-02'),
(3, '2024-05-03'),
(4, '2024-05-04'),
(5, '2024-05-05');

INSERT INTO DetalhesPedidos (PedidoID, ProdutoID, Quantidade, Preco) VALUES
(1, 1, 10, 1.50),
(1, 2, 5, 1.50),
(2, 3, 7, 1.70),
(2, 4, 20, 0.50),
(3, 5, 4, 2.00),
(3, 1, 15, 1.50),
(4, 2, 8, 1.50),
(4, 3, 10, 1.70),
(5, 4, 25, 0.50),
(5, 5, 3, 2.00);
