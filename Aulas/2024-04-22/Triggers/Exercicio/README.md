## Exercício

1. Crie uma trigger que ao atualizar o valor de um produto, seja gerado um log, informando qual produto foi alterado, quanto foi o aumento ou decréscimo no valor e em qual loja foi realizado a atualização do valor.

2. Crie uma trigger que quando for atualizado o endereço de uma loja, todos os produtos daquela loja tenham seus valores aumentados em 5%.

3. Crie uma trigger que ao ser realizado uma alteração na tabela cliente, se a idade dele for maior ou igual a 18 anos, seja gerado um registro na seguinte forma:
   
   - Cliente: nome_do_cliente, 
   - Idade: idade_cliente, 
   - Alterou os dados do Registro.

    Caso a idade dele, seja menor que 18 anos, o registro será gerado da seguinte forma: 

   - Cliente: nome_do_cliente, 
   - Idade: idade_cliente, 
   - Alterou os dados do Registro, informar os responsáveis!

4. Crie uma trigger que quando um cliente for deletado, seja gerado um registro na tabela log, informando o nome do cliente, o CPF e informando que a conta do cliente foi deletada.