/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
17 de junho de 2024 (2024-06-17), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

-- 1. Crie uma stored procedure chamada ListarUsuarios que retorne todos os registros da tabela Usuarios.

DELIMITER ##

CREATE PROCEDURE ListarUsuarios ()
BEGIN
    SELECT
        id AS "ID",
        nome AS "Nome",
        email AS "E-mail",
        DATE_FORMAT(data_nascimento, "%d/%m/%Y") AS "Data de Nascimento",
        cpf AS "CPF"
    FROM `SistemasVacinas`.`Usuarios`
    ORDER BY
        nome ASC,
        data_nascimento DESC;
END;

DELIMITER;

-- 2. Crie uma stored procedure chamada InserirUsuario que aceite os parâmetros nome, email, senha, data_nascimento, e cpf e insira um novo registro na tabela Usuarios.

DELIMITER ##

CREATE PROCEDURE InserirUsuario(IN NomeUser VARCHAR(100), IN EmailUser VARCHAR(100), IN SenhaUser VARCHAR(100), IN DataNascimento DATE, IN CpfUser CHAR(14))
BEGIN
    INSERT INTO `SistemasVacinas`.`Usuarios` (nome, email, senha, data_nascimento, cpf) VALUES
    (NomeUser, EmailUser, SenhaUser, DataNascimento, CpfUser);
END;

DELIMITER;

-- 3. Crie uma stored procedure chamada AtualizarEmailUsuario que aceite os parâmetros id e novo_email e atualize o email do usuário correspondente ao id fornecido.

DELIMITER ##

CREATE PROCEDURE AtualizarEmailUsuario (IN IdUser INT, IN NovoEmailUser VARCHAR(100))
BEGIN
    UPDATE `SistemasVacinas`.`Usuarios` 
    SET 
        email = NovoEmailUser
    WHERE
        id = IdUser;
END;

DELIMITER;

-- 4. Crie uma stored procedure chamada DeletarUsuario que aceite o parâmetro id e delete o usuário correspondente da tabela Usuarios.

DELIMITER ##

CREATE PROCEDURE DeletarUsuario (IN IdUser INT)
BEGIN
    DELETE FROM `SistemasVacinas`.`Usuarios`
    WHERE
        id = IdUser;
END;

DELIMITER;

-- 5. Crie uma stored procedure chamada ListarVacinasDisponiveis que retorne todos os registros da tabela Vacinas que têm pelo menos uma dose disponível no estoque (Estoques).

DELIMITER ##

CREATE PROCEDURE ListarVacinasDisponiveis ()
BEGIN
    SELECT
        VA.nome AS "Nome da Vacina",
        VA.fabricante AS "Fabricante",
        VA.doses_necessarias AS "Doses Necessárias",
        VA.intervalo_dias AS "Intervalo de Dias",
        SUM(ES.quantidade) AS "Estoque total"
    FROM `SistemasVacinas`.`Vacinas` AS VA
    INNER JOIN `SistemasVacinas`.`Estoques` AS ES
    ON VA.id = ES.vacina_id
    GROUP BY
        ES.vacina_id
    HAVING
        SUM(ES.quantidade) > 0
    ORDER BY
        VA.nome ASC,
        VA.fabricante ASC;
END;

DELIMITER;

-- 6. Crie uma stored procedure chamada RegistrarLote que aceite os parâmetros vacina_id, numero_lote, data_fabricacao, data_validade, e quantidade e insira um novo registro na tabela Lotes.

DELIMITER ##

CREATE PROCEDURE RegistrarLote (IN IdVacina Int, IN NumeroLote VARCHAR(100), IN DataFabricacao DATE, IN DataValidade DATE, IN QuantidadeVacina INT)
BEGIN
    INSERT INTO `SistemasVacinas`.`Lotes` (vacina_id, numero_lote, data_fabricacao, data_validade, quantidade) VALUES
    (IdVacina, NumeroLote, DataFabricacao, DataValidade, QuantidadeVacina);
END;

DELIMITER;

-- 7. Crie uma stored procedure chamada ContarPacientesCentro que aceite o parâmetro centro_id e retorne a contagem de pacientes agendados para esse centro.

DELIMITER ##

