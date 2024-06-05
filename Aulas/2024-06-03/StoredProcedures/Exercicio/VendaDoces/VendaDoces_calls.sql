/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
03 de junho de 2024 (2024-06-03), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

-- 1.

CALL RetornarClientes();

-- 2.

CALL AdicionarProduto (1, 'Monster Mango Loco 473ml', 'Bebida energética', 9.99, 100);

-- 3.

CALL AtualizarPrecoProduto (2, 15.99);

-- 4.

CALL ExcluirCliente (2);

-- 5. 

CALL ObterQuantidadeProdutosEstoque (@QuantidadeEstoque);

SELECT @QuantidadeEstoque;

-- 6.

CALL ListarTodosPedidosPorCliente (1);

-- 7.

CALL CalcularValorTotalPedido (4, @ValorTotal);

SELECT @ValorTotal;

-- 8.

CALL InserirNovoPedido (4, 1, 50);

-- 9.

CALL ListarProdutosPorFornecedor (1);

-- 10.

CALL AtualizarEstoqueProduto (4, 443);

-- 11.

CALL ListarProdutosAbaixoValorEstoque (100);

-- 12.

CALL ListarClientesPedidoAcimaValor (25);