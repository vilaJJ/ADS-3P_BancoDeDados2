/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
01 de abril de 2024 (2024-04-01), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

-- 1. Crie uma view chamada ‘View_UserRoles’ que exiba o nome e o papel (UserRole) de cada usuário.

CREATE VIEW View_UserRoles
AS
SELECT
    U.Nome AS "Usuário",
    FU.Nome AS "Papel"
FROM Usuarios AS U
INNER JOIN FuncoesUsuarios AS FU
    ON U.Funcao_Codigo = FU.Codigo
GROUP BY 
    U.Codigo
ORDER BY
    U.Nome ASC, 
    FU.Nome ASC;

-- 2. Desenvolva uma view ‘View_ProjectSummary’ que mostre o título do projeto, o nome do empreendedor e a quantidade total arrecadada.

CREATE VIEW View_ProjectSummary
AS
SELECT
    P.Titulo AS "Projeto",
    U.Nome AS "Empreendedor",
    P.ValorArrecadado AS "Total arrecadado (R$)"
FROM Projetos AS P
INNER JOIN Usuarios AS U
    ON P.Usuario_Codigo = U.Codigo
GROUP BY
    P.Codigo
ORDER BY
    P.Titulo ASC, 
    U.Nome ASC, 
    P.ValorArrecadado DESC;

-- 3. Elabore uma view ‘View_InvestmentsDetails’ para exibir detalhes dos investimentos, incluindo o título do projeto, o nome do investidor e o montante investido.

CREATE VIEW View_InvestmentsDetails
AS
SELECT
    P.Titulo AS "Projeto",
    U.Nome AS "Investidor",
    I.Valor AS "Investimento (R$)"
FROM Investimentos AS I
INNER JOIN Projetos AS P
    ON I.Projeto_Codigo = P.Codigo
INNER JOIN Usuarios AS U
    ON I.UsuarioInvestidor_Codigo = U.Codigo
GROUP BY
    I.Codigo
ORDER BY
    P.Titulo ASC, 
    U.Nome ASC, 
    I.Valor DESC;

-- 4. Crie uma view ‘View_ActiveProjects’ que liste todos os projetos ainda ativos (considerando a data atual como referência).

CREATE VIEW View_ActiveProjects
AS
SELECT 
    Titulo AS "Projetos ativos",
    DataInicio AS "Data de início",
    DataFinalizacao AS "Data de finalização"
FROM Projetos
WHERE 
    NOW() BETWEEN DataInicio AND DataFinalizacao
GROUP BY
    Codigo
ORDER BY
    Titulo ASC;

-- 5. Desenvolva uma view ‘View_ProjectsByCategory’ que agrupe os projetos por categoria, exibindo o nome da categoria e a quantidade de projetos em cada uma.

CREATE VIEW View_ProjectsByCategory
AS
SELECT
    CP.Nome AS "Categoria",
    COUNT(P.Codigo) AS "Quantidade de projetos"
FROM
CategoriasProjetos AS CP
INNER JOIN Projetos AS P
    ON CP.Codigo = P.Categoria_Codigo
GROUP BY
    CP.Codigo
ORDER BY
    CP.Nome ASC, 
    COUNT(P.Codigo) DESC;

-- 6. Elabore uma view ‘View_HighRatedProjects’ que mostre os projetos com uma avaliação média superior a 4.

CREATE VIEW View_HighRatedProjects
AS
SELECT
    P.Titulo AS "Projeto",
    CAST(AVG(AP.Nota) AS DECIMAL(5, 1)) AS "Nota média"
FROM Projetos AS P
INNER JOIN AnalisesProjetos AS AP
    ON P.Codigo = AP.Projeto_Codigo
GROUP BY
    P.Codigo
HAVING
    AVG(AP.Nota) > 4
ORDER BY
    P.Titulo ASC, 
    AVG(AP.Nota) DESC;

-- 7. Crie uma view ‘View_EventParticipantsCount’ que conte o número de participantes para cada evento.

CREATE VIEW View_EventParticipantsCount
AS
SELECT
    E.Titulo AS "Evento",
    COUNT(PE.Usuario_Codigo) AS "Quantidade de participantes"
FROM
Eventos AS E
INNER JOIN ParticipantesEventos AS PE
    ON E.Codigo = PE.Evento_Codigo
GROUP BY
    E.Codigo
ORDER BY
    E.Titulo ASC, 
    COUNT(PE.Usuario_Codigo) DESC;

-- 8. Desenvolva uma view ‘View_InvestorInterests’ para exibir os interesses de cada investidor, mostrando o nome do investidor e as categorias de interesse.

CREATE VIEW View_InvestorInterests
AS
SELECT
    U.Nome AS "Investidor",
    GROUP_CONCAT(CP.Nome SEPARATOR ", ") AS "Categoria de interesse"
FROM InteressesInvestidores AS II
INNER JOIN Usuarios AS U
    ON II.UsuarioInvestidor_Codigo = U.Codigo
INNER JOIN CategoriasProjetos AS CP
    ON II.CategoriaProjeto_Codigo = CP.Codigo
GROUP BY
    U.Codigo
ORDER BY
    CP.Nome ASC, 
    U.Nome ASC;

-- 9. Elabore uma view ‘View_ProjectsWithNoInvestments’ que liste os projetos que ainda não receberam nenhum investimento.

CREATE VIEW View_ProjectsWithNoInvestments
AS
SELECT
    P.Titulo AS "Projetos sem investimentos"
