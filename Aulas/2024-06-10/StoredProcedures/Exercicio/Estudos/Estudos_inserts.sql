/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
10 de junho de 2024 (2024-06-10), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

INSERT INTO usuarios (nome, email, senha) VALUES 
('Alice', 'alice@example.com', 'senha1'),
('Bob', 'bob@example.com', 'senha2'),
('Carol', 'carol@example.com', 'senha3'),
('Dave', 'dave@example.com', 'senha4'),
('Eve', 'eve@example.com', 'senha5'),
('Frank', 'frank@example.com', 'senha6'),
('Grace', 'grace@example.com', 'senha7');

INSERT INTO cursos (nome, descricao, data_inicio, data_fim) VALUES 
('Curso de PHP', 'Aprenda PHP do básico ao avançado', '2023-01-10', '2023-03-10'),
('Curso de JavaScript', 'Domine JavaScript em 2 meses', '2023-02-01', '2023-04-01'),
('Curso de Python', 'Introdução e aplicações avançadas em Python', '2023-03-01', '2023-05-01'),
('Curso de Java', 'Curso completo de Java', '2023-04-01', '2023-06-01'),
('Curso de HTML/CSS', 'Aprenda a criar websites', '2023-05-01', '2023-07-01'),
('Curso de SQL', 'Banco de dados relacional com SQL', '2023-06-01', '2023-08-01'),
('Curso de Flutter', 'Desenvolvimento de apps com Flutter', '2023-07-01', '2023-09-01');

INSERT INTO aulas (curso_id, titulo, conteudo) VALUES 
(1, 'Introdução ao PHP', 'Conteúdo da aula 1 de PHP'),
(1, 'Variáveis e Tipos', 'Conteúdo da aula 2 de PHP'),
(2, 'Introdução ao JavaScript', 'Conteúdo da aula 1 de JavaScript'),
(2, 'Funções em JavaScript', 'Conteúdo da aula 2 de JavaScript'),
(3, 'Introdução ao Python', 'Conteúdo da aula 1 de Python'),
(3, 'Estruturas de Controle', 'Conteúdo da aula 2 de Python'),
(4, 'Introdução ao Java', 'Conteúdo da aula 1 de Java');


INSERT INTO materiais_estudo (aula_id, tipo, link, descricao) VALUES 
(1, 'artigo', 'https://example.com/php1', 'Artigo sobre Introdução ao PHP'),
(1, 'vídeo', 'https://example.com/video1', 'Vídeo sobre Introdução ao PHP'),
(2, 'slide', 'https://example.com/slide1', 'Slides sobre Variáveis e Tipos'),
(3, 'artigo', 'https://example.com/js1', 'Artigo sobre Introdução ao JavaScript'),
(3, 'vídeo', 'https://example.com/video2', 'Vídeo sobre Introdução ao JavaScript'),
(4, 'slide', 'https://example.com/slide2', 'Slides sobre Funções em JavaScript'),
(5, 'artigo', 'https://example.com/python1', 'Artigo sobre Introdução ao Python');

INSERT INTO avaliacoes (curso_id, pergunta, resposta_correta) VALUES 
(1, 'O que é PHP?', 'Uma linguagem de programação'),
(1, 'Como declarar uma variável em PHP?', 'Usando o símbolo $'),
(2, 'O que é JavaScript?', 'Uma linguagem de programação para web'),
(2, 'Como criar uma função em JavaScript?', 'Usando a palavra-chave function'),
(3, 'O que é Python?', 'Uma linguagem de programação'),
(3, 'Como declarar uma lista em Python?', 'Usando colchetes []'),
(4, 'O que é Java?', 'Uma linguagem de programação');

INSERT INTO respostas_alunos (avaliacao_id, usuario_id, resposta, correta) VALUES 
(1, 1, 'Uma linguagem de programação', TRUE),
(1, 2, 'Uma linguagem de marcação', FALSE),
(2, 3, 'Usando o símbolo $', TRUE),
(2, 4, 'Usando o símbolo @', FALSE),
(3, 5, 'Uma linguagem de programação para web', TRUE),
(3, 6, 'Um banco de dados', FALSE),
(4, 7, 'Usando a palavra-chave function', TRUE);

INSERT INTO progresso_alunos (usuario_id, curso_id, progresso) VALUES 
(1, 1, 50),
(2, 1, 20),
(3, 2, 70),
(4, 2, 90),
(5, 3, 30),
(6, 3, 60),
(7, 4, 80);

INSERT INTO comentarios (aula_id, usuario_id, comentario) VALUES 
(1, 1, 'Ótima aula, muito clara!'),
(1, 2, 'Poderia ter mais exemplos.'),
(2, 3, 'Aula bem explicativa.'),
(3, 4, 'Gostei do conteúdo.'),
(3, 5, 'Faltou abordar alguns pontos.'),
(4, 6, 'Excelente explicação sobre funções.'),
(5, 7, 'A aula foi muito útil.');