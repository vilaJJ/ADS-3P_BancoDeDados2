/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
01 de abril de 2024 (2024-04-01), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

INSERT INTO FuncoesUsuarios (Nome) VALUES
("Empreendedor"),
("Investidor");

INSERT INTO Usuarios (Email, SenhaHash, Nome, Funcao_Codigo, DataCadastro) VALUES 
('investidor1@example.com', 'hash1', 'Investidor Um', 2, '2023-01-01'),
('empreendedor1@example.com', 'hash2', 'Empreendedor Dois', 1, '2023-01-02'),
('investidor2@example.com', 'hash3', 'Investidor Dois', 2, '2023-01-03'),
('empreendedor2@example.com', 'hash4', 'Empreendedor Quatro', 1, '2023-01-04'),
('investidor3@example.com', 'hash5', 'Investidor Três', 2, '2023-01-05'),
('empreendedor3@example.com', 'hash6', 'Empreendedor Seis', 1, '2023-01-06'),
('investidor4@example.com', 'hash7', 'Investidor Quatro', 2, '2023-01-07'),
('empreendedor4@example.com', 'hash8', 'Empreendedor Oito', 1, '2023-01-08'),
('investidor5@example.com', 'hash9', 'Investidor Cinco', 2, '2023-01-09'),
('empreendedor5@example.com', 'hash10', 'Empreendedor Dez', 1, '2023-01-10');

INSERT INTO CategoriasProjetos (Nome, Descricao) VALUES 
('Tecnologia', 'Projetos inovadores na área de tecnologia'),
('Saúde', 'Startups focadas em soluções de saúde e bem-estar'),
('Educação', 'Projetos que buscam inovar na educação'),
('Meio Ambiente', 'Soluções sustentáveis e eco-friendly'),
('Alimentação', 'Inovações no setor de alimentos e bebidas'),
('Moda', 'Startups de moda com foco em sustentabilidade'),
('Finanças', 'Soluções inovadoras para o setor financeiro'),
('Entretenimento', 'Projetos no setor de entretenimento e lazer'),
('Esportes', 'Startups focadas em esportes e atividades físicas'),
('Viagem', 'Soluções inovadoras para o setor de turismo e viagens');

INSERT INTO Projetos (Usuario_Codigo, Titulo, Descricao, Categoria_Codigo, ValorDesejado, ValorArrecadado, DataInicio, DataFinalizacao) VALUES 
(2, 'App de Educação Financeira', 'Um aplicativo que ajuda no controle financeiro pessoal.', 7, 100000, 50000, '2023-02-01', '2023-08-01'),
(4, 'Plataforma de E-learning', 'Plataforma online com cursos de diversas áreas do conhecimento.', 3, 200000, 150000, '2023-03-01', '2023-09-01'),
(6, 'Moda Sustentável', 'Marca de roupas que utiliza materiais reciclados.', 6, 75000, 30000, '2023-04-01', '2023-10-01'),
(8, 'Marketplace de Orgânicos', 'Plataforma online para venda de alimentos orgânicos.', 5, 50000, 20000, '2023-05-01', '2023-11-01'),
(10, 'App de Bem-Estar', 'Aplicativo com foco em meditação e práticas de mindfulness.', 2, 85000, 42500, '2023-06-01', '2023-12-01'),
(2, 'Tecnologia Verde', 'Soluções tecnológicas para redução de carbono.', 4, 120000, 60000, '2023-02-15', '2023-08-15'),
(4, 'Startup de Turismo', 'Plataforma de experiências de viagens únicas.', 10, 95000, 47500, '2023-03-15', '2023-09-15'),
(6, 'Fitness Tech', 'Wearable que monitora a saúde e a atividade física.', 9, 130000, 65000, '2023-04-15', '2023-10-15'),
(8, 'Gastronomia Inovadora', 'Restaurante com cardápio baseado em impressão 3D de alimentos.', 5, 110000, 55000, '2023-05-15', '2023-11-15'),
(10, 'Plataforma de eSports', 'Organização e transmissão de campeonatos de eSports.', 8, 160000, 80000, '2023-06-15', '2023-12-15');