CREATE PROCEDURE ContarPacientesCentro (IN IdCentro INT, OUT QntdPacientes INT)
BEGIN
    SELECT
        COUNT(PA.id)
    FROM `SistemasVacinas`.`Pacientes` AS PA
    INNER JOIN `SistemasVacinas`.`Agendamentos` AS AG
        ON PA.id = AG.paciente_id
    INNER JOIN `SistemasVacinas`.`Centros` AS CE
        ON AG.centro_id = CE.id
    WHERE 
        CE.id = 1
    GROUP BY
        PA.id
    INTO QntdPacientes;
END;

DELIMITER;

-- 8. Crie uma stored procedure chamada ListarAgendamentosPaciente que aceite o parâmetro paciente_id e retorne todos os agendamentos do paciente correspondente.

DELIMITER ##

CREATE PROCEDURE ListarAgendamentosPaciente (IN IdPaciente INT)
BEGIN
    SELECT
        PA.nome AS "Paciente",
        PA.cpf AS "CPF",
        DATE_FORMAT(PA.data_nascimento, "%d/%m/%Y") AS "Data de Nascimento",
        VA.nome AS "Vacina",
        VA.fabricante AS "Fabricante",
        CE.nome AS "Centro",
        DATE_FORMAT(AG.data_agendamento, "%d/%m/%Y") AS "Data de Agendamento",
        AG.status AS "Status"
    FROM `SistemasVacinas`.`Pacientes` AS PA
    INNER JOIN `SistemasVacinas`.`Agendamentos` AS AG
        ON PA.id = AG.paciente_id
    INNER JOIN `SistemasVacinas`.`Centros` AS CE
        ON AG.centro_id = CE.id
    INNER JOIN `SistemasVacinas`.`Vacinas` AS VA
        ON AG.vacina_id = VA.id
    WHERE 
        PA.id = IdPaciente
    GROUP BY
        AG.id
    ORDER BY
        AG.data_agendamento DESC;
END;

DELIMITER;

-- 9. Crie uma stored procedure chamada RegistrarAplicacao que aceite os parâmetros agendamento_id, profissional_id, e data_aplicacao e insira um novo registro na tabela Aplicacoes.

DELIMITER ##

CREATE PROCEDURE RegistrarAplicacao (IN IdAgendamento INT, IN IdProfissional INT, IN DataAplicacao DATE)
BEGIN
    INSERT INTO `SistemasVacinas`.`Aplicacoes` (agendamento_id, profissional_id, data_aplicacao) VALUES
    (IdAgendamento, IdProfissional, DataAplicacao);
END;

DELIMITER;

-- 10. Crie uma stored procedure chamada ListarEfeitosAdversos que retorne todos os registros da tabela Efeitos_Adversos.

DELIMITER ##

CREATE PROCEDURE ListarEfeitosAdversos ()
BEGIN
    SELECT
        PA.nome AS "Paciente",
        VA.nome AS "Vacina",
        VA.fabricante AS "Fabricante",
        CE.nome AS "Centro da Aplicação",
        DATE_FORMAT(AP.data_aplicacao, "%d/%m/%Y") AS "Data de Aplicação",
        EF_AD.descricao AS "Efeito Adverso",
        DATE_FORMAT(EF_AD.data_ocorrencia, "%d/%m/%Y") AS "Data do Efeito Adverso"
    FROM `SistemasVacinas`.`Efeitos_Adversos` AS EF_AD
    INNER JOIN `SistemasVacinas`.`Aplicacoes` AS AP
        ON EF_AD.aplicacao_id = AP.id
    INNER JOIN `SistemasVacinas`.`Agendamentos` AS AG
        ON AP.agendamento_id = AG.id
    INNER JOIN `SistemasVacinas`.`Pacientes` AS PA
        ON AG.paciente_id = PA.id
    INNER JOIN `SistemasVacinas`.`Vacinas` AS VA
        ON AG.vacina_id = VA.id
    INNER JOIN `SistemasVacinas`.`Centros` AS CE
        ON AG.centro_id = CE.id
    GROUP BY
        EF_AD.id
    ORDER BY
        EF_AD.data_ocorrencia DESC,
        AP.data_aplicacao DESC,
        PA.nome ASC,
        VA.nome ASC,
        VA.fabricante ASC,
        CE.nome ASC,
        EF_AD.descricao ASC;
