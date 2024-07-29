Drop Function instrutores_bem_pagos;

Create Or Replace Function instrutores_bem_pagos(valor_salario Decimal)
Returns SetOf instrutor As $$
    Select  * 
      From  instrutor 
     Where  salario > valor_salario
$$ Language SQL;

Drop Function instrutores_bem_pagos;

Create Or Replace Function instrutores_bem_pagos(valor_salario Decimal, Out nome Varchar, Out salario Decimal)
Returns SetOf record As $$
    Select  nome
           ,salario
      From  instrutor 
     Where  salario > valor_salario
$$ Language SQL;

Drop Function instrutores_bem_pagos;

Create Or Replace Function instrutores_bem_pagos(valor_salario Decimal)
Returns SetOf instrutor As $$
     Begin
          Return Query Select  * 
                         From  instrutor 
                        Where  salario > valor_salario;
     End;
$$ Language plpgsql;

Select  *
  From  instrutores_bem_pagos(300);