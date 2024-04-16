/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
15 de abril de 2024 (2024-04-15), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

-- Já existentes

DELIMITER $$

CREATE TRIGGER AntesDeInserirAluno
BEFORE INSERT ON Alunos
FOR EACH ROW
BEGIN
    SET NEW.DataCriacao = NOW();
END$$

CREATE TRIGGER VerificarProfessor
BEFORE INSERT ON Cursos
FOR EACH ROW
BEGIN
    IF NOT EXISTS (SELECT * FROM Professores WHERE Codigo = NEW.Professor_Codigo) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Professor não encontrado.';
    END IF;
END$$

CREATE TRIGGER AntesAtualizarAluno
BEFORE UPDATE ON Alunos
FOR EACH ROW
BEGIN
    IF (OLD.Email <> NEW.Email) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Alteração de e-mail não permitida.';
    END IF;
END$$

CREATE TRIGGER AtualizarDepartamento
AFTER UPDATE ON Professores
FOR EACH ROW
BEGIN
    INSERT INTO LogDepartamento (Professor_Codigo, DepartamentoAnterior, DepartamentoNovo, DataMudanca)
    VALUES (NEW.Codigo, OLD.Departamento, NEW.Departamento, NOW());
END$$

CREATE TRIGGER AntesDeletarAluno
BEFORE DELETE ON Alunos
FOR EACH ROW
BEGIN
    INSERT INTO LogDeletados (Aluno_Codigo, Nome, Email, DataDelete)
    VALUES (OLD.Codigo, OLD.Nome, OLD.Email, NOW());
END$$

CREATE TRIGGER DepoisDeletarCurso
AFTER DELETE ON Cursos
FOR EACH ROW
BEGIN
    UPDATE Professores SET Departamento = 'Atualizar' WHERE Codigo = OLD.Professor_Codigo;
END$$

-- Criadas pelo aluno

CREATE TRIGGER VerificarSeProfessorTemCursos
BEFORE DELETE ON Professores
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT * FROM Cursos AS C WHERE C.Professor_Codigo = OLD.Codigo) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Não é possível excluir professor cadastro em cursos.";
    END IF;
END$$

CREATE TRIGGER ValidarDepartamentoCadastroProfessor
BEFORE INSERT ON Professores
FOR EACH ROW
BEGIN
    IF (NEW.Departamento is null) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "É necessário informar o departamento para realizar o cadastro do professor.";
    END IF;
END$$