INSERT INTO Investimentos (Projeto_Codigo, UsuarioInvestidor_Codigo, Valor, DataInvestimento) VALUES 
(1, 1, 10000, '2023-02-10'),
(2, 3, 15000, '2023-02-12'),
(3, 5, 5000, '2023-02-15'),
(4, 7, 8000, '2023-02-18'),
(5, 9, 20000, '2023-02-20'),
(6, 1, 12000, '2023-03-05'),
(7, 3, 25000, '2023-03-07'),
(8, 5, 7000, '2023-03-10'),
(9, 7, 9500, '2023-03-12'),
(10, 9, 30000, '2023-03-15'),
(6, 2, 5800, '2024-02-16');

INSERT INTO AnalisesProjetos (Projeto_Codigo, UsuarioAvaliador_Codigo, Nota, Comentarios, DataAnalise) VALUES 
(1, 2, 4, 'Muito promissor, mas precisa de ajustes.', '2023-02-20'),
(2, 4, 5, 'Excelente projeto. Muito necessário.', '2023-02-22'),
(3, 6, 3, 'Ideia boa, mas o plano de negócios é fraco.', '2023-02-24'),
(4, 8, 5, 'Inovador e com grande potencial de mercado.', '2023-02-26'),
(5, 10, 4, 'Gostei muito, mas precisa de mais marketing.', '2023-02-28'),
(6, 2, 5, 'Fantástico. Totalmente a bordo.', '2023-03-02'),
(7, 4, 2, 'Não me convenceu. Falta um diferencial.', '2023-03-04'),
(8, 6, 4, 'Bom projeto. Tem potencial se bem executado.', '2023-03-06'),
(9, 8, 3, 'Interessante, mas vejo muitos riscos.', '2023-03-08'),
(10, 10, 5, 'Adorei! Inovador e com visão de futuro.', '2023-03-10'),
(4, 8, 4, 'Bem prático e inovador.', '2024-04-01');

INSERT INTO Eventos (Titulo, Descricao, DataEvento, Localizacao) VALUES 
('Demo Day Março', 'Apresentação de startups para investidores.', '2023-03-20', 'Auditório Central'),
('Hackathon Saúde', 'Maratona de programação com foco em soluções para saúde.', '2023-04-15', 'Campus Tech'),
('Webinar sobre Investimentos', 'Sessão online sobre tendências de investimento em startups.', '2023-05-10', 'Online'),
('Feira de Empreendedorismo', 'Exposição de startups e networking.', '2023-06-05', 'Centro de Convenções Rio'),
('Pitch Night', 'Noite de pitches de startups buscando investimentos.', '2023-07-18', 'Espaço Inovação'),
('Conferência de Tecnologia', 'Conferência sobre as últimas tendências em tecnologia.', '2023-08-22', 'Centro Tech SP'),
('Meetup de Empreendedores', 'Encontro informal para troca de ideias e experiências.', '2023-09-12', 'Café Empreende'),
('Workshop de Marketing Digital', 'Workshop sobre estratégias de marketing para startups.', '2023-10-03', 'Espaço Coworking'),
('Seminário de Finanças', 'Seminário sobre gestão financeira para startups.', '2023-11-15', 'Auditório Finanças'),
('Evento de Networking', 'Evento para networking entre empreendedores e investidores.', '2023-12-06', 'Hotel Business');

INSERT INTO TiposParticipantesEventos (Tipo) VALUES
("Ouvinte"),
("Palestrante");

INSERT INTO ParticipantesEventos (Evento_Codigo, Usuario_Codigo, TipoParticipante_Codigo) VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(4, 4, 2),
(5, 5, 1),
(6, 6, 2),
(7, 7, 1),
(8, 8, 2),
(9, 9, 1),
(10, 10, 2),
(9, 1, 2),
(3, 8, 1);

INSERT INTO InteressesInvestidores (UsuarioInvestidor_Codigo, CategoriaProjeto_Codigo) VALUES 
(1, 1),
(3, 2),
(5, 3),
(7, 4),
(9, 5),
(1, 6),
(3, 7),
(5, 8),
(7, 9),
(9, 10),
(10, 9),
(8, 2);