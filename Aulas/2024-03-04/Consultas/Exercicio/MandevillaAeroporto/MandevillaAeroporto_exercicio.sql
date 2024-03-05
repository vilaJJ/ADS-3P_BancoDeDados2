/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
04 de março de 2024 (2024-03-04), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

-- 1. Liste o local e o nome de todos os aeroportos de Portugal (local, nome).

SELECT 
    Nome AS 'Aeroportos em Portugal', 
    Local AS 'Cidades' 
FROM Aeroportos
WHERE 
    Pais = 'Portugal'
GROUP BY 
    Codigo
ORDER BY 
    Nome ASC;

-- 2. Liste os nomes de todos os aviões da versão DC-10 (nome).

SELECT 
    A.Nome AS "Aviões 'DC-10'"
FROM Avioes AS A
INNER JOIN Modelos AS M
    ON A.Modelo_Codigo = M.Codigo
WHERE
    M.Codigo = 1
GROUP BY 
    A.Codigo
ORDER BY 
    A.Nome ASC;

-- 3. Liste para cada avião, a quantidade de motores necessários (nome_avião, num_motores).

SELECT 
    A.Nome AS "Avião",
    M.QntdMotores AS 'Quantidade de Motores'
FROM Avioes AS A
INNER JOIN Modelos AS M
    ON A.Modelo_Codigo = M.Codigo
GROUP BY 
    A.Codigo
ORDER BY 
    A.Nome ASC;
    
-- 4. Quantos voos com a duração de 2 ou 3 horas há no sistema (contagem)?

SELECT 
    COUNT(Codigo) AS 'Quantidade de voos de duração de 2 ou 3 horas' 
FROM Voos
WHERE
    HorasVoo IN(2, 3);

-- 5. Liste todos os modelos de avião da série A3xx , isto é, em que a versão começa pelo texto A3 (versão).

SELECT 
    A.Nome AS "Aviões da série 'A3xx'",
    M.Versao AS 'Versão'
FROM Avioes AS A
INNER JOIN Modelos AS M
    ON A.Modelo_Codigo = M.Codigo
WHERE 
    M.Versao LIKE 'A3%'
GROUP BY 
    A.Codigo
ORDER BY 
    A.Nome ASC;

-- 6. Liste os códigos de todos os voos ordenados por duração, voos mais compridos primeiro; para o caso de voos de igual duração, ordene crescentemente pelo código do vôo (codvoo, duração).

SELECT 
    Codigo AS 'Código do Voo',
    HorasVoo AS 'Horas de Voo'
FROM Voos
GROUP BY 
    Codigo
ORDER BY 
    HorasVoo DESC, 
    Codigo ASC;

-- 7. Tendo em conta que não existe nenhum voo direto do aeroporto de código 1 (Porto) para o aeroporto de código 12 (Londres), liste todos as escalas possíveis (cód_voo1,cód_voo2, código_aeroporto_da_escala). Sugestão: Utilize os códigos dos aeroportos (1 e 12) na pesquisa.

SELECT
*,
V1.Codigo,
V2.Codigo
FROM Voos AS V1
INNER JOIN Voos AS V2
INNER JOIN Aeroportos AS A_Origem
ON V1.Aeroporto_Inicio = A_Origem.Codigo
WHERE
V1.Aeroporto_Inicio = 1 AND
V2.Aeroporto_Fim = 12;



-- 8. Quantos aeroportos há por país ordene a resposta por ordem decrescente (país, contagem)?

SELECT
    Pais AS 'País',
    COUNT(Codigo) AS 'Quantidade de Aeroportos'
FROM Aeroportos
GROUP BY 
    Pais
ORDER BY 
    COUNT(Codigo) DESC, 
    Pais ASC;

-- 9. Liste ordenadamente todos os voos, respectivo local de origem e local de destino, ordenando pelo código de voo crescente (codvoo, de_local, para_local). Apresente as colunas como Código do Voo , Origem e Destino.

SELECT
    V.Codigo AS 'Código do Voo',
    A_Origem.Nome AS 'Origem',
    A_Destino.Nome AS 'Destino'
FROM Voos AS V
INNER JOIN Aeroportos AS A_Origem
    ON V.Aeroporto_Inicio = A_Origem.Codigo
