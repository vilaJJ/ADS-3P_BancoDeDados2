/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
03 de junho de 2024 (2024-06-03), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

-- 1. Crie uma stored procedure que retorne todos os registros da tabela de clientes.

DELIMITER ##

CREATE PROCEDURE RetornarClientes ()
BEGIN
    SELECT
        ClienteID AS 'ID do Cliente',
        Nome AS 'Cliente',
        Endereco AS 'Endereço',
        Telefone AS 'N° Telefone',
        Email AS 'Endereço de e-mail'
    FROM `VendaDoces`.`Clientes`
    ORDER BY
        Cliente ASC;
END;

DELIMITER ;

-- 2. Crie uma stored procedure que permita a inserção de um novo produto na tabela de produtos, passando os valores necessários como parâmetros.

DELIMITER ##

CREATE PROCEDURE AdicionarProduto (IN IdFornecedor INT, IN Nome VARCHAR(100), IN Descricao TEXT, IN Preco DECIMAL(10,2), IN Estoque INT)
BEGIN
    INSERT INTO `VendaDoces`.`Produtos`(FornecedorID, Nome, Descricao, Preco, Estoque) VALUES 
    (IdFornecedor, Nome, Descricao, Preco, Estoque);
END;

DELIMITER ;

-- 3. Crie uma stored procedure que atualize o preço de um produto específico na tabela de produtos, passando o ID do produto e o novo preço como parâmetros.

DELIMITER ##

CREATE PROCEDURE AtualizarPrecoProduto (IN IdProduto INT, IN NovoPreco DECIMAL(10,2))
BEGIN
    UPDATE `VendaDoces`.`Produtos` SET Preco = NovoPreco WHERE ProdutoID = IdProduto;
END;

DELIMITER ;

-- 4. Crie uma stored procedure que exclua um cliente da tabela de clientes, passando o ID do cliente como parâmetro.

DELIMITER ##

CREATE PROCEDURE ExcluirCliente (IN IdCliente INT)
BEGIN
    UPDATE `VendaDoces`.`Pedidos` SET ClienteID = null WHERE ClienteID = IdCliente;
    DELETE FROM `VendaDoces`.`Clientes` WHERE ClienteID = IdCliente;
END;

DELIMITER ;

-- 5. Crie uma stored procedure que conte o número de produtos disponíveis no estoque e retorne esse valor.

DELIMITER ##

CREATE PROCEDURE ObterQuantidadeProdutosEstoque (OUT Quantidade INT)
BEGIN
    SELECT SUM(Estoque) FROM `VendaDoces`.`Produtos` INTO Quantidade;
END;

DELIMITER ;

-- 6. Crie uma stored procedure que liste todos os pedidos feitos por um cliente específico, passando o ID do cliente como parâmetro.

DELIMITER ##

CREATE PROCEDURE ListarTodosPedidosPorCliente (IN IdCliente INT)
BEGIN
    SELECT
        PE.PedidoID as 'Código do Pedido',
        CL.Nome AS 'Cliente',
        SUM(DP.Quantidade * DP.Preco) AS 'Valor do Pedido',
        DATE_FORMAT(PE.DataPedido, "%d/%m/%Y") AS 'Data do Pedido'
    FROM `VendaDoces`.`Pedidos` AS PE
    INNER JOIN `VendaDoces`.`DetalhesPedidos` AS DP
        ON PE.PedidoID = DP.PedidoID
    INNER JOIN `VendaDoces`.`Clientes` AS CL
        ON PE.ClienteID = CL.ClienteID
    INNER JOIN `VendaDoces`.`Produtos` AS PR
        ON DP.ProdutoID = PR.ProdutoID
    WHERE
        PE.ClienteID = IdCliente
    GROUP BY
        PE.ClienteID
    ORDER BY
        PE.DataPedido DESC;
END;

DELIMITER ;

-- 7. Crie uma stored procedure que calcule o valor total de um pedido específico, passando o ID do pedido como parâmetro e retornando o valor total.

DELIMITER ##

CREATE PROCEDURE CalcularValorTotalPedido (IN IdPedido INT, OUT ValorTotal DECIMAL(10,2))
BEGIN
    SELECT
        SUM(DP.`Preco` * DP.`Quantidade`)
    FROM `VendaDoces`.`Pedidos` AS PE
    INNER JOIN `VendaDoces`.`DetalhesPedidos` AS DP
        ON PE.`PedidoID` = DP.`PedidoID`
    WHERE
        PE.`PedidoID` = IdPedido
    GROUP BY
        PE.`PedidoID`
    INTO ValorTotal;
END;

DELIMITER ;

-- 8. Crie uma stored procedure que insira um novo pedido e os detalhes do pedido, passando os valores necessários como parâmetros.

DELIMITER ##

