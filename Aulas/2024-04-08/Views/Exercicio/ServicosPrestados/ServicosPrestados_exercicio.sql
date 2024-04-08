/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
08 de abril de 2024 (2024-04-08), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

-- 1. Crie uma view chamada 'VwDetalhesServicos' para mostrar os detalhes completos de cada serviço prestado, incluindo o nome do cliente, descrição do serviço, data e status.

CREATE VIEW View_DetalhesServicos
AS
SELECT 
    S.Descricao AS "Descrição do serviço",
    C.Nome AS "Cliente",
    CONCAT('R$ ', S.Preco) AS "Preço",
    DATE_FORMAT(OS.Data, "%d/%m/%Y") AS "Data",
    OS.Status AS "Status"
FROM OrdensServico AS OS
INNER JOIN Servicos AS S
    ON OS.Servico_Codigo = S.Codigo
INNER JOIN Clientes AS C
    ON OS.Cliente_Codigo = C.Codigo
GROUP BY
    OS.Codigo
ORDER BY
    OS.Data DESC;

-- 2. Desenvolva uma view 'VwSalariosFuncionarios' para listar os funcionários e seus respectivos salários, ordenados do maior para o menor.

CREATE VIEW View_SalariosFuncionarios
AS
SELECT
    F.Nome AS "Funcionário",
    CONCAT("R$ ", F.Salario) AS "Salário"
FROM Funcionarios AS F
GROUP BY
    F.Codigo
ORDER BY
    F.Salario DESC;

-- 3. Crie uma view 'VwProdutosFornecedores' que exiba todos os produtos, seus preços e o nome do fornecedor correspondente.

CREATE VIEW View_ProdutosFornecedores
AS
SELECT
    P.Nome AS "Produto",
    CONCAT("R$ ", P.Preco) AS "Preço",
    F.Nome AS "Fornecedor"
FROM Produtos AS P
INNER JOIN Fornecedores AS F
    ON P.Fornecedor_Codigo = F.Codigo
GROUP BY 
    P.Codigo
ORDER BY
    P.Nome ASC;

-- 4. Desenvolva uma view VwOrdensRecentes para listar as ordens de serviço dos últimos 30 dias, incluindo cliente, serviço e data.

CREATE VIEW View_OrdensRecentes
AS
SELECT 
    S.Descricao AS "Descrição do serviço",
    C.Nome AS "Cliente",
    CONCAT('R$ ', S.Preco) AS "Preço",
    DATE_FORMAT(OS.Data, "%d/%m/%Y") AS "Data",
    OS.Status AS "Status"
FROM OrdensServico AS OS
INNER JOIN Servicos AS S
    ON OS.Servico_Codigo = S.Codigo
INNER JOIN Clientes AS C
    ON OS.Cliente_Codigo = C.Codigo
WHERE
    DATEDIFF(NOW(), OS.Data) <= 30
GROUP BY
    OS.Codigo
ORDER BY
    OS.Data DESC;

-- 5. Crie uma view VwDespesasComProdutos que mostre a soma total de despesas com produtos, agrupadas por fornecedor.

CREATE VIEW View_DespesasComProdutos
AS
SELECT
    F.Nome AS "Fornecedor",
    CONCAT("R$ ",SUM(P.Preco)) AS "Despesas com produtos"
FROM Fornecedores AS F
INNER JOIN Produtos AS P
    ON F.Codigo = P.Fornecedor_Codigo
GROUP BY
    F.Codigo
ORDER BY
    F.Nome ASC;

-- 6. Desenvolva uma view VwAgendamentosPorFuncionario que liste todos os agendamentos futuros, incluindo o nome do funcionário, o serviço a ser prestado e a data do agendamento.

CREATE VIEW View_AgendamentosPorFuncionario
AS
SELECT 
    F.Nome AS "Funcionário",
    S.Descricao AS "Descrição do serviço",
    DATE_FORMAT(A.DataAgendamento, "%d/%m/%Y") AS "Data de Agendamento"
FROM Agendamentos AS A
INNER JOIN OrdensServico AS OS
    ON A.Ordem_Codigo = OS.Codigo
INNER JOIN Servicos AS S
    ON OS.Servico_Codigo = S.Codigo
INNER JOIN Funcionarios AS F
    ON A.Funcionario_Codigo = F.Codigo
WHERE
    A.DataAgendamento >= DATE(NOW())
GROUP BY
    A.Codigo
ORDER BY
    A.DataAgendamento ASC;

-- 7. Crie uma view VwClientesFrequentes que liste os clientes que fizeram mais de 5 ordens de serviço.

CREATE VIEW View_ClientesFrequentes
AS
SELECT
    C.Nome AS "Cliente",
    COUNT(OS.Codigo) AS "Quantidade de OS"
FROM Clientes AS C
INNER JOIN OrdensServico AS OS
    ON C.Codigo = OS.Cliente_Codigo
GROUP BY
    C.Codigo
HAVING
    COUNT(OS.Codigo) > 5
ORDER BY
    COUNT(OS.Codigo) DESC;

-- 8. Desenvolva uma view VwMediaPrecoServico que mostre a média de preço dos serviços oferecidos.

CREATE VIEW View_MediaPrecoServico
AS
SELECT
    CONCAT("R$ ", CAST(AVG(S.Preco) AS DECIMAL(10,2))) AS "Valor médio dos serviços"
FROM Servicos AS S;

-- 9. Crie uma view VwDetalhesCompras para mostrar os detalhes das ordens de compra, incluindo nome do produto, quantidade, data e nome do fornecedor.

CREATE VIEW View_DetalhesCompras
AS
SELECT 
    P.Nome AS "Produto",
    OC.Quantidade AS "Quantidade",
    F.Nome AS "Fornecedor",
    DATE_FORMAT(OC.Data, "%d/%m/%Y") AS "Data"
FROM OrdensCompra AS OC
INNER JOIN Produtos AS P
    ON OC.Produto_Codigo = P.Codigo
INNER JOIN Fornecedores AS F
    ON P.Fornecedor_Codigo = F.Codigo
GROUP BY
    OC.Codigo
ORDER BY
    OC.Data DESC;

-- 10. Desenvolva uma view VwFuncionariosPorCargo que liste o número de funcionários por cargo.

CREATE VIEW View_FuncionariosPorCargo
AS
SELECT
    F.Cargo AS "Cargo",
    COUNT(F.Codigo) AS "Quantidade de funcionários"
FROM Funcionarios AS F
GROUP BY
    F.Cargo
ORDER BY
    F.Cargo ASC;
