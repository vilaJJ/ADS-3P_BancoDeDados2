## Exercício

1. Criação de Trigger de Inserção:
   - Crie uma trigger chamada `TriggerInsercaoGado` que atua após a inserção de um novo registro na tabela `Gado`. Essa trigger deve inserir um registro na tabela `AuditoriaGado`, indicando o ID do gado, o nome, a raça, e o tipo de operação ('I' para inserção).

2. Criação de Trigger de Atualização:
   - Crie uma trigger chamada `TriggerAtualizacaoGado` que atua após a atualização de um registro na tabela `Gado`. A trigger deve registrar na tabela `AuditoriaGado` qualquer alteração no nome ou na raça do gado, indicando o ID do gado, os valores antigos de nome e raça, e o tipo de operação ('U' para atualização).

3. Criação de Trigger de Deleção:
   - Crie uma trigger chamada `TriggerDelecaoGado` que atua antes da deleção de um registro na tabela `Gado`. Essa trigger deve inserir um registro na tabela `AuditoriaGado`, incluindo o ID do gado, o nome, a raça, e o tipo de operação ('D' para deleção).

4. Teste das Triggers:
   - Insira três novos registros na tabela `Gado`.
   - Atualize o nome e a raça de um dos registros inseridos.
   - Delete um dos registros inseridos.
   - Consulte a tabela `AuditoriaGado` e verifique se as operações foram registradas corretamente.