CREATE PROCEDURE InserirNovoPedido (IN IdCliente INT, IN IdProduto INT, IN Quantidade INT)
BEGIN
    DECLARE EstoqueDisponivel INT;
    DECLARE IdPedido INT;
    DECLARE DataPedido DATE;
    DECLARE ValorProduto DECIMAL(10,2);

    SELECT 
        Estoque 
    FROM `VendaDoces`.`Produtos` 
    WHERE 
        `ProdutoID` = IdProduto
    INTO EstoqueDisponivel;

    IF (Quantidade > EstoqueDisponivel) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A quantidade de itens do pedido é maior que o estoque disponível.';
    END IF;

    SELECT CAST(NOW() AS DATE) INTO DataPedido;

    SELECT 
        Preco 
    FROM `VendaDoces`.`Produtos` 
    WHERE 
        `ProdutoID` = IdProduto
    INTO ValorProduto;

    INSERT INTO `VendaDoces`.`Pedidos` (ClienteID, DataPedido) VALUES
    (IdCliente, DataPedido);

    SELECT CAST(LAST_INSERT_ID() AS INT) INTO IdPedido;

    INSERT INTO `VendaDoces`.`DetalhesPedidos` (PedidoID, ProdutoID, Quantidade, Preco) VALUES
    (IdPedido, IdProduto, Quantidade, ValorProduto);
END;

-- ClienteID, ProdutoID, Quantidade

DELIMITER ;

-- 9. Crie uma stored procedure que liste todos os produtos fornecidos por um fornecedor específico, passando o ID do fornecedor como parâmetro.

DELIMITER ##

CREATE PROCEDURE ListarProdutosPorFornecedor (IN IdFornecedor INT)
BEGIN
    SELECT
        PR.`ProdutoID` AS 'Código do Produto',
        FO.`FornecedorID` AS 'Código do Fornecedor',
        FO.`Nome` AS 'Fornecedor',
        PR.`Nome` AS 'Produto',
        PR.`Preco` AS 'Preço (R$)'
    FROM `VendaDoces`.`Produtos` AS PR
    INNER JOIN `VendaDoces`.`Fornecedores` AS FO
        ON PR.`FornecedorID` = FO.`FornecedorID`
    WHERE 
        FO.`FornecedorID` = IdFornecedor
    GROUP BY
        PR.`ProdutoID`
    ORDER BY
        PR.`ProdutoID` ASC,
        FO.`FornecedorID` ASC,
        PR.`Nome` ASC;
END;

DELIMITER ;

-- 10. Crie uma stored procedure que atualize a quantidade em estoque de um produto específico, passando o ID do produto e a nova quantidade como parâmetros.

DELIMITER ##

CREATE PROCEDURE AtualizarEstoqueProduto (IN IdProduto INT, IN Estoque INT)
BEGIN
    UPDATE `VendaDoces`.`Produtos` SET `Estoque` = Estoque WHERE `ProdutoID` = IdProduto;
END;

DELIMITER ;

-- 11. Crie uma stored procedure que liste todos os produtos cujo estoque está abaixo de um determinado valor, passando o valor limite como parâmetro.

DELIMITER ##

CREATE PROCEDURE ListarProdutosAbaixoValorEstoque (IN ValorEstoque INT)
BEGIN
    SELECT
        PR.`ProdutoID` AS 'Código do Produto',
        FO.`FornecedorID` AS 'Código do Fornecedor',
        FO.`Nome` AS 'Fornecedor',
        PR.`Nome` AS 'Produto',
        PR.`Estoque` AS 'Estoque',
        PR.`Preco` AS 'Preço (R$)'
    FROM `VendaDoces`.`Produtos` AS PR
    INNER JOIN `VendaDoces`.`Fornecedores` AS FO
        ON PR.`FornecedorID` = FO.`FornecedorID`
    WHERE
        PR.`Estoque` < ValorEstoque
    GROUP BY
        PR.`ProdutoID`
    ORDER BY
        PR.`ProdutoID` ASC,
        FO.`FornecedorID` ASC,
        PR.`Nome` ASC,
        PR.`Estoque` DESC;
END;

DELIMITER ;

-- 12. Crie uma stored procedure para listar os clientes que fizeram pedidos acima de um determinado valor.

DELIMITER ##

CREATE PROCEDURE ListarClientesPedidoAcimaValor (IN ValorPedido DECIMAL(10,2))
BEGIN
    SELECT
        CL.`ClienteID` AS 'Código do Cliente',
        CL.`Nome` AS 'Cliente'
    FROM `VendaDoces`.`Clientes` AS CL
    INNER JOIN `VendaDoces`.`Pedidos` AS PE
        ON CL.`ClienteID` = PE.`ClienteID`
    INNER JOIN `VendaDoces`.`DetalhesPedidos` AS DP
        ON PE.`PedidoID` = DP.`PedidoID`
    GROUP BY
        PE.`PedidoID`,
        CL.`ClienteID`
    HAVING
        SUM(DP.`Preco` * DP.`Quantidade`) > ValorPedido
    ORDER BY
        SUM(DP.`Preco` * DP.`Quantidade`) DESC,
        CL.`Nome` ASC;
END;

DELIMITER ;