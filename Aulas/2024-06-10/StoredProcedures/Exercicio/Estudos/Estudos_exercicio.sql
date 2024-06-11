/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
10 de junho de 2024 (2024-06-10), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

-- Criação de uma Stored Procedure Simples:
-- 01. Crie uma Stored Procedure chamada SelecionarTodosUsuarios que selecione todos os registros da tabela usuarios.

DELIMITER ##

CREATE PROCEDURE SelecionarTodosUsuarios ()
BEGIN
    SELECT
        U.nome AS 'Aluno',
        U.email AS 'Endereço de e-mail',
        DATE_FORMAT(U.data_criacao, '%d/%m/%Y') AS 'Data de Criação'
    FROM `Estudos`.usuarios AS U
    ORDER BY
        U.nome ASC,
        U.email ASC,
        U.data_criacao ASC;
END;

DELIMITER;

-- Uso de Parâmetros de Entrada:
-- 02. Crie uma Stored Procedure chamada SelecionarUsuarioPorId que receba um parâmetro usuario_id e selecione o registro correspondente na tabela usuarios.

DELIMITER ##

CREATE PROCEDURE SelecionarUsuarioPorId (IN UsuarioID INT)
BEGIN
    SELECT
        U.nome AS 'Aluno',
        U.email AS 'Endereço de e-mail',
        DATE_FORMAT(U.data_criacao, '%d/%m/%Y') AS 'Data de Criação'
    FROM `Estudos`.usuarios AS U
    WHERE
        U.id = UsuarioID
    ORDER BY
        U.nome ASC,
        U.email ASC,
        U.data_criacao ASC;
END;

DELIMITER;

-- Uso de Parâmetros de Saída:
-- 03. Crie uma Stored Procedure chamada ObterNomeUsuario que receba um parâmetro de entrada usuario_id e retorne o nome do usuário através de um parâmetro de saída nome_usuario.

DELIMITER ##

CREATE PROCEDURE ObterNomeUsuario (IN UsuarioId INT, OUT UsuarioNome VARCHAR(100))
BEGIN
    SELECT
        U.nome
    FROM `Estudos`.usuarios as U
    WHERE 
        U.id = UsuarioId
    INTO UsuarioNome;
END;

DELIMITER;

-- Inserção de Dados:
-- 04. Crie uma Stored Procedure chamada InserirNovoCurso que receba os parâmetros nome, descricao, data_inicio, e data_fim, e insira um novo registro na tabela cursos.

DELIMITER ##

CREATE PROCEDURE InserirNovoCurso (IN NomeCurso VARCHAR(100), IN Descricao TEXT, IN DataInicio DATE, IN DataFim DATE)
BEGIN
    INSERT INTO `Estudos`.cursos (nome, descricao, data_inicio, data_fim) VALUES
    (NomeCurso, Descricao, DataInicio, DataFim);
END;

DELIMITER;

-- Atualização de Dados:
-- 05. Crie uma Stored Procedure chamada AtualizarDescricaoCurso que receba os parâmetros curso_id e nova_descricao, e atualize a descrição do curso correspondente.

DELIMITER ##

CREATE PROCEDURE AtualizarDescricaoCurso (IN CursoId INT, IN DescricaoNova TEXT)
BEGIN
    UPDATE `Estudos`.cursos
    SET
        descricao = DescricaoNova
    WHERE
        id = CursoId;
END;

DELIMITER;

-- Exclusão de Dados:
-- 06. Crie uma Stored Procedure chamada DeletarCursoPorId que receba um parâmetro curso_id e exclua o curso correspondente da tabela cursos.

CREATE PROCEDURE DeletarCursoPorId (IN CursoId INT)
BEGIN
    DELETE FROM `Estudos`.cursos WHERE id = CursoId;
END;

-- Controle de Fluxo com IF...ELSE:
-- 07. Crie uma Stored Procedure chamada VerificarCurso que receba um parâmetro curso_id e verifique se o curso existe. Se existir, retorne a mensagem "Curso encontrado"; caso contrário, retorne "Curso não encontrado".

DELIMITER ##

