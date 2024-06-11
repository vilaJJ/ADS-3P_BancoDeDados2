## Exercício

- Criação de uma Stored Procedure Simples:

01. Crie uma Stored Procedure chamada SelecionarTodosUsuarios que selecione todos os registros da tabela usuarios.

- Uso de Parâmetros de Entrada:

02. Crie uma Stored Procedure chamada SelecionarUsuarioPorId que receba um parâmetro usuario_id e selecione o registro correspondente na tabela usuarios.

- Uso de Parâmetros de Saída:

03. Crie uma Stored Procedure chamada ObterNomeUsuario que receba um parâmetro de entrada usuario_id e retorne o nome do usuário através de um parâmetro de saída nome_usuario.

- Inserção de Dados:

04. Crie uma Stored Procedure chamada InserirNovoCurso que receba os parâmetros nome, descricao, data_inicio, e data_fim, e insira um novo registro na tabela cursos.

- Atualização de Dados:

05. Crie uma Stored Procedure chamada AtualizarDescricaoCurso que receba os parâmetros curso_id e nova_descricao, e atualize a descrição do curso correspondente.

- Exclusão de Dados:

06. Crie uma Stored Procedure chamada DeletarCursoPorId que receba um parâmetro curso_id e exclua o curso correspondente da tabela cursos.

- Controle de Fluxo com IF...ELSE:

07. Crie uma Stored Procedure chamada VerificarCurso que receba um parâmetro curso_id e verifique se o curso existe. Se existir, retorne a mensagem "Curso encontrado"; caso contrário, retorne "Curso não encontrado".

- Uso de Cursors:

08. Crie uma Stored Procedure chamada ListarNomesUsuarios que use um cursor para iterar sobre todos os registros da tabela usuarios e selecione os nomes dos usuários.

- Tratamento de Erros:

09. Crie uma Stored Procedure chamada InserirNovoUsuario que insira um novo usuário na tabela usuarios. Adicione um tratamento de erros para capturar qualquer exceção SQL e retorne uma mensagem de erro.

- Transações

10. Crie uma Stored Procedure chamada TransacaoInserirCursos que use transações para inserir dois novos cursos na tabela cursos. Se ocorrer um erro em qualquer inserção, a transação deve ser revertida.

- Chamada de Stored Procedures Aninhadas

11. Crie duas Stored Procedures: ProcedureA e ProcedureB. ProcedureA deve chamar ProcedureB e ProcedureB deve simplesmente retornar uma mensagem "Procedure B foi chamada".
