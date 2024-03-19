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