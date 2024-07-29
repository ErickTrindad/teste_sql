Drop Function If Exists tabuada;

Create Or Replace Function tabuada(numero Int)
Returns SetOf Varchar As $$
    Declare
        outro_numero Int := 0;

    Begin
        Return Next numero * outro_numero;

        outro_numero := outro_numero + 1;
    End;
$$ Language plpgsql;


Drop Function If Exists tabuada;

Create Or Replace Function tabuada(numero Int)
Returns SetOf Varchar As $$
    Declare
        outro_numero Int Default 1;

    Begin
        Loop
            Return Next numero || ' x ' || outro_numero || ' = ' || numero * outro_numero;

            outro_numero := outro_numero + 1;

            Exit When outro_numero = 11;
         End Loop;
    End;
$$ Language plpgsql;

Create Or Replace Function tabuada(numero Int)
Returns SetOf Varchar As $$
    Declare
        outro_numero Int Default 1;
    Begin
        While outro_numero < 11
         Loop
            Return Next numero || ' x ' || outro_numero || ' = ' || numero * outro_numero;
            outro_numero := outro_numero + 1;
         End Loop;
    End;
$$ Language plpgsql;

Create Or Replace Function tabuada(numero Int)
Returns SetOf Varchar As $$
    Begin
        For outro_numero In 1..10
            Loop
                Return Next numero || ' x ' || outro_numero || ' = ' || numero * outro_numero;
             End Loop;
    End;
$$ Language plpgsql;

Select  tabuada(1);

Create Or Replace Function instrutor_com_salario(Out nome Varchar, Out salario_ok Varchar)
Returns Setof record As $$
    Declare
        instrutor instrutor;
    Begin
        For instrutor In Select * From instrutor
            Loop
                nome := instrutor.nome;
                salario_ok := salario_ok(instrutor.id);

                Return Next;
             End Loop;
      End;
$$ Language plpgsql;

Select  *
  From  instrutor_com_salario()