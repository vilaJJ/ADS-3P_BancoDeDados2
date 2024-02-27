/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
26 de fevereiro de 2024 (2024-02-26), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

INSERT INTO Aluno (Codigo, Nome, Rua, Cidade) VALUES
(1, 'Tiago Mateus Junior', '210', 'Palmas'),
(2, 'Luciana Gomes', '202', 'Palmas'),
(3, 'João Mateus', '2300', 'Gurupi'),
(4, 'José Silva', '1024', 'Paraíso'),
(5, 'Juraci', '106', 'Miranorte'),
(6, 'Paulo', '101', 'Goianorte'),
(7, 'Adriana Calcanhoto', 'Rua Alvorada', 'Paraíso'),
(8, 'Rosane', 'Rua das Flores', 'Guaraí'),
(9, 'Mara', 'Rua das Águas', 'Porto Nacional'),
(10, 'Júlia Paula', 'Rua de Madeira', 'Paraíso'),
(11, 'Júlio', 'Rua de Madeira', 'Palmas');

INSERT INTO Professor (Codigo, Nome, Rua, Cidade) VALUES
(1, 'João José', '103', 'Palmas'),
(2, 'Maria José', '201', 'Palmas'),
(3, 'Bruno Leal', '305', 'Paraiso'),
(4, 'José Ricardo', '1106', 'Porto Nacional'),
(5, 'Manuela', '120', 'Araguaína'),
(6, 'Bruno Henrique', '1003', 'Porto Nacional'),
(7, 'Luciana', ' 100', 'Miracema'),
(8, 'Paulo', ' 150', 'Palmas'),
(9, 'Lual', '1006', 'Paraíso'),
(10, 'Antonio Marcos', '170', 'Araguaína');

INSERT INTO Curso VALUES
(1, 'Ensino Médio'),
(2, 'Ensino Pós Médio'),
(3, 'CST Sistemas para Internet'),
(4, 'Computação');

INSERT INTO Disciplina (Codigo, Nome, Curso_Codigo, QuantidadeAulas) VALUES
(1, 'Química', 1, 4),
(2, 'Biologia', 1, 4),
(3, 'História', 1, 2),
(4, 'Religião', 1, 2),
(5, 'Português', 2, 4),
(6, 'Física', 2, 6),
(7, 'Matemática', 2, 4),
(8, 'Geografia ', 2, 2),
(9, 'Informática Aplicada', 3, 4),
(10, 'Banco de dados', 3, 4),
(11, 'Programação de Banco de dados', 4, 4);

INSERT INTO Matricula VALUES
(1, 10, 2018),
(1, 4, 2018),
(1, 6, 2018),
(5, 3, 2018),
(6, 1, 2018),
(2, 6, 2018),
(7, 9, 2018),
(8, 10, 2018),
(9, 1, 2018),
(2, 2, 2018),
(11, 11, 2018);

INSERT INTO DisciplinaProfessor VALUES 
(1, 10, 2018),
(2, 5, 2018),
(3, 7, 2018),
(4, 4, 2018),
(5, 9, 2018),
(6, 2, 2018),
(7, 3, 2018),
(8, 9, 2018),
(9, 6, 2018),
(10, 3, 2018),
(11, 5, 2018);