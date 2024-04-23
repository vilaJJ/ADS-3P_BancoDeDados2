/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
22 de abril de 2024 (2024-04-22), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

-- 							Exercício

DELIMITER $$

/*
1. Crie uma trigger que ao atualizar o valor de um produto, seja gerado um log,
informando qual produto foi alterado, quanto foi o aumento ou decréscimo no
valor e em qual loja foi realizado a atualização do valor.

*/

CREATE TRIGGER LogAtualizacaoValorProduto
AFTER UPDATE ON `Exercicio02`.`Produtos`
FOR EACH ROW
BEGIN
    IF (OLD.Valor <> NEW.Valor) THEN
        INSERT INTO `Log` (`Descricao`) VALUES
        (
            CONCAT
            (
                "O produto '#", NEW.idProdutos, 
                ' ', NEW.Nome, "' ", 
                'foi atualizado o preço. ',
                'Foi de R$ ', OLD.Valor,' para R$ ',
                NEW.Valor, '.'
            )
        ); 
    END IF;
END$$

/*
2. Crie uma trigger que quando for atualizado o endereço de uma loja, todos os
produtos daquela loja tenham seus valores aumentados em 5%
*/

CREATE TRIGGER MudarPrecosMudarLocalizacaoLoja
AFTER UPDATE ON `Exercicio02`.`Loja`
FOR EACH ROW
BEGIN
    IF (OLD.Endereco <> NEW.Endereco) THEN
        UPDATE `Produtos` SET `Valor` = `Valor` + `Valor` * 0.05
        WHERE `Loja_idLoja` = NEW.idLoja;
    END IF;
END$$


/*
3. Crie uma trigger que ao ser realizado uma alteração na tabela cliente, se a idade
dele for maior ou igual a 18 anos, seja gerado um registro na seguinte forma:

    Cliente: nome_do_cliente, 
    Idade: idade_cliente,
    Alterou os dados do Registro.

Caso a idade dele, seja menor que 18 anos, o registro será gerado da seguinte
forma: 

    Cliente: nome_do_cliente, 
    Idade: idade_cliente, 
    Alterou os dados do Registro, informar os responsáveis!
*/

CREATE TRIGGER LogAlteracaoRegistroCliente
AFTER UPDATE ON `Exercicio02`.`Cliente`
FOR EACH ROW
BEGIN
    DECLARE MensagemLog VARCHAR(300);

    SET MensagemLog = CONCAT(
        'Cliente: ', OLD.Nome, ', ',
        'Idade: ', OLD.Idade, ', ',
        'Alterou os dados do Registro.'
    );

    IF (OLD.Idade < 18) THEN
        SET MensagemLog = CONCAT(
            MensagemLog,
            ' Informar os responsáveis!'
        );
    END IF;

    INSERT INTO `Log` (`Descricao`) VALUES (MensagemLog);
END$$

/*
4. Crie uma trigger que quando um cliente for deletado, seja gerado um registro na
tabela log, informando o nome do cliente, o CPF e informando que a conta do
cliente foi deletada.
*/

CREATE TRIGGER LogClienteDeletado
BEFORE DELETE ON `Exercicio02`.`Cliente`
FOR EACH ROW
BEGIN
    INSERT INTO `Log` (`Descricao`) VALUES
    (
        CONCAT
        (
            "O cliente '", OLD.Nome, "', com o CPF '",
            OLD.CPF, "' foi deletado da base de dados."
        )
    );
END$$