CREATE PROCEDURE VerificarCurso (IN CursoId INT)
BEGIN
    DECLARE MensagemExibir VARCHAR(30);

    IF EXISTS (SELECT id FROM `Estudos`.cursos WHERE id = CursoId) THEN
        SET MensagemExibir = "Curso encontrado";
    ELSE
        SET MensagemExibir = "Curso não encontrado";
    END IF;

    SELECT MensagemExibir;
END;

DELIMITER;

-- Uso de Cursors:
-- 08. Crie uma Stored Procedure chamada ListarNomesUsuarios que use um cursor para iterar sobre todos os registros da tabela usuarios e selecione os nomes dos usuários.

DELIMITER ##

CREATE PROCEDURE ListarNomesUsuarios ()
BEGIN
    DECLARE Finalizado BOOL DEFAULT false;
    DECLARE NomeUsuario VARCHAR(100);

    DECLARE 
        NomesUsuariosCursor 
    CURSOR FOR 
    SELECT
        U.nome
    FROM `Estudos`.usuarios AS U;

    DECLARE CONTINUE HANDLER
    FOR NOT FOUND SET Finalizado = true;

    OPEN NomesUsuariosCursor;
    listar_nomes_usuarios: LOOP

    FETCH NomesUsuariosCursor INTO NomeUsuario;
    SELECT NomeUsuario;

    IF (Finalizado = true) THEN
        LEAVE listar_nomes_usuarios;
    END IF;

    END LOOP;
    CLOSE NomesUsuariosCursor;
END;

DELIMITER;

-- Tratamento de Erros:
-- 09. Crie uma Stored Procedure chamada InserirNovoUsuario que insira um novo usuário na tabela usuarios. Adicione um tratamento de erros para capturar qualquer exceção SQL e retorne uma mensagem de erro.

DELIMITER ##

CREATE PROCEDURE InserirNovoUsuario (IN NomeUsuario VARCHAR(100), IN EmailUsuario VARCHAR(100), IN SenhaUsuario VARCHAR(100))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = "Ocorreu erro na inserção.";
    END;

    INSERT INTO `Estudos`.usuarios (nome, email, senha) VALUES
    (NomeUsuario, EmailUsuario, SenhaUsuario);
END;

DELIMITER;

-- Transações
-- 10. Crie uma Stored Procedure chamada TransacaoInserirCursos que use transações para inserir dois novos cursos na tabela cursos. Se ocorrer um erro em qualquer inserção, a transação deve ser revertida.

DELIMITER ##

CREATE PROCEDURE TransacaoInserirCursos (
    IN NomeCurso1 VARCHAR(100), 
    IN DescricaoCurso1 TEXT, 
    IN DataInicioCurso1 DATE, 
    IN DataFimCurso1 DATE,
    IN NomeCurso2 VARCHAR(100), 
    IN DescricaoCurso2 TEXT, 
    IN DataInicioCurso2 DATE, 
    IN DataFimCurso2 DATE
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;
        INSERT INTO `Estudos`.cursos (nome, descricao, data_inicio, data_fim) VALUES
        (NomeCurso1, DescricaoCurso1, DataInicioCurso1, DataFimCurso1),
        (NomeCurso2, DescricaoCurso2, DataInicioCurso2, DataFimCurso2);
    COMMIT;
END;

DELIMITER ;

-- Chamada de Stored Procedures Aninhadas
-- 11. Crie duas Stored Procedures: ProcedureA e ProcedureB. ProcedureA deve chamar ProcedureB e ProcedureB deve simplesmente retornar uma mensagem "Procedure B foi chamada".

DELIMITER ##

CREATE PROCEDURE ProcedureA ()
BEGIN
    DECLARE MensagemProcedureB VARCHAR(100);
    
    CALL ProcedureB (MensagemProcedureB);

    SELECT MensagemProcedureB;
END;

DELIMITER;

DELIMITER ##

CREATE PROCEDURE ProcedureB (OUT Retorno CHAR(23))
BEGIN
    SET Retorno = "Procedure B foi chamada";
END;

DELIMITER;