Drop Function If Exists primeira_pl;

Create Or Replace Function primeira_pl()
Returns Int As $$
    Declare
        primeira_variavel Int Default 3;

    Begin
        primeira_variavel := primeira_variavel * 2;
        
        Declare
            primeira_variavel Int;
        
        Begin
            primeira_variavel := 7;
        End;

        Return  primeira_variavel;
    End;

$$ Language plpgsql;

Select  primeira_pl();