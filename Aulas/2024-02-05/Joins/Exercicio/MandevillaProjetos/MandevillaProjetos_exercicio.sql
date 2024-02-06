-- Exercício 2 - Operadores JOINs

-- 1. Liste os empregados e os departamentos a que cada um pertence (nome do empregado, nome do departamento).

SELECT
	C.Nome AS 'Colaborador',
	D.Nome AS 'Departamento'
FROM Colaboradores AS C
INNER JOIN Departamentos AS D
	ON C.Departamento_Codigo = D.Codigo
ORDER BY 
	C.Nome ASC;

-- 2. Quais os projetos controlados pelo departamento de Informática (nome do projeto).

SELECT
	P.Nome AS 'Projeto controlado pelo depto. Informática'
FROM Projetos AS P
INNER JOIN Departamentos AS D ON
	P.Departamento_Codigo = D.Codigo
WHERE 
	D.Nome = 'Informática'
ORDER BY
	P.Nome ASC;

-- 3. Quais empregados trabalham no projeto XPTO e quantas horas trabalha cada um nesse projeto (nome do empregado, horas).
SELECT
	C.Nome AS 'Colaboradores do projeto XPTO',
	T.HorasSemanais AS 'Horas semanais trabalhadas'
FROM Colaboradores AS C
INNER JOIN Trabalhos AS T
	ON C.Codigo = T.Colaborador_Codigo
INNER JOIN Projetos AS P
	ON T.Projeto_Codigo = P.Codigo
WHERE 
	P.Nome = 'XPTO'
ORDER BY
	C.Nome ASC;

-- 4. Quais empregados trabalham no projeto XPTO e quantas horas trabalha cada um nesse projeto (nome do empregado, horas). Ordene a resposta pelo número de horas descendentemente.

SELECT
	C.Nome AS 'Colaboradores do projeto XPTO',
	T.HorasSemanais AS 'Horas semanais trabalhadas'
FROM Colaboradores AS C
INNER JOIN Trabalhos AS T
	ON C.Codigo = T.Colaborador_Codigo
INNER JOIN Projetos AS P
	ON T.Projeto_Codigo = P.Codigo
WHERE 
	P.Nome = 'XPTO'
ORDER BY
	T.HorasSemanais DESC;

-- 5. Quantos empregados trabalham em cada projeto? (nome do projeto, número de empregados).

SELECT
	P.Nome AS 'Projeto',
	COUNT(C.Codigo) AS 'Número de empregados'
FROM Projetos AS P
INNER JOIN Trabalhos AS T
	ON P.Codigo = T.Projeto_Codigo
INNER JOIN Colaboradores AS C
	ON T.Colaborador_Codigo = C.Codigo
GROUP BY
	P.Codigo;
    
-- 6. Quantas horas são gastas semanalmente em cada projeto? (nome do projeto, horas).

SELECT
	P.Nome AS 'Projeto',
	SUM(T.HorasSemanais) AS 'Horas gastas semanalmente'
FROM Projetos AS P
INNER JOIN Trabalhos AS T
	ON P.Codigo = T.Projeto_Codigo
INNER JOIN Colaboradores AS C
	ON T.Colaborador_Codigo = C.Codigo
GROUP BY
	P.Codigo;

-- 7. Quantas horas cada empregado gasta em projetos? (nome do empregado, horas).

SELECT
	C.Nome AS 'Colaborador',
	SUM(T.HorasSemanais) AS 'Horas gastas semanalmente'
FROM Colaboradores AS C
INNER JOIN Trabalhos AS T
	ON C.Codigo = T.Colaborador_Codigo
INNER JOIN Projetos AS P
	ON T.Projeto_Codigo = P.Codigo
GROUP BY
	C.Codigo;

-- 8. Qual o salário máximo em cada departamento? (nome departamento, salário máximo).
    
SELECT
	D.Nome AS 'Departamento',
	MAX(C.Salario) AS 'Maior salário'
FROM Departamentos AS D
INNER JOIN Colaboradores AS C
	ON D.Codigo = C.Departamento_Codigo
GROUP BY
	D.Codigo
ORDER BY
	D.Nome ASC;

-- 9. Qual a diferença entre o salário mais alto e o mais baixo da empresa? (diferença).

SELECT
	MAX(Salario) AS 'Maior salário',
	MIN(Salario) AS 'Menor salário',
	(MAX(Salario) - MIN(Salario)) AS 'Diferença'
FROM Colaboradores;

-- 10. Quais os departamentos em que o salário médio é superior a 1300 euros? (nome do departamento).

SELECT
	D.Nome AS 'Departamentos com salário médio superior a ¢ 1300',
	ROUND(AVG(C.Salario), 2) AS 'Média salarial'
FROM Departamentos AS D
	INNER JOIN Colaboradores AS C
ON D.Codigo = C.Departamento_Codigo
WHERE 
	(SELECT AVG(Salario) FROM Colaboradores C1 WHERE C1.Departamento_Codigo = D.Codigo) > 1300
GROUP BY
	D.Codigo
ORDER BY
	D.Nome ASC;