INNER JOIN Aeroportos AS A_Destino
    ON V.Aeroporto_Fim = A_Destino.Codigo
GROUP BY 
    V.Codigo
ORDER BY
    V.Codigo ASC;

-- 10. Liste os códigos dos voos de Porto para Lisboa (codvoo) ? Atenção: A pesquisa não se pode basear nos atuais códigos de aeroportos, e deve funcionar mesmo se os códigos de aeroportos mudarem.

SELECT
V.Codigo AS "Códigos de Voos de 'Porto' para 'Lisboa'"
FROM Voos AS V
INNER JOIN Aeroportos AS A_Origem
    ON V.Aeroporto_Inicio = A_Origem.Codigo
INNER JOIN Aeroportos AS A_Destino
    ON V.Aeroporto_Fim = A_Destino.Codigo
WHERE
    A_Origem.Local = 'Porto' AND
    A_Destino.Local = 'Lisboa'
GROUP BY 
    V.Codigo
ORDER BY
    V.Codigo ASC;

-- 11. Conte o número de aeroportos por país (país, contagem); mostre apenas os países com mais de 2 aeroportos.

SELECT
    Pais AS 'País',
    COUNT(Codigo) AS 'Quantidade de Aeroportos'
FROM Aeroportos
GROUP BY 
    Pais
HAVING 
    COUNT(Codigo) > 2
ORDER BY 
    COUNT(Codigo) DESC, 
    Pais ASC;

-- 12. Qual o país, ou países, com mais aeroportos e com quantos aeroportos ? (país, contagem)

SELECT  
    Pais AS 'Países com mais aeroportos (mais que 2)',
    COUNT(Codigo) AS 'Quantidade'
FROM Aeroportos
GROUP BY
    Pais
HAVING
    COUNT(Codigo) = (
        SELECT 
            COUNT(Codigo) 
        FROM Aeroportos 
        GROUP BY 
            Pais 
        ORDER BY 
            COUNT(Codigo) DESC 
        LIMIT 1
        );

-- 13. Liste para cada voo, qual o nome do aeroporto de partida e de chegada (cod_voo, nome_aerop_part, nome_aerop_cheg); ordene a resposta alfabeticamente pelo nome do aeroporto de partida e depois pelo nome do aeroporto de chegada.

SELECT
    V.Codigo AS 'Código do Voo',
    A_Inicio.Nome AS 'Aeroporto de Partida',
    A_Fim.Nome AS 'Aeroporto de Chegada'
FROM Voos AS V
INNER JOIN Aeroportos AS A_Inicio
    ON V.Aeroporto_Inicio = A_Inicio.Codigo
INNER JOIN Aeroportos AS A_Fim
    ON V.Aeroporto_Fim = A_Fim.Codigo
GROUP BY 
    V.Codigo
ORDER BY 
    A_Inicio.Nome ASC, 
    A_Fim.Nome ASC, 
    V.Codigo ASC;

-- 14. Liste para cada modelo, quantos aviões realmente existem. Ordene a listagem tal forma que os modelos mais frequentes apareçam em último lugar (construtor, versão, contagem). Omita da listagem aviões com contagem nula.

SELECT
    M.Construtor AS 'Construtor',
    M.Versao AS 'Versão',
    COUNT(A.Codigo) AS 'Quantidade de Aviões'
FROM Modelos AS M
INNER JOIN Avioes AS A
    ON M.Codigo = A.Modelo_Codigo
GROUP BY
    M.Codigo
ORDER BY
    COUNT(A.Codigo) ASC,
    M.Construtor ASC,
    M.Versao ASC;

-- 15. Liste para cada modelo, quantos aviões realmente existem. Ordene a listagem tal forma que os modelos mais frequentes apareçam em último lugar (construtor, versão, contagem). Omita da listagem aviões com contagem nula.

SELECT
    M.Construtor AS 'Construtor',
    M.Versao AS 'Versão',
    COUNT(A.Codigo) AS 'Quantidade de Aviões'
FROM Modelos AS M
INNER JOIN Avioes AS A
    ON M.Codigo = A.Modelo_Codigo
GROUP BY
    M.Codigo
ORDER BY
    COUNT(A.Codigo) ASC,
    M.Construtor ASC,
    M.Versao ASC;