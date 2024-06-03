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

DELIMITER;

-- 2. Crie uma stored procedure que permita a inserção de um novo produto na tabela de produtos, passando os valores necessários como parâmetros.

DELIMITER ##

CREATE PROCEDURE AdicionarProduto (IN Nome VARCHAR(100), IN Descricao TEXT, IN Preco DECIMAL(10,2), IN Estoque INT)
BEGIN
    INSERT INTO `VendaDoces`.`Produtos`(Nome, Descricao, Preco, Estoque) VALUES (Nome, Descricao, Preco, Estoque);
END;

DELIMITER;

-- 3. Crie uma stored procedure que atualize o preço de um produto específico na tabela de produtos, passando o ID do produto e o novo preço como parâmetros.

DELIMITER ##

CREATE PROCEDURE AtualizarPrecoProduto (IN ProdutoID INT, IN NovoPreco DECIMAL(10,2))
BEGIN
    UPDATE `VendaDoces`.`Produtos` SET Preco = NovoPreco WHERE ProdutoID = ProdutoID;
END;

DELIMITER;

-- 4. Crie uma stored procedure que exclua um cliente da tabela de clientes, passando o ID do cliente como parâmetro.

DELIMITER ##

CREATE PROCEDURE ExcluirCliente (IN ClienteID INT)
BEGIN
    UPDATE `VendaDoces`.`Pedidos` SET ClienteID = null WHERE ClienteID = ClienteID;
    DELETE FROM `VendaDoces`.`Clientes` WHERE ClienteID = ClienteID;
END;

DELIMITER;

-- 5. Crie uma stored procedure que conte o número de produtos disponíveis no estoque e retorne esse valor.

DELIMITER ##

CREATE PROCEDURE ObterQuantidadeProdutosEstoque (OUT Quantidade INT)
BEGIN
    SELECT SUM(Estoque) FROM `VendaDoces`.`Produtos` INTO Quantidade;
END;

DELIMITER;

-- 6. Crie uma stored procedure que liste todos os pedidos feitos por um cliente específico, passando o ID do cliente como parâmetro.

DELIMITER ##

CREATE PROCEDURE ListarTodosPedidosPorCliente (IN ClienteID INT)
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
        PE.ClienteID = ClienteID
    GROUP BY
        PE.ClienteID
    ORDER BY
        PE.DataPedido DESC;
END;

DELIMITER;