END;

DELIMITER;

-- 11. Crie uma stored procedure chamada RegistrarEfeitoAdverso que aceite os parâmetros aplicacao_id, descricao, e data_ocorrencia e insira um novo registro na tabela Efeitos_Adversos.

DELIMITER ##

CREATE PROCEDURE RegistrarEfeitoAdverso (IN IdAplicacao INT, IN DescricaoEfeito VARCHAR(255), IN DataOcorrencia DATE)
BEGIN
    INSERT INTO `SistemasVacinas`.`Efeitos_Adversos` (aplicacao_id, descricao, data_ocorrencia) VALUES
    (IdAplicacao, DescricaoEfeito, DataOcorrencia);
END;

DELIMITER;

-- 12. Crie uma stored procedure chamada AtualizarEstoque que aceite os parâmetros centro_id, vacina_id, e nova_quantidade e atualize a quantidade de vacinas no estoque correspondente.

DELIMITER ##

CREATE PROCEDURE AtualizarEstoque (IN IdCentro INT, IN IdVacina INT, IN NovaQuantidade INT)
BEGIN
    UPDATE `SistemasVacinas`.`Estoques`
    SET
        quantidade = NovaQuantidade
    WHERE
        centro_id = IdCentro AND
        vacina_id = IdVacina;
END;

DELIMITER;

-- 13. Crie uma stored procedure chamada ListarProfissionaisCentro que aceite o parâmetro centro_id e retorne todos os profissionais do centro correspondente.

DELIMITER ##

CREATE PROCEDURE ListarProfissionaisCentro (IN IdCentro INT)
BEGIN
    SELECT
        PR.nome AS "Profissional",
        PR.cpf AS "CPF",
        CE.nome AS "Centro",
        PR.cargo AS "Cargo"
    FROM `SistemasVacinas`.`Profissionais` AS PR
    INNER JOIN `SistemasVacinas`.`Centros` AS CE
        ON PR.centro_id = CE.id
    WHERE
        CE.id = IdCentro
    GROUP BY
        PR.id
    ORDER BY
        PR.nome ASC,
        PR.cpf ASC,
        CE.nome ASC,
        PR.cargo ASC;
END;

DELIMITER;

-- 14. Crie uma stored procedure chamada ListarVacinasPaciente que aceite o parâmetro paciente_id e retorne todas as vacinas que o paciente tomou, incluindo as datas de aplicação.

DELIMITER ##

CREATE PROCEDURE ListarVacinasPaciente (IN IdPaciente INT)
BEGIN
    SELECT
        PA.nome,
        PA.cpf,
        VA.fabricante,
        VA.nome,
        DATE_FORMAT(AP.data_aplicacao, "%d/%m/%Y")
    FROM `SistemasVacinas`.`Aplicacoes` AS AP
    INNER JOIN `SistemasVacinas`.`Agendamentos` AS AG
        ON AP.agendamento_id = AG.id
    INNER JOIN `SistemasVacinas`.`Pacientes` AS PA
        ON AG.paciente_id = PA.id
    INNER JOIN `SistemasVacinas`.`Vacinas` AS VA
        ON AG.vacina_id = VA.id
    WHERE
        PA.id = IdPaciente
    GROUP BY
        AP.id
    ORDER BY
        AP.data_aplicacao DESC,
        VA.fabricante ASC,
        VA.nome ASC;
END;

DELIMITER;

-- 15. Crie uma stored procedure chamada ListarCentrosComEstoque que retorne todos os centros que têm vacinas disponíveis no estoque.

DELIMITER ##

CREATE PROCEDURE ListarCentrosComEstoque ()
BEGIN
    SELECT
        CE.nome AS "Centro",
        CE.endereco AS "Endereço",
        CE.telefone AS "Telefone",
        SUM(ES.quantidade) AS "Quantidade de Vacinas"
    FROM `SistemasVacinas`.`Centros` AS CE
    INNER JOIN `SistemasVacinas`.`Estoques` AS ES
        ON CE.id = ES.centro_id
    GROUP BY
        CE.id
    HAVING
        SUM(ES.quantidade) > 0
    ORDER BY
        CE.nome ASC,
        SUM(ES.quantidade) DESC;
END;

DELIMITER;