FROM Projetos AS P
LEFT JOIN Investimentos AS I
    ON P.Codigo = I.Projeto_Codigo
WHERE 
    I.Projeto_Codigo = null
GROUP BY
    P.Codigo
ORDER BY
    P.Titulo ASC;

-- 10. Crie uma view ‘View_RecentInvestments’ para mostrar os investimentos realizados nos últimos 30 dias.

CREATE VIEW View_RecentInvestments
AS
SELECT 
    P.Titulo AS "Projetos investidos nos últimos 30 dias",
    U.Nome AS "Investidor",
    I.Valor AS "Valor investido (R$)"
FROM Investimentos AS I
INNER JOIN Projetos AS P
    ON I.Projeto_Codigo = P.Codigo
INNER JOIN Usuarios AS U
    ON I.UsuarioInvestidor_Codigo = U.Codigo
WHERE
    DATEDIFF(NOW(), I.DataInvestimento) >= 30
GROUP BY
    I.Codigo
ORDER BY
    P.Titulo ASC, 
    U.Nome ASC, 
    I.Valor DESC;

-- 11. Desenvolva uma view ‘View_TopInvestors’ que exiba os 5 investidores com maior montante total investido.

CREATE VIEW View_TopInvestors
AS
SELECT
    U.Nome AS "Investidor",
    SUM(I.Valor) AS "Total investido (R$)"
FROM Usuarios AS U
INNER JOIN Investimentos AS I
    ON U.Codigo = I.UsuarioInvestidor_Codigo
GROUP BY
    U.Codigo
ORDER BY
    SUM(I.Valor) DESC, 
    U.Nome ASC 
    LIMIT 5;

-- 12. Elabore uma view ‘View_ProjectFeedback’ que mostre o feedback dos usuários para cada projeto, incluindo o nome do usuário, o título do projeto e os comentários.

CREATE VIEW View_ProjectFeedback
AS
SELECT
    P.Titulo AS "Projeto",
    U.Nome AS "Avaliador",
    AP.Comentarios AS "Comentários",
    AP.Nota AS "Nota"
FROM AnalisesProjetos AS AP
INNER JOIN Projetos AS P
    ON AP.Projeto_Codigo = P.Codigo
INNER JOIN Usuarios AS U
    ON AP.UsuarioAvaliador_Codigo = U.Codigo
GROUP BY
    AP.Codigo
ORDER BY
    AP.DataAnalise ASC, 
    P.Titulo ASC, 
    U.Nome ASC, 
    AP.Comentarios ASC, 
    AP.Nota DESC;

-- 13. Crie uma view ‘View_FullProjectDetails’ que combine informações de projetos, investimentos, e avaliações, fornecendo uma visão completa de cada projeto.

CREATE VIEW View_FullProjectDetails
AS
SELECT
    P.Titulo AS "Projeto",
    CP.Nome AS "Categoria",
    P.Descricao AS "Descrição",
    U.Nome AS "Idealizador",
    SUM(I.Valor) AS "Investimentos recebidos (R$)",
    CAST(AVG(AP.Nota) AS DECIMAL(2, 1)) AS "Nota média"
FROM Projetos AS P
INNER JOIN Investimentos AS I
    ON P.Codigo = I.Projeto_Codigo
INNER JOIN CategoriasProjetos AS CP
    ON P.Categoria_Codigo = CP.Codigo
INNER JOIN Usuarios AS U
    ON P.Usuario_Codigo = U.Codigo
INNER JOIN AnalisesProjetos AS AP
    ON P.Codigo = AP.Projeto_Codigo
GROUP BY
    P.Codigo
ORDER BY
    P.Titulo ASC, 
    CP.Nome ASC, 
    P.Descricao ASC, 
    U.Nome ASC, 
    SUM(I.Valor) DESC, 
    AVG(AP.Nota) DESC;

-- 14. Desenvolva uma view ‘View_CategoryInvestments’ que mostre o total investido por categoria de projeto.

CREATE VIEW View_CategoryInvestments
AS
SELECT
    CP.Nome AS "Categoria",
    SUM(I.Valor) AS "Investimentos recebidos (R$)"
FROM CategoriasProjetos AS CP
INNER JOIN Projetos AS P
    ON CP.Codigo = P.Categoria_Codigo
INNER JOIN Investimentos AS I
    ON P.Codigo = I.Projeto_Codigo
GROUP BY
    CP.Codigo
ORDER BY
    CP.Nome ASC, 
    SUM(I.Valor) DESC;

-- 15. Elabore uma view ‘View_UserActivity’ que indique a atividade de cada usuário, baseando-se na quantidade de investimentos feitos, projetos criados, e eventos participados.

CREATE VIEW View_UserActivity
AS
SELECT
    U.Nome AS "Usuário",
    (SELECT COUNT(*) FROM Investimentos AS I WHERE I.UsuarioInvestidor_Codigo = U.Codigo) AS "Investimentos feitos",
    (SELECT COUNT(*) FROM Projetos AS P WHERE P.Usuario_Codigo = U.Codigo) AS "Projetos criados",
    (SELECT COUNT(*) FROM ParticipantesEventos AS PE WHERE PE.Usuario_Codigo = U.Codigo) AS "Eventos participados"
FROM Usuarios AS U
GROUP BY
    U.Codigo
ORDER BY
    U.Nome ASC;
