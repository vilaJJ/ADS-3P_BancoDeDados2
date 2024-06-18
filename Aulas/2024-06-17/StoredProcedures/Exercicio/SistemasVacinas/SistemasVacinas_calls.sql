/*
Instituto Federal do Tocantins - IFTO Campus Araguaína
17 de junho de 2024 (2024-06-17), segunda-feira
Curso: Análise e Desenvolvimento de Sistemas (CST)
Estudante: Juan Felipe Alves Flores             Período: 3°
Professor: Gilvan Vieira Moura                  Disciplina: Banco de Dados II
*/

-- 1. Crie uma stored procedure chamada ListarUsuarios que retorne todos os registros da tabela Usuarios.

CALL `ListarUsuarios` ();

-- 2. Crie uma stored procedure chamada InserirUsuario que aceite os parâmetros nome, email, senha, data_nascimento, e cpf e insira um novo registro na tabela Usuarios.

CALL `InserirUsuario` (
    "Juan Felipe Alves Flores",
    "juan.flores@sistema.gov.br",
    "babilover",
    "2004-05-23",
    "059.264.971-89"
);

-- 3. Crie uma stored procedure chamada AtualizarEmailUsuario que aceite os parâmetros id e novo_email e atualize o email do usuário correspondente ao id fornecido.

CALL `AtualizarEmailUsuario` (
    2,
    "maria.souza@outlook.com.br"
)
-- 4. Crie uma stored procedure chamada DeletarUsuario que aceite o parâmetro id e delete o usuário correspondente da tabela Usuarios.

CALL `DeletarUsuario` (3);

-- 5. Crie uma stored procedure chamada ListarVacinasDisponiveis que retorne todos os registros da tabela Vacinas que têm pelo menos uma dose disponível no estoque (Estoques).

CALL `ListarVacinasDisponiveis` ();

-- 6. Crie uma stored procedure chamada RegistrarLote que aceite os parâmetros vacina_id, numero_lote, data_fabricacao, data_validade, e quantidade e insira um novo registro na tabela Lotes.

CALL `RegistrarLote` (
    3,
    "Lote 642",
    "2024-03-09",
    "2024-05-11",
    150
);

-- 7. Crie uma stored procedure chamada ContarPacientesCentro que aceite o parâmetro centro_id e retorne a contagem de pacientes agendados para esse centro.

CALL `ContarPacientesCentro` (2, @QntdPacientesCentro);

SELECT @QntdPacientesCentro;

-- 8. Crie uma stored procedure chamada ListarAgendamentosPaciente que aceite o parâmetro paciente_id e retorne todos os agendamentos do paciente correspondente.

CALL `ListarAgendamentosPaciente` (4);

-- 9. Crie uma stored procedure chamada RegistrarAplicacao que aceite os parâmetros agendamento_id, profissional_id, e data_aplicacao e insira um novo registro na tabela Aplicacoes.

CALL `RegistrarAplicacao` (6, 5, "2024-01-06");

-- 10. Crie uma stored procedure chamada ListarEfeitosAdversos que retorne todos os registros da tabela Efeitos_Adversos.

CALL `ListarEfeitosAdversos` ();

-- 11. Crie uma stored procedure chamada RegistrarEfeitoAdverso que aceite os parâmetros aplicacao_id, descricao, e data_ocorrencia e insira um novo registro na tabela Efeitos_Adversos.

CALL `RegistrarEfeitoAdverso` (
    3,
    "Paciente com dores na região abdominal.",
    "2024-03-10"
);

-- 12. Crie uma stored procedure chamada AtualizarEstoque que aceite os parâmetros centro_id, vacina_id, e nova_quantidade e atualize a quantidade de vacinas no estoque correspondente.

CALL `AtualizarEstoque` (2, 2, 250);

-- 13. Crie uma stored procedure chamada ListarProfissionaisCentro que aceite o parâmetro centro_id e retorne todos os profissionais do centro correspondente.

CALL `ListarProfissionaisCentro` (4);

-- 14. Crie uma stored procedure chamada ListarVacinasPaciente que aceite o parâmetro paciente_id e retorne todas as vacinas que o paciente tomou, incluindo as datas de aplicação.

CALL `ListarVacinasPaciente` (5);

-- 15. Crie uma stored procedure chamada ListarCentrosComEstoque que retorne todos os centros que têm vacinas disponíveis no estoque.

CALL `ListarCentrosComEstoque` ();