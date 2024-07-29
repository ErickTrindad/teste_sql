Create Or Replace Function soma_e_produto (numero_1 Int, numero_2 Int, Out soma Int, Out produto Int) 
As $$
    Select numero_1 + numero_2 As soma, numero_1 * numero_2 As produto;
$$ Language SQL

Select  *
  From  soma_e_produto(5,10)