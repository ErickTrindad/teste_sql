Create Or Replace Function primeira_funcao(a Int, b Int) 
Returns Integer As $$
    Select  (a - b) * 2;
$$ Language SQL;

Select  primeira_funcao(10, 5);

Create Or Replace Function soma_dois_numeros(a Int, b Int) 
Returns Integer As $$
    Select  (a + b);
$$ Language SQL;

Select  soma_dois_numeros(2, 3);