/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
22 de abril de 2024 (2024-04-22), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

-- Lojas

INSERT INTO `Loja` (`idLoja`, `Nome`, `Endereco`) VALUES 
(NULL, 'Brasil Peças', 'Rua dos Abacaxis'), 
(NULL, 'Papelaria Flores', 'Rua das Maças');

-- Clientes

INSERT INTO `Cliente` (`idCliente`, `Nome`, `idade`, `CPF`, `endereco`) VALUES 
(NULL, 'Juan Felipe Alves Flores', '19', '16849812136', 'Rua das Bananeiras'), 
(NULL, 'Bárbara Ohana Santos Silva', '18', '45632198160', 'Rua das Macaxeiras'), 
(NULL, 'Sara Ghabrielly Oliveira Silva', '18', '15975382169', 'Rua das Mandiocas'),
(NULL, 'Maria Eduarda Batista Souza', '19', '36426515103', 'Rua das Melâncias');

-- Produtos

INSERT INTO `Produtos` (`idProdutos`, `Nome`, `Valor`, `Descricao`, `Loja_idLoja`) VALUES 
(NULL, 'Processor AMD Athlon 3000G', '259.90', 'Processador com vídeo integrado', '2'), 
(NULL, 'Canetas BIC', '2.50', 'Multicores', '3'), 
(NULL, 'SSD NVMe 500gb Samsung', '159.90', 'Slot M.2', '2'), 
(NULL, 'Agenda anual', '59.90', 'Cor verde', '3');

-- Pedido

INSERT INTO `Pedido` (`idPedido`, `Quantidade`, `Produtos_idProdutos`, `Cliente_idCliente`) VALUES 
(NULL, '1', '2', '1'), 
(NULL, '2', '3', '2'), 
(NULL, '1', '4', '3'), 
(NULL, '3', '3', '1');