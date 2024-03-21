/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
18 de março de 2024 (2024-03-18), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

-- Tabelas

SELECT * FROM Lucros;

SELECT * FROM Clientes;

SELECT * FROM Bonus;

SELECT * FROM Cidades;

SELECT * FROM TiposBicicletas;

SELECT * FROM Valores;

SELECT * FROM Bicicletas;

SELECT * FROM Locacoes;

-- Views

SELECT * FROM View_ClientesComLocacao;                      # 01

SELECT * FROM View_QntdBicicletasPorCidade;                 # 02

SELECT * FROMView_ClientesComMaisValoresPagosLocacoes;      # 05

SELECT * View_ValorMedioLocacaoPorCidade;                   # 06



SELECT * FROM View_ClientesPontosAcumulados;                # 08

SELECT * FROM View_LucroTotalLocacoesPorMes;                # 09

SELECT * FROM View_BicicletasMaisPopulares;                 # 10

SELECT * FROM View_ClientesSemLocacao;                      # 12

SELECT * FROM View_LucroTotalPorTipoBicicleta;              # 13

SELECT * FROM View_MaiorTempoLocacaoPorTipoBicicleta;       # 14

SELECT * FROM View_QntdLocacoesPorEstado;                   # 15