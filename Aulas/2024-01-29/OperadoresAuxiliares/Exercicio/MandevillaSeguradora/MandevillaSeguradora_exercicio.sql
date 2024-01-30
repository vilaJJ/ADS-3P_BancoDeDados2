-- 1. Faça duas consultas diferentes utilizando a função IS NULL para encontrar registros com valores nulos em campos específicos.
SELECT * FROM Contratos WHERE ValorSeguro IS NULL;
SELECT * FROM Contratos WHERE PrecoDiaria IS NULL;

-- 2. Realize três consultas diferentes utilizando a função LIKE para buscar registros que correspondam a padrões de caracteres específicos em campos de texto.
SELECT * FROM Veiculos WHERE Modelo LIKE 'M%';
SELECT * FROM Clientes WHERE Nome LIKE '%Silva';
SELECT * FROM Manutencoes WHERE Descricao LIKE '%do%';


-- 3. Execute duas consultas distintas utilizando a função IN para encontrar registros que correspondam a valores específicos de uma lista predefinida.
SELECT * FROM Clientes WHERE Codigo IN(1, 2);
SELECT * FROM Veiculos WHERE Codigo IN(2, 3);

-- 4. Realize três consultas diferentes utilizando a função BETWEEN para buscar registros dentro de intervalos específicos em campos numéricos.
SELECT * FROM Contratos WHERE PrecoDiaria BETWEEN 5 AND 10;
SELECT * FROM Manutencoes WHERE Valor BETWEEN 500 AND 1000;
SELECT * FROM Contratos WHERE ValorSeguro BETWEEN 100 AND 200;

-- 5. Faça duas consultas em tabelas diferentes utilizando a função AVG para calcular a média de valores em campos numéricos.
SELECT AVG(PrecoDiaria) AS 'Média de diária' FROM Contratos;
SELECT AVG(Valor) AS 'Valor médio de manunteções' FROM Manutencoes;

-- 6. Execute três consultas em tabelas diferentes utilizando a função COUNT para contar o número de registros que atendem a condições específicas.
SELECT COUNT(Codigo) AS 'Quantidade de clientes cadastrados' FROM Clientes;
SELECT COUNT(Codigo) AS 'Quantidade de veículos cadastrados' FROM Veiculos;
SELECT COUNT(Codigo) AS 'Quantidade de contratos realizados' FROM Contratos;

-- 7. Realize duas consultas em tabelas diferentes utilizando a função MAX para encontrar os valores máximos em campos numéricos.
SELECT MAX(ValorSeguro) AS 'Valor de seguro mais caro' FROM Contratos;
SELECT MAX(Valor) AS 'Valor da manutenção mais cara' FROM Manutencoes;

-- 8. Faça duas consultas em tabelas diferentes utilizando a função MIN para encontrar os valores mínimos em campos numéricos.
SELECT MIN(ValorSeguro) AS 'Valor de seguro mais barato' FROM Contratos;
SELECT MIN(Valor) AS 'Valor da manutenção mais barata' FROM Manutencoes;

-- 9. Execute três consultas diferentes utilizando a função SUM para calcular a soma de valores em campos numéricos.
SELECT SUM(ValorSeguro) AS 'Arrecadação dos valores de seguros' FROM Contratos;
SELECT SUM(Valor) AS 'Arrecadação dos pagamentos de manutenções' FROM Manutencoes;
SELECT SUM(PrecoDiaria) AS 'Arrecadação dos pagamentos das diárias' FROM Contratos;