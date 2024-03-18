/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
11 de março de 2024 (2024-03-11), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

-- 1. Crie uma view a qual liste o título, autor e data de lançamento dos livros em ordem de título.

CREATE VIEW View_Livros
AS
SELECT
    Titulo AS 'Título',
    Autor AS 'Autor',
    DataLancamento AS 'Data de Lançamento'
FROM Livros
ORDER BY
    Titulo ASC;

-- 2. Crie uma view a qual liste os livros lançados em 2011 ou 2012.

CREATE VIEW View_Livros_Beetween_2011_2012
AS
SELECT
    Titulo AS 'Título',
    Autor AS 'Autor',
    DATE_FORMAT(DataLancamento, '%d/%m/%Y') AS 'Data de Lançamento'
FROM Livros
WHERE
    YEAR(DataLancamento) BETWEEN 2011 AND 2012
ORDER BY
    Titulo ASC;

-- 3. Crie uma view a qual liste os livros que o título contenha a palavra "Redes".

CREATE VIEW View_Livros_Redes
AS
SELECT
    Titulo AS 'Título',
    Autor AS 'Autor',
    DATE_FORMAT(DataLancamento, '%d/%m/%Y') AS 'Data de Lançamento'
FROM Livros
WHERE
    Titulo LIKE '%Redes%'
ORDER BY
    Titulo ASC;

-- 4. Crie uma view a qual liste o título, nome do assunto e nº cópias dos livros.

CREATE VIEW View_Livros_Assuntos_Copias
AS
SELECT
    L.Titulo AS 'Título',
    A.Nome AS 'Assunto',
    L.Copias AS 'N° de Cópias'
FROM Livros AS L
INNER JOIN Assuntos AS A
    ON L.Assunto_Codigo = A.Codigo
ORDER BY 
    Titulo ASC;

-- 5. Crie uma view a qual liste o título e autor dos livros que o nome do assunto seja "Banco de dados".

CREATE VIEW View_Livros_Assunto_BD
AS
SELECT
    L.Titulo AS 'Título',
    A.Nome AS 'Assunto'
FROM Livros AS L
INNER JOIN Assuntos AS A
    ON L.Assunto_Codigo = A.Codigo 
    AND A.Nome = 'Banco de dados'
ORDER BY 
    Titulo ASC;

-- 6. Crie uma view a qual liste o nome do assunto e nº de livros, agrupados por nome do assunto.

CREATE VIEW View_Num_Livros_Por_Assunto
AS
SELECT
    A.Nome AS 'Assunto',
    COUNT(*) AS 'N° de Livros'
FROM
Assuntos AS A
INNER JOIN Livros AS L
    ON A.Codigo = L.Assunto_Codigo
GROUP BY
    A.Codigo
ORDER BY
    A.Nome ASC;

-- 7. Crie uma view a qual some os valores das multas dos empréstimos dos livros retirados em 2013.

CREATE VIEW View_Soma_Multas_2013
AS
SELECT
    SUM(Multa) AS 'Soma das multas de 2013'
FROM Emprestimos
WHERE
    YEAR(DataEmprestimo) = 2013;