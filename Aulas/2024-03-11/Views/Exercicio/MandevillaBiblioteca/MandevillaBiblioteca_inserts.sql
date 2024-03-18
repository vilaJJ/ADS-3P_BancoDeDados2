/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
11 de março de 2024 (2024-03-11), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

INSERT INTO Alunos VALUES 
(1, 'Andreina Martins Araujo Costa', 'Andreina@gmail.com', '92089191'),
(2, 'Augusto Batista de Jesus', 'Augusto@gmail.com', '92436577'),
(3, 'Bruna Emanuely Sousa Ribeiro', 'Bruna@gmail.com', '92087734'),
(4, 'Bruno Vieira Lima Pinheiro', 'Bruno@gmail.com', '92436574'),
(5, 'Dennyson Rodrigues Silva', 'Dennyson@gmail', '92436574'),
(6, 'Edivaldo Junior Coelho Silva', 'Edivaldo@gmail.com', '87344555'),
(7, 'Ewerthon Matheus Muniz Da Silva', 'Ewerthon@gmail.com', '9823444'),
(8, 'Frederico Barreto Frazão', 'Frederico@gmail.com', '56775333'),
(9, 'Gabryela Borges Morais', 'Gabryela@gmail.com', '56666444'),
(10, 'Guibson Arcebispo Lima Oliveira', 'Guibson@gmail.com', '2233333'),
(11, 'Gustavo Cunha Da Silva', 'Gustavo@gmail.com', '456667774'),
(12, 'Hithallo Lima Trindade', 'Hithallo@gmail.com', '937474444'),
(13, 'Jadson Antonio Santos Medeiros', 'Jadson@gmail.com', '84122125'),
(15, 'Jeovana Bandeira De Miranda', 'Jeovana@gmail.com', '92437497'),
(16, 'Airton Eckert Flho', 'Airton@gmail.com', '918233209');

INSERT INTO Assuntos VALUES
(1, 'Policial'),
(2, 'Livros Didáticos'),
(3, 'Auto-ajuda'),
(4, 'Romance'),
(5, 'Aventura'),
(6, 'Filosofia'),
(7, 'Poesia'),
(8, 'Biografias'),
(9, 'Suspense'),
(10, 'Informática');

INSERT INTO Livros VALUES
(1, 'Redes de Computador' ,'Pedro Silva', '2012-05-22', 14, 10),
(2, 'Banco de dados', 'Carlos Eduardo', '2011-09-23', 20, 10),
(3, 'Guerra e Paz', 'Liev Tolstói', '2015-07-10', 11, 2),
(4, 'A Montanha Mágica', 'Thomas Mann', '2014-08-08', 8, 1),
(5, 'Ulisses', 'James Joyce', '2013-09-07', 30, 5),
(6, 'Cem Anos de Solidão', 'Gabriel García Márquez', '2013-11-05', 14, 7),
(7, 'A Divina Comédia', 'Dante Alighieri', '2010-02-02', 22, 4),
(8, 'Em Busca do Tempo Perdido', 'Marcel Proust', '2016-08-04', 28, 8),
(9, 'O Som e a Fúria', 'William Faulkner', '2016-03-15', 27, 2);

INSERT INTO Emprestimos VALUES
(1, '2016-08-08',' 2016-08-17', '2016-08-21', 3, 2, 2),
(2, '2016-07-10', '2016-08-01', '2016-08-10', 5, 3, 1),
(3, '2012-08-22', '2012-09-02', '2012-09-09', 7, 4, 3),
(4, '2011-05-10', '2011-05-08', '2011-05-12', 5, 5, 4),
(5, '2012-04-29', '2012-05-03', '2012-05-10', 8, 6, 5),
(6, '2015-03-03', '2015-04-10', '2015-04-11', 10, 7, 6),
(7, '2013-02-05', '2013-02-15', '2013-02-20', 11, 8, 7),
(8, '2012-01-06', '2012-01-16', '2012-01-20', 2, 1, 9);