/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
18 de março de 2024 (2024-03-18), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

-- 1. Crie uma view que liste todos os clientes que realizaram pelo menos uma locação.

CREATE VIEW View_ClientesComLocacao
AS
SELECT
    C.Nome AS 'Cliente',
    C.CPF AS 'CPF',
    C.Email AS 'Endereço de Email',
    C.Telefone AS 'N°. Telefone'
FROM Clientes AS C
INNER JOIN Locacoes AS L
    ON C.Codigo = L.Cliente_Codigo
GROUP BY
    C.Codigo
ORDER BY
    C.Nome ASC;

-- 2. Desenvolva uma view que mostre a quantidade de bicicletas disponíveis em cada cidade.

CREATE VIEW View_QntdBicicletasPorCidade
AS
SELECT
    C.Nome AS 'Cidade',
    COUNT(*) AS 'Qntd. de Bicicletas'
FROM Cidades AS C
INNER JOIN Bicicletas AS B
    ON C.Codigo = B.Cidade_Codigo
GROUP BY
    C.Codigo
ORDER BY
    C.Nome ASC;

-- 5. Desenvolva uma view que liste os cinco clientes que mais realizaram locações, baseando-se no valor total gasto.

CREATE VIEW View_ClientesComMaisValoresPagosLocacoes
AS
SELECT
    C.Nome AS 'Cliente',
    SUM(L.ValorTotal) AS 'Soma dos valores de locações'
FROM Clientes AS C
INNER JOIN Locacoes AS L
    ON C.Codigo = L.Cliente_Codigo
GROUP BY
    C.Codigo
ORDER BY
    SUM(L.ValorTotal) DESC, C.Nome ASC
LIMIT 5;

-- 6. Elabore uma view que apresente o valor médio das locações por cidade.

CREATE VIEW View_ValorMedioLocacaoPorCidade
AS
SELECT
    C.Nome AS 'Cidade',
    ROUND(AVG(L.ValorTotal), 2) AS 'Valor médio das locações'
FROM Cidades AS C
INNER JOIN Bicicletas AS B
    ON C.Codigo = B.Cidade_Codigo
INNER JOIN Locacoes AS L
    ON B.Codigo = L.Bicicleta_Codigo
GROUP BY
    C.Codigo
ORDER BY
    C.Nome ASC; 

-- 8. Desenvolva uma view que mostre cada cliente e sua respectiva pontuação de bônus acumulada.

CREATE VIEW View_ClientesPontosAcumulados
AS
SELECT
    C.Nome AS 'Cliente',
    SUM(B.Pontos) AS 'Pontos Acumulados'
FROM Clientes AS C
INNER JOIN Bonus AS B
    ON C.Codigo = B.Cliente_Codigo
GROUP BY
    C.Codigo
ORDER BY
    C.Nome ASC;

-- 10. Crie uma view que mostre os tipos de bicicleta mais populares, baseando-se no número de vezes que foram alugadas.

CREATE VIEW View_BicicletasMaisPopulares
AS
SELECT
    B.Codigo AS 'Código',
    TB.Descricao AS 'Bicicleta',
    COUNT(*) AS 'Quantidades de alugueis'
FROM Bicicletas AS B
INNER JOIN TiposBicicletas AS TB
    ON B.TipoBicicleta_Codigo = TB.Codigo
INNER JOIN Locacoes AS L
    ON B.Codigo = L.Bicicleta_Codigo
GROUP BY
    B.Codigo
ORDER BY
    COUNT(*) DESC, 
    TB.Descricao ASC;


-- 12. Elabore uma view que identifique clientes que ainda não realizaram nenhuma locação.

CREATE VIEW View_ClientesSemLocacao
AS
SELECT
    C.Nome AS 'Cliente',
    C.CPF AS 'CPF',
    C.Email AS 'Endereço de Email',
    C.Telefone AS 'N°. Telefone'
FROM Clientes AS C
RIGHT JOIN Locacoes AS L
    ON C.Codigo = L.Cliente_Codigo
WHERE
    C.Codigo IS NULL
GROUP BY 
    C.Codigo
ORDER BY
    C.Nome ASC;

-- 13. Crie uma view que mostre o lucro total gerado por cada tipo de bicicleta.

CREATE VIEW View_LucroTotalPorTipoBicicleta
AS
SELECT
    TB.Descricao AS 'Tipo de Bicicleta',
    SUM(L.ValorTotal) AS 'Lucro Total'
FROM TiposBicicletas AS TB
INNER JOIN Bicicletas AS B
    ON TB.Codigo = B.TipoBicicleta_Codigo
INNER JOIN Locacoes AS L
    ON B.Codigo = L.Bicicleta_Codigo
GROUP BY
    TB.Codigo
ORDER BY
    TB.Descricao ASC;

-- 15. Elabore uma view que compare o número total de locações realizadas, agrupadas por estado.

CREATE VIEW View_QntdLocacoesPorEstado
AS
SELECT 
    C.Estado AS 'Estado',
    COUNT(*) AS 'Número total de locações'
FROM Locacoes AS L
INNER JOIN Bicicletas AS B
    ON L.Bicicleta_Codigo = B.Codigo
INNER JOIN Cidades AS C
    ON B.Cidade_Codigo = C.Codigo
GROUP BY
    C.Estado
ORDER BY
    C.Estado ASC;