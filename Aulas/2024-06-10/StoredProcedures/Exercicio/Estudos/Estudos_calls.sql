/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
10 de junho de 2024 (2024-06-10), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

-- Questão 1:

CALL SelecionarTodosUsuarios ();

-- Questão 2:

CALL SelecionarUsuarioPorId (2);

-- Questão 3:

CALL ObterNomeUsuario (4, @CallObterNomeUsuario);

SELECT @CallObterNomeUsuario;

-- Questão 4:

CALL InserirNovoCurso (
    "Desenvolvimento mobile com Flutter", 
    "Aprenda criar aplicativos para Android e iOS com o Flutter",
    "2024-01-17",
    "2024-05-23"
);

-- Questão 5:

CALL AtualizarDescricaoCurso (7, "Aprenda a desenvolver aplicações para multiplataformas com o Flutter");

-- Questão 6:

CALL DeletarCursoPorId (5);

-- Questão 7:

CALL VerificarCurso (9);

-- Questão 8:

CALL ListarNomesUsuarios ();

-- Questão 9:

CALL InserirNovoUsuario ("Juan Felipe", "juan.felipe@gmail.com", "batatinha1234");

-- Questão 10:

CALL TransacaoInserirCursos (
    "Informática Básica",
    "Inserção no mundo da informática, apredendendo recursos básicos",
    "2023-11-07",
    "2024-01-06",
    "Desenvolvimento em Swift",
    "Aprenda o melhor framework para desenvolvimento para iOS",
    "2024-03-09",
    "2024-05-11"
);

-- Questão 11:

CALL ProcedureA;