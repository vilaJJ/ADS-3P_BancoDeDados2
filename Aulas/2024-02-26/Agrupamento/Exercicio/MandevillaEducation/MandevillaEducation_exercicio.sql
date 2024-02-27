/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
26 de fevereiro de 2024 (2024-02-26), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

-- 1. Crie uma consulta com todas as disciplinas oferecidas no ano de 2018, constando os nomes das disciplinas, nomes e cidades dos professores responsáveis e nomes dos cursos das disciplinas.

SELECT
    D.Nome AS 'Nome',
    P.Nome AS 'Professor',
    P.Cidade AS 'Cidade do Professor',
    C.Nome AS 'Curso'
FROM Disciplina AS D
INNER JOIN DisciplinaProfessor AS DP
    ON D.Codigo = DP.Disciplina_Codigo
INNER JOIN Professor AS P
    ON DP.Professor_Codigo = P.Codigo
INNER JOIN Curso AS C
    ON D.Curso_Codigo = C.Codigo
WHERE 
    DP.Ano = 2018
GROUP BY
    D.Codigo
ORDER BY
    D.Nome ASC;

-- 2. Crie uma consulta que mostre todos os nomes dos professores do curso de CST Sistemas para Internet, no ano de 2018, e os nomes das disciplinas pelas quais são responsáveis.

SELECT
    P.Nome AS 'Professores do curso "CST Sistemas para Internet" de 2018',
    GROUP_CONCAT(D.Nome SEPARATOR ', ') AS 'Disciplinas'
FROM Professor AS P
INNER JOIN DisciplinaProfessor AS DP
    ON P.Codigo = DP.Professor_Codigo
INNER JOIN Disciplina AS D
    ON DP.Disciplina_Codigo = D.Codigo
WHERE
    D.Curso_Codigo = 3 AND
    DP.Ano = 2018
GROUP BY
    P.Codigo
ORDER BY
    P.Nome ASC, D.Nome ASC;

-- 3. Crie uma consulta com todos os nomes de alunos matriculados no ano de 2018, os nomes das disciplinas em que estão matriculados, a cidade onde moram e os nomes dos cursos das disciplinas.

SELECT
    A.Nome AS 'Aluno',
    A.Cidade AS 'Cidade',
    C.Nome AS 'Curso',
    GROUP_CONCAT(D.Nome SEPARATOR ', ') AS 'Disciplinas'    
FROM Aluno AS A
INNER JOIN Matricula AS M
    ON A.Codigo = M.Aluno_Codigo
INNER JOIN Disciplina AS D
    ON M.Disciplina_Codigo = D.Codigo
INNER JOIN Curso AS C
    ON D.Curso_Codigo = C.Codigo
WHERE
    M.Ano = 2018
GROUP BY
    A.Codigo
ORDER BY
    A.Nome ASC, D.Nome ASC;

-- 4. Crie uma consulta que mostre todos os alunos de Palmas que cursam alguma disciplina de Programação de Banco de dados no ano de 2018.

SELECT
    A.Nome AS 'Alunos de Palmas que cursaram "Programação de Banco de Dados" em 2018'
FROM Aluno AS A
INNER JOIN Matricula AS M
    ON A.Codigo = M.Aluno_Codigo
INNER JOIN Disciplina AS D
    ON M.Disciplina_Codigo = D.Codigo
WHERE
    A.Cidade = 'Palmas' AND 
    D.Codigo = 11 AND
    M.Ano = 2018
GROUP BY
    A.Codigo
ORDER BY
    A.Nome ASC;

-- 5. Crie uma consulta que mostre todos os professores que não moram em Palmas e que ministram alguma disciplina no curso de CST Sistemas para Internet.

SELECT 
    P.Nome as 'Professor fora de Palmas que ministra no curso CST Sistemas para Internet'
FROM Professor AS P
INNER JOIN DisciplinaProfessor AS DP
    ON P.Codigo = DP.Professor_Codigo
INNER JOIN Disciplina AS D
    ON DP.Disciplina_Codigo = D.Codigo
WHERE
    P.Cidade <> 'Palmas' AND
    D.Curso_Codigo = 3
GROUP BY
    P.Codigo
ORDER BY
    P.Nome ASC;

-- 6. Crie uma consulta que mostre o nome dos professores e a média de aulas que ministram.

SELECT
    P.Nome AS 'Professor',
    ROUND(AVG(D.QuantidadeAulas), 1) AS 'Média de Aulas Ministradas'
FROM Professor AS P
INNER JOIN DisciplinaProfessor AS DP
    ON P.Codigo = DP.Professor_Codigo
INNER JOIN Disciplina AS D
    ON DP.Disciplina_Codigo = D.Codigo
GROUP BY
    P.Codigo
ORDER BY
    P.Nome ASC;

-- 7. Crie uma consulta que mostre o nome dos professores o total de aulas que ministram por curso.

SELECT
    P.Nome AS 'Professor',
    C.Nome AS 'Curso',
    SUM(D.QuantidadeAulas) AS 'Total de Aulas Ministradas'
FROM Professor AS P
INNER JOIN DisciplinaProfessor AS DP
    ON P.Codigo = DP.Professor_Codigo
INNER JOIN Disciplina AS D
    ON DP.Disciplina_Codigo = D.Codigo
INNER JOIN Curso AS C
    ON D.Curso_Codigo = C.Codigo
GROUP BY
    P.Codigo, C.Codigo
ORDER BY
    P.Nome ASC;

-- 8. Crie uma consulta que mostre o nome do aluno, nome do curso, código e nome das disciplinas matriculadas de todos os alunos no ano de 2018.

SELECT
    A.Codigo AS 'Código',
    A.Nome AS 'Aluno',
    C.Nome AS 'Curso',
    GROUP_CONCAT(D.Nome SEPARATOR ', ') AS 'Disciplinas'
FROM Aluno AS A
INNER JOIN Matricula AS M
    ON A.Codigo = M.Aluno_Codigo
INNER JOIN Disciplina AS D
    ON M.Disciplina_Codigo = D.Codigo
INNER JOIN Curso AS C
    ON D.Curso_Codigo = C.Codigo
WHERE
    M.Ano = 2018
GROUP BY
    A.Codigo
ORDER BY
    A.Nome ASC, D.Nome ASC;