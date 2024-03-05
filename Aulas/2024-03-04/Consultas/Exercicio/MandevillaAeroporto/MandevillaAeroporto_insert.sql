/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
04 de março de 2024 (2024-03-04), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

INSERT INTO Modelos VALUES 
(1, 'Douglas', 'DC-10', 3),
(2, 'Boing', '737', 2),
(3, 'Boing', '747', 4),
(4, 'Airbus', 'A300', 2),
(5, 'Airbus', 'A340', 4);

INSERT INTO Aeroportos VALUES 
(1, 'Sa Carneiro', 'Porto', 'Portugal'),
(3, 'Portela', 'Lisboa', 'Portugal'),
(5, 'Faro', 'Faro', 'Portugal'),
(2, 'Madeira', 'Funchal', 'Portugal'),
(4, 'Ponta Delgada', 'S. Miguel', 'Portugal'),
(9, 'Orly', 'Paris', 'Franca'),
(8, 'Charles de Gaule', 'Paris', 'Franca'),
(11, 'Heathrow', 'Londres', 'Reino Unido'),
(12, 'Gatwick', 'Londres', 'Reino Unido');

INSERT INTO Avioes VALUES 
(1, 'Scott Adams', 1),
(2, 'Milo Manara', 1),
(4, 'Henki Bilal', 3),
(5, 'Gary Larson', 4),
(6, 'Bill Waterson', 4),
(7, 'J R R Tolkien', 3),
(8, 'Franquin', 3),
(9, 'Douglas Adams', 1),
(3, 'Serpieri', 5);

INSERT INTO Voos VALUES 
(1001, 1, 2, 'TAP', 2, 1),
(1002, 2, 3, 'TAP', 1, 2),
(1010, 12, 4, 'BA', 3, 3),
(1008, 3, 12, 'Portugalia', 3, 4),
(1007, 5, 1, 'TAP', 1, 5),
(1009, 1, 3, 'Portugalia', 1, 2),
(1005, 9, 2, 'AirFrance', 2, 3),
(1003, 2, 12, 'BA', 2, 5),
(1006, 8, 11, 'BA', 1, 5),
(1004, 4, 3, 'SATA', 3, 6),
(1111, 1, 3, 'TAP', 2, 3);