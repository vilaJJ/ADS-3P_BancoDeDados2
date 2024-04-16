/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
15 de abril de 2024 (2024-04-15), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

INSERT INTO Alunos(Nome, Email) VALUES
("Bárbara Ohana dos Santos Silva", "babi.obs@gmail.com"),
("Juan Felipe Alves Flores", "juan.vilajj@gmail.com");

INSERT INTO Professores (Nome, Departamento) VALUES
("Sara Ghabrielly Oliveira Silva", "Informática"),
("Maria Eduarda Batista de Sousa", "Medicina");

INSERT INTO Cursos(Nome, Professor_Codigo) VALUES
("Lógica de Programação", 1),
("Operações intravenosas", 2);

UPDATE Alunos SET Email = "juan.flores@gmail.com" WHERE Codigo = 2;

UPDATE Professores SET Departamento = "Ciências biológicas" WHERE Codigo = 2;

DELETE FROM Alunos WHERE Codigo = 2;

DELETE FROM Cursos WHERE Codigo = 2;

DELETE FROM Professores WHERE Codigo = 1;

INSERT INTO Professores(Nome, Departamento) VALUES
("Jefferson Ribeiro Vasconcelos Cunha", null);