/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
08 de abril de 2024 (2024-04-08), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

-- Tabelas

SELECT * FROM Clientes;

SELECT * FROM Funcionarios;

SELECT * FROM Servicos;

SELECT * FROM OrdensServico;

SELECT * FROM Fornecedores;

SELECT * FROM Produtos;

SELECT * FROM OrdensCompra;

SELECT * FROM Agendamentos;

-- Views

-- 1. Crie uma view chamada 'VwDetalhesServicos' para mostrar os detalhes completos de cada serviço prestado, incluindo o nome do cliente, descrição do serviço, data e status.

SELECT * FROM View_DetalhesServicos;

-- 2. Desenvolva uma view 'VwSalariosFuncionarios' para listar os funcionários e seus respectivos salários, ordenados do maior para o menor.

SELECT * FROM View_SalariosFuncionarios;

-- 3. Crie uma view 'VwProdutosFornecedores' que exiba todos os produtos, seus preços e o nome do fornecedor correspondente.

SELECT * FROM View_ProdutosFornecedores;

-- 4. Desenvolva uma view VwOrdensRecentes para listar as ordens de serviço dos últimos 30 dias, incluindo cliente, serviço e data.

SELECT * FROM View_OrdensRecentes;

-- 5. Crie uma view VwDespesasComProdutos que mostre a soma total de despesas com produtos, agrupadas por fornecedor.

SELECT * FROM View_DespesasComProdutos;

-- 6. Desenvolva uma view VwAgendamentosPorFuncionario que liste todos os agendamentos futuros, incluindo o nome do funcionário, o serviço a ser prestado e a data do agendamento.

SELECT * FROM View_AgendamentosPorFuncionario;

-- 7. Crie uma view VwClientesFrequentes que liste os clientes que fizeram mais de 5 ordens de serviço.

SELECT * FROM View_ClientesFrequentes;

-- 8. Desenvolva uma view VwMediaPrecoServico que mostre a média de preço dos serviços oferecidos.

SELECT * FROM View_MediaPrecoServico;

-- 9. Crie uma view VwDetalhesCompras para mostrar os detalhes das ordens de compra, incluindo nome do produto, quantidade, data e nome do fornecedor.

SELECT * FROM View_DetalhesCompras;

-- 10. Desenvolva uma view VwFuncionariosPorCargo que liste o número de funcionários por cargo.

SELECT * FROM View_FuncionariosPorCargo;
