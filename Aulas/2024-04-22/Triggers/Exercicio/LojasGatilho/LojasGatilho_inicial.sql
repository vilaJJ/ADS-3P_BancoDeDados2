/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
22 de abril de 2024 (2024-04-22), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

-- Desativa verificações de chave única temporariamente para evitar erros durante a criação de tabelas
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;

-- Desativa verificações de chave estrangeira temporariamente para evitar erros durante a manipulação de chaves estrangeiras
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

-- Configura o modo SQL para 'TRADITIONAL' e permite datas inválidas temporariamente
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- Cria o schema `Exercicio02` se ele ainda não existir, definindo utf8 como o conjunto de caracteres padrão
CREATE SCHEMA IF NOT EXISTS `Exercicio02` DEFAULT CHARACTER SET utf8 ;

-- Cria a tabela `Loja` se ela não existir
CREATE TABLE IF NOT EXISTS `Exercicio02`.`Loja` (
  `idLoja` INT(11) NOT NULL AUTO_INCREMENT,  -- Campo de ID da loja, autoincrementável e chave primária
  `Nome` VARCHAR(45) NULL DEFAULT NULL,      -- Campo para nome da loja, até 45 caracteres, opcional
  `Endereco` VARCHAR(100) NULL,
  PRIMARY KEY (`idLoja`))                    -- Define `idLoja` como chave primária
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- Cria a tabela `Produtos` se ela não existir
CREATE TABLE IF NOT EXISTS `Exercicio02`.`Produtos` (
  `idProdutos` INT(11) NOT NULL AUTO_INCREMENT, -- Campo de ID dos produtos, autoincrementável e chave primária
  `Nome` VARCHAR(45) NULL DEFAULT NULL,         -- Campo para nome do produto, até 45 caracteres, opcional
  `Valor` DECIMAL(10,2) NULL DEFAULT NULL,      -- Campo para valor do produto, com dois decimais, opcional
  `Descricao` VARCHAR(45) NULL DEFAULT NULL,    -- Campo para descrição do produto, até 45 caracteres, opcional
  `Loja_idLoja` INT(11) NOT NULL,               -- Campo de chave estrangeira para ID da loja associada
  PRIMARY KEY (`idProdutos`),                   -- Define `idProdutos` como chave primária
  INDEX `fk_Produtos_Loja_idx` (`Loja_idLoja` ASC),  -- Índice para chave estrangeira da loja
  CONSTRAINT `fk_Produtos_Loja`                  -- Restrição de chave estrangeira que referencia `Loja`
    FOREIGN KEY (`Loja_idLoja`)
    REFERENCES `Exercicio02`.`Loja` (`idLoja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- Cria a tabela `Pedido` se ela não existir
CREATE TABLE IF NOT EXISTS `Exercicio02`.`Pedido` (
  `idPedido` INT(11) NOT NULL AUTO_INCREMENT,  -- Campo de ID do pedido, autoincrementável e chave primária
  `Quantidade` INT(11) NULL DEFAULT NULL,      -- Campo para quantidade de produtos no pedido, opcional
  `Produtos_idProdutos` INT(11) NOT NULL,      -- Campo de chave estrangeira para ID do produto associado
  `Cliente_idCliente` INT(11) NOT NULL,        -- Campo de chave estrangeira para ID do cliente associado
  PRIMARY KEY (`idPedido`),                    -- Define `idPedido` como chave primária
  INDEX `fk_Pedido_Produtos1_idx` (`Produtos_idProdutos` ASC), -- Índice para chave estrangeira dos produtos
  INDEX `fk_Pedido_Cliente1_idx` (`Cliente_idCliente` ASC),    -- Índice para chave estrangeira dos clientes
  CONSTRAINT `fk_Pedido_Produtos1`              -- Restrição de chave estrangeira que referencia `Produtos`
    FOREIGN KEY (`Produtos_idProdutos`)
    REFERENCES `Exercicio02`.`Produtos` (`idProdutos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Cliente1`               -- Restrição de chave estrangeira que referencia `Cliente`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `Exercicio02`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- Cria a tabela `Cliente` se ela não existir
CREATE TABLE IF NOT EXISTS `Exercicio02`.`Cliente` (
  `idCliente` INT(11) NOT NULL AUTO_INCREMENT, -- Campo de ID do cliente, autoincrementável e chave primária
  `Nome` VARCHAR(45) NULL DEFAULT NULL,        -- Campo para nome do cliente, até 45 caracteres, opcional
  `idade` INT(11) NULL DEFAULT NULL,           -- Campo para idade do cliente, opcional
  `CPF` VARCHAR(45) NULL DEFAULT NULL,         -- Campo para CPF do cliente, até 45 caracteres, opcional
  `endereco` VARCHAR(45) NULL DEFAULT NULL,    -- Campo para endereço do cliente, até 45 caracteres, opcional
  PRIMARY KEY (`idCliente`))                   -- Define `idCliente` como chave primária
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- Cria a tabela `Log` se ela não existir
CREATE TABLE IF NOT EXISTS `Exercicio02`.`Log` (
  `idLog` INT(11) NOT NULL AUTO_INCREMENT,     -- Campo de ID do log, autoincrementável e chave primária
  `Descricao` VARCHAR(300) NULL DEFAULT NULL,  -- Campo para descrição do log, até 300 caracteres, opcional
  PRIMARY KEY (`idLog`))                       -- Define `idLog` como chave primária
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- Restaura as configurações de SQL originais após as alterações temporárias
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
