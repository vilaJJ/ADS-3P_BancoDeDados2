## Exercício

1. Crie uma stored procedure chamada ListarUsuarios que retorne todos os registros da tabela Usuarios.

2. Crie uma stored procedure chamada InserirUsuario que aceite os parâmetros nome, email, senha, data_nascimento, e cpf e insira um novo registro na tabela Usuarios.

3. Crie uma stored procedure chamada AtualizarEmailUsuario que aceite os parâmetros id e novo_email e atualize o email do usuário correspondente ao id fornecido.

4. Crie uma stored procedure chamada DeletarUsuario que aceite o parâmetro id e delete o usuário correspondente da tabela Usuarios.

5. Crie uma stored procedure chamada ListarVacinasDisponiveis que retorne todos os registros da tabela Vacinas que têm pelo menos uma dose disponível no estoque (Estoques).

6. Crie uma stored procedure chamada RegistrarLote que aceite os parâmetros vacina_id, numero_lote, data_fabricacao, data_validade, e quantidade e insira um novo registro na tabela Lotes.

7. Crie uma stored procedure chamada ContarPacientesCentro que aceite o parâmetro centro_id e retorne a contagem de pacientes agendados para esse centro.

8. Crie uma stored procedure chamada ListarAgendamentosPaciente que aceite o parâmetro paciente_id e retorne todos os agendamentos do paciente correspondente.

9.  Crie uma stored procedure chamada RegistrarAplicacao que aceite os parâmetros agendamento_id, profissional_id, e data_aplicacao e insira um novo registro na tabela Aplicacoes.

10. Crie uma stored procedure chamada ListarEfeitosAdversos que retorne todos os registros da tabela Efeitos_Adversos.

11. Crie uma stored procedure chamada RegistrarEfeitoAdverso que aceite os parâmetros aplicacao_id, descricao, e data_ocorrencia e insira um novo registro na tabela Efeitos_Adversos.

12. Crie uma stored procedure chamada AtualizarEstoque que aceite os parâmetros centro_id, vacina_id, e nova_quantidade e atualize a quantidade de vacinas no estoque correspondente.

13. Crie uma stored procedure chamada ListarProfissionaisCentro que aceite o parâmetro centro_id e retorne todos os profissionais do centro correspondente.

14. Crie uma stored procedure chamada ListarVacinasPaciente que aceite o parâmetro paciente_id e retorne todas as vacinas que o paciente tomou, incluindo as datas de aplicação.

15. Crie uma stored procedure chamada ListarCentrosComEstoque que retorne todos os centros que têm vacinas disponíveis no estoque.