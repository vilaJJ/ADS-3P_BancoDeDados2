/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
01 de abril de 2024 (2024-04-01), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

-- Tabelas

SELECT * FROM FuncoesUsuarios;

SELECT * FROM Usuarios;

SELECT * FROM CategoriasProjetos;

SELECT * FROM Projetos;

SELECT * FROM Investimentos;

SELECT * FROM AnalisesProjetos;

SELECT * FROM Eventos;

SELECT * FROM TiposParticipantesEventos;

SELECT * FROM ParticipantesEventos;

SELECT * FROM InteressesInvestidores;

-- Views criadas no exercício

-- 1. Crie uma view chamada ‘View_UserRoles’ que exiba o nome e o papel (UserRole) de cada usuário.

SELECT * FROM View_UserRoles;

-- 2. Desenvolva uma view ‘View_ProjectSummary’ que mostre o título do projeto, o nome do empreendedor e a quantidade total arrecadada.

SELECT * FROM View_ProjectSummary;

-- 3. Elabore uma view ‘View_InvestmentsDetails’ para exibir detalhes dos investimentos, incluindo o título do projeto, o nome do investidor e o montante investido.

SELECT * FROM View_InvestmentsDetails;

-- 4. Crie uma view ‘View_ActiveProjects’ que liste todos os projetos ainda ativos (considerando a data atual como referência).

SELECT * FROM View_ActiveProjects;

-- 5. Desenvolva uma view ‘View_ProjectsByCategory’ que agrupe os projetos por categoria, exibindo o nome da categoria e a quantidade de projetos em cada uma.

SELECT * FROM View_ProjectsByCategory;

-- 6. Elabore uma view ‘View_HighRatedProjects’ que mostre os projetos com uma avaliação média superior a 4.

SELECT * FROM View_HighRatedProjects;

-- 7. Crie uma view ‘View_EventParticipantsCount’ que conte o número de participantes para cada evento.

SELECT * FROM View_EventParticipantsCount;

-- 8. Desenvolva uma view ‘View_InvestorInterests’ para exibir os interesses de cada investidor, mostrando o nome do investidor e as categorias de interesse.

SELECT * FROM View_InvestorInterests;

-- 9. Elabore uma view ‘View_ProjectsWithNoInvestments’ que liste os projetos que ainda não receberam nenhum investimento.

SELECT * FROM View_ProjectsWithNoInvestments;

-- 10. Crie uma view ‘View_RecentInvestments’ para mostrar os investimentos realizados nos últimos 30 dias.

SELECT * FROM View_RecentInvestments;

-- 11. Desenvolva uma view ‘View_TopInvestors’ que exiba os 5 investidores com maior montante total investido.

SELECT * FROM View_TopInvestors;

-- 12. Elabore uma view ‘View_ProjectFeedback’ que mostre o feedback dos usuários para cada projeto, incluindo o nome do usuário, o título do projeto e os comentários.

SELECT * FROM View_ProjectFeedback;

-- 13. Crie uma view ‘View_FullProjectDetails’ que combine informações de projetos, investimentos, e avaliações, fornecendo uma visão completa de cada projeto.

SELECT * FROM View_FullProjectDetails;

-- 14. Desenvolva uma view ‘View_CategoryInvestments’ que mostre o total investido por categoria de projeto.

SELECT * FROM View_CategoryInvestments;

-- 15. Elabore uma view ‘View_UserActivity’ que indique a atividade de cada usuário, baseando-se na quantidade de investimentos feitos, projetos criados, e eventos participados.

SELECT * FROM View_UserActivity;