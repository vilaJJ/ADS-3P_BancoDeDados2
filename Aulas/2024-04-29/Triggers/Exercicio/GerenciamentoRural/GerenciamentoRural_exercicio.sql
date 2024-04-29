/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
29 de abril de 2024 (2024-04-29), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

DELIMITER $$

/*
1. Criação de Trigger de Inserção:

Crie uma trigger chamada TriggerInsercaoGado que atua após a inserção de um novo registro na tabela Gado. 
Essa trigger deve inserir um registro na tabela AuditoriaGado, indicando o ID do gado, o nome, a raça, e o tipo de operação ('I' para inserção).
*/

CREATE TRIGGER TriggerInsercaoGado
AFTER INSERT ON Gado
FOR EACH ROW
BEGIN
    INSERT INTO AuditoriaGado(TipoOperacao, GadoID, NomeAntigo, RacaAntiga) VALUES
    ('I', NEW.GadoID, NEW.Nome, NEW.Raca);
END$$

/*
2. Criação de Trigger de Atualização:

Crie uma trigger chamada TriggerAtualizacaoGado que atua após a atualização de um registro na tabela Gado. 
A trigger deve registrar na tabela AuditoriaGado qualquer alteração no nome ou na raça do gado, indicando o ID do gado, 
os valores antigos de nome e raça, e o tipo de operação ('U' para atualização).
*/

CREATE TRIGGER TriggerAtualizacaoGado
AFTER UPDATE ON Gado
FOR EACH ROW
BEGIN
    INSERT INTO AuditoriaGado(TipoOperacao, GadoID, NomeAntigo, RacaAntiga) VALUES
    ('U', NEW.GadoID, OLD.Nome, OLD.Raca);
END$$

/*
3. Criação de Trigger de Deleção:

Crie uma trigger chamada TriggerDelecaoGado que atua antes da deleção de um registro na tabela Gado. 
Essa trigger deve inserir um registro na tabela AuditoriaGado, incluindo o ID do gado, o nome, a raça, e o tipo de operação ('D' para deleção).
*/

CREATE TRIGGER TriggerDelecaoGado
BEFORE DELETE ON Gado
FOR EACH ROW
BEGIN
    INSERT INTO AuditoriaGado(TipoOperacao, GadoID, NomeAntigo, RacaAntiga) VALUES
    ('D', OLD.GadoID, OLD.Nome, OLD.Raca);
END$$

-- 4. Teste das Triggers:

-- Insira três novos registros na tabela Gado.

INSERT INTO Gado(FazendaID, Nome, Raca, DataNascimento, PesoAtual) VALUES
(2, 'Agostinho Carrara', 'Atlanta', '2017-04-19', 591.36),
(3, 'João de Barro', 'Nelore', '2019-11-23', 497.16),
(1, 'João Arthur', 'L', '2004-12-17', 616.66);

-- Atualize o nome e a raça de um dos registros inseridos.

UPDATE Gado SET Nome = 'Jeff', Raca = 'Doblete' WHERE GadoID = 5;
UPDATE Gado SET Nome = 'Toddyn', Raca = 'Lerdaus' WHERE GadoID = 2;

-- Delete um dos registros inseridos.

DELETE FROM Gado WHERE GadoID = 4;

-- Consulte a tabela `AuditoriaGado` e verifique se as operações foram registradas corretamente.

SELECT * FROM AuditoriaGado;