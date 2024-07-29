Drop Function If Exists salario_ok;

Create Or Replace Function salario_ok(instrutor instrutor)
Returns Varchar As $$
    Begin
        If instrutor.salario = 300
            Then Return 'Salário pode aumentar';
        ElseIf instrutor.salario > 300
            Then Return 'Salário está ok'; 
        Else
            Return 'Salário está defasado';
        End If;
    End;
$$ Language plpgsql;

Select  *
       ,salario_ok(instrutor)
  From  instrutor;


Drop Function If Exists salario_ok;

Create Or Replace Function salario_ok(instrutor instrutor)
Returns Varchar As $$
    Begin
        Case    When instrutor.salario = 100
                    Then Return 'Salário muito baixo';
                When instrutor.salario = 200
                    Then Return 'Salário baixo';
                When instrutor.salario = 300
                    Then Return 'Salário ok';
                Else
                    Return 'Salário ótimo'; 
         End Case;
    End;
$$ Language plpgsql;

Create Or Replace Function salario_ok(id_instrutor Int)
Returns Varchar As $$
    Declare
        instrutor instrutor;

    Begin
        Select  *
          From  instrutor
         Where  id = id_instrutor Into instrutor;

        Case instrutor.salario
                When 100
                    Then Return 'Salário muito baixo';
                When 200
                    Then Return 'Salário baixo';
                When 300
                    Then Return 'Salário ok';
                Else
                    Return 'Salário ótimo'; 
         End Case;
    End;
$$ Language plpgsql;

Select  *
       ,salario_ok(instrutor.id)
  From  instrutor;