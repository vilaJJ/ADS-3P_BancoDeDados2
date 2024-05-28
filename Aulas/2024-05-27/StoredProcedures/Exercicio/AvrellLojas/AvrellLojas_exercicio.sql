/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
27 de maio de 2024 (2024-05-27), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

-- Exercício de Procedures

-- 1. Procedure para adicionar uma categoria.

DELIMITER ##

CREATE PROCEDURE AdicionarCategoria(IN Nome VARCHAR(45), IN Desconto DECIMAL(5,2))
BEGIN
    INSERT INTO Categoria (Nome, Desconto) VALUES (Nome, Desconto);
END;

DELIMITER;

-- 2. Procedure para adicionar um produto.

DELIMITER ##

CREATE PROCEDURE AdicionarProduto(IN Nome VARCHAR(45), IN Preco DECIMAL(10,2), IN Categoria_Codigo INT(11))
BEGIN
    INSERT INTO Produto (Nome, Preco, Categoria_Codigo) VALUES (Nome, Preco, Categoria_Codigo);
END;

DELIMITER;

-- 3. Procedure para adicionar um cliente se for de São Jerônimo.

DELIMITER ##

CREATE PROCEDURE AdicionarCliente(IN Nome VARCHAR(45), IN CPF CHAR(14), IN Idade INT(3), IN Cidade VARCHAR(45))
BEGIN
    IF (Cidade <> "São Jerônimo") THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'É possível adicionar apenas clientes de São Jerônimo.';
    END IF;
    INSERT INTO Cliente (Nome, CPF, Idade, Cidade) VALUES (Nome, CPF, Idade, Cidade);
END;

DELIMITER;

-- 4. Procedure para adicionar 15% de desconto em produtos da categoria Eletrônicos.

DELIMITER ##

CREATE PROCEDURE Descontar15PorcentoEletronicos() 
BEGIN
    UPDATE Produto AS P
    INNER JOIN Categoria AS C
        ON P.Categoria_Codigo = C.Codigo
    SET
        Preco = Preco - (Preco * 0.15)
    WHERE 
        C.Nome = 'Eletrônicos';
END;

DELIMITER;

-- 5. Procedure para verificar o valor do produto de um pedido.

DELIMITER ##

CREATE PROCEDURE ValidarValorProdutoPedido(IN Pedido_Codigo INT(11))
BEGIN
    SELECT
        PR.Preco
    FROM Pedido AS PE
    INNER JOIN Produto AS PR
        ON PE.Produto_Codigo = PR.Codigo
    WHERE
        PE.Codigo = Pedido_Codigo;
END;

DELIMITER;

-- 6. Procedure para listar os produtos de pedidos de clientes de uma cidade.

DELIMITER ##

CREATE PROCEDURE ListarProdutosPedidosClientesPorCidade(IN Nome_Cidade VARCHAR(45))
BEGIN
    SELECT
        PE.Codigo AS 'Código do Pedido',
        PR.Nome AS 'Nome do Produto',
        PR.Preco AS 'Preço do Produto',
        CL.Nome AS 'Nome do Cliente',
        CL.Cidade AS 'Cidade do Cliente'
        FROM Pedido AS PE
        INNER JOIN Produto AS PR
            ON PE.Produto_Codigo = PR.Codigo
        INNER JOIN Cliente AS CL
            ON PE.Cliente_Codigo = CL.Codigo
        WHERE
            CL.Cidade = Nome_Cidade
        GROUP BY
            PE.Codigo
        ORDER BY
            PE.Codigo ASC;
END;

DELIMITER;

-- 7. Procedure para retornar a média dos valores dos produtos de uma categoria.

DELIMITER ##

CREATE PROCEDURE ObterMediaValoresPorCategoria(IN Categoria_Codigo INT(11))
BEGIN
    SELECT
        CA.Codigo AS 'Código da Categoria',
        CA.Nome AS 'Nome da Categoria',
        CAST(AVG(PR.Preco) AS DECIMAL(10,2)) AS 'Média de Valores'
    FROM Produto AS PR
    INNER JOIN Categoria AS CA
        ON PR.Categoria_Codigo = CA.Codigo
    WHERE
        CA.Codigo = Categoria_Codigo
    GROUP BY
        CA.Codigo
    ORDER BY
        CA.Nome ASC,
        CA.Codigo ASC,
        AVG(PR.Preco) DESC;
END;

DELIMITER;

-- 8. Procedure para atualizar o nome de um cliente, com base no seu código.

DELIMITER ##

CREATE PROCEDURE AtualizarNomeCliente(IN Cliente_Codigo INT(11), IN Nome_Novo VARCHAR(45))
BEGIN
    UPDATE Cliente
    SET
        Nome = Nome_Novo
    WHERE
        Codigo = Cliente_Codigo;
END;

DELIMITER;

-- 9. Procedure para excluir um pedido, com base no seu código.

DELIMITER ##

CREATE PROCEDURE ExcluirPedido(IN Pedido_Codigo INT(11))
BEGIN
    DELETE FROM Pedido WHERE Codigo = Pedido_Codigo;
END;

DELIMITER;

-- 10. Procedure para listar todos os clientes e seus respectivos pedidos.

DELIMITER ##

CREATE PROCEDURE ListarTodosClientesPedidos()
BEGIN
    SELECT
        PE.Codigo AS 'Código do Pedido',
        PR.Preco AS 'Preço do Pedido',
        CL.Codigo AS 'Código do Cliente',
        CL.Nome AS 'Nome do Cliente',
        CL.CPF AS 'CPF',
        CL.Cidade AS 'Cidade do Cliente'
    FROM Cliente AS CL
    INNER JOIN Pedido AS PE
        ON CL.Codigo = PE.Cliente_Codigo
    INNER JOIN Produto AS PR
        ON PE.Produto_Codigo = PR.Codigo
    GROUP BY
        CL.Codigo,
        PE.Codigo
    ORDER BY
        CL.Nome ASC,
        CL.Codigo ASC,
        PE.Codigo ASC;
END;

DELIMITER;

-- 11. Procedure para adicionar um novo pedido.

DELIMITER ##

CREATE PROCEDURE AdicionarNovoPedido(IN Cliente_Codigo INT(11), IN Produto_Codigo INT(11))
BEGIN
    INSERT INTO Pedido (Cliente_Codigo, Produto_Codigo) VALUES (Cliente_Codigo, Produto_Codigo);
END;

DELIMITER;

-- 12. Procedure para listar produtos com preço acima de um valor específicado.

DELIMITER ##

CREATE PROCEDURE ListarProdutosAcimaDeDeterminadoValor(IN Valor DECIMAL(10,2))
BEGIN
    SELECT
        PR.Codigo AS 'Código',
        PR.Nome AS 'Nome',
        PR.Preco AS 'Preço',
        CA.Nome AS 'Categoria'
    FROM Produto AS PR
    INNER JOIN Categoria AS CA
        ON PR.Categoria_Codigo = CA.Codigo
    WHERE
        PR.Preco > Valor
    ORDER BY
        PR.Nome ASC,
        PR.Preco ASC;
END;

DELIMITER;

-- Para testar todas as procedures que foram criadas, vamos executar chamadas para cada uma delas com os parâmetros apropriados.

-- 1. AddCategoria: Adicionar uma nova categoria.

CALL AdicionarCategoria ("Transporte", 12.5);

-- 2. AddProduto: Adicionar um novo produto.

CALL AdicionarProduto ("Camisa Tech", 79.99, 3);

-- 3. AddCliente: Adicionar um novo cliente (cidade Araguaína).

CALL AdicionarCliente (
    "Bárbara Ohana",
    "169.516.101-79",
    19,
    "Araguaína"
);

-- 4. AddDescontoEletronicos: Adicionar 15% de desconto em produtos da categoria Eletrônicos.

CALL Descontar15PorcentoEletronicos ();

-- 5. VerificaValorPedido: Verificar o valor do produto de um pedido.

CALL ValidarValorProdutoPedido (3);

-- 6. ListaProdutosPorCidade: Listar os produtos de pedidos de clientes de uma cidade.

CALL ListarProdutosPedidosClientesPorCidade ("Porto Alegre");

-- 7. MediaPrecoPorCategoria: Retornar a média dos valores dos produtos de uma categoria.

CALL ObterMediaValoresPorCategoria (3);

-- 8. AtualizaNomeCliente: Atualizar o nome de um cliente, com base no seu código.

CALL AtualizarNomeCliente (4, "Ana Costa Santos");

-- 9. Procedure para excluir um pedido, com base no seu código.

CALL ExcluirPedido (4);

-- 10. ListaClientesEPedidos: Listar todos os clientes e seus respectivos pedidos.

CALL ListarTodosClientesPedidos ();

-- 11. AdicionaPedido: Adicionar um novo pedido.

CALL AdicionarNovoPedido (2, 5);

-- 12. ListaProdutosAcimaDe: listar produtos com preço acima de 100 reais.

CALL ListarProdutosAcimaDeDeterminadoValor (100);