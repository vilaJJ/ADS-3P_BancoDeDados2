/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
06 de maio de 2024 (2024-05-06), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

/* Questão 1: Criação de Procedure  
Crie uma Stored Procedure chamada `adicionarAutor` que permita inserir um novo autor no banco de dados. A procedure deve aceitar o nome do autor como parâmetro. */

DELIMITER ##

CREATE PROCEDURE adicionarAutor(IN Nome VARCHAR(255))
BEGIN
    INSERT INTO Autores (Nome) VALUES (Nome);
END;

DELIMITER ;

/* Questão 2: Utilização de Procedure  
Utilize a Stored Procedure `adicionarAutor` para inserir três autores: "J.K. Rowling", "George R.R. Martin", e "Isaac Asimov".*/

CALL adicionarAutor("J.K. Rowling");

CALL adicionarAutor("George R.R. Martin");

CALL adicionarAutor("Isaac Asimov");

/* Questão 3: Procedure com Parâmetros de Saída 
Desenvolva uma Stored Procedure chamada `contarLivrosPorAutor` que receba o ID de um autor como entrada e retorne o número total de livros publicados por esse autor. */

DELIMITER ##

CREATE PROCEDURE contarLivrosPorAutor(IN idAutor INT, OUT quantidade INT)
BEGIN
    SELECT COUNT(AutorID) INTO quantidade FROM Livros WHERE AutorID = idAutor;
END;

DELIMITER ;

/* Questão 4: Procedure de Atualização
Crie uma Stored Procedure chamada `atualizarEmailUsuario` que permita atualizar o endereço de email de um usuário. A procedure deve receber o ID do usuário e o novo email como parâmetros. */

DELIMITER ##

CREATE PROCEDURE atualizarEmailUsuario(IN idUsuario INT, IN email VARCHAR(255))
BEGIN
    UPDATE Usuarios SET Email = email WHERE UsuarioID = idUsuario;
END;

DELIMITER ;

/* Questão 5: Procedure de Exclusão  
Desenvolva uma Stored Procedure chamada `removerLivro` que permita remover um livro do banco de dados com base no ID do livro. */

DELIMITER ##

CREATE PROCEDURE removerLivro(IN idLivro INT)
BEGIN
    DELETE FROM Livros WHERE LivroID = idLivro;
END;

DELIMITER ;

/* Questão 6: Procedure de Consulta 
Crie uma Stored Procedure chamada `listarEmprestimosPorUsuario` que liste todos os empréstimos feitos por um usuário específico, incluindo os títulos dos livros e as datas de empréstimo e devolução. */

DELIMITER ##

CREATE PROCEDURE listarEmprestimosPorUsuario(IN idUsuario INT)
BEGIN
    SELECT
        L.Titulo AS 'Livro',
        DATE_FORMAT(E.DataEmprestimo, '%d/%m/%Y') AS 'Data de Empréstimo',
        DATE_FORMAT(E.DataDevolucao, '%d/%m/%Y') AS 'Data de Devolução'
    FROM Emprestimos AS E
    INNER JOIN Livros AS L
        ON E.LivroID = L.LivroID
    WHERE 
        E.UsuarioID = idUsuario
    GROUP BY
        E.EmprestimoID
    ORDER BY
        E.DataEmprestimo ASC;
END;

DELIMITER ;

/*Questão 7: Procedure de Multi-tabelas 
Elabore uma Stored Procedure chamada `detalhesLivro` que retorne informações detalhadas de um livro, incluindo título, ano de publicação, nome do autor e nome da editora, dado o ID do livro. */

DELIMITER ##

CREATE PROCEDURE detalhesLivro(IN idLivro INT)
BEGIN
    SELECT
        L.Titulo AS 'Título',
        L.AnoPublicacao AS 'Ano de publicação',
        A.Nome AS 'Autor(a)',
        E.Nome AS 'Editora'
    FROM Livros AS L
    INNER JOIN Autores AS A
        ON L.AutorID = A.AutorID
    INNER JOIN Editoras AS E
        ON L.EditoraID = E.EditoraID
    WHERE
        L.LivroID = idLivro
    GROUP BY
        L.LivroID
    ORDER BY
        L.Titulo ASC;
END;

DELIMITER ;