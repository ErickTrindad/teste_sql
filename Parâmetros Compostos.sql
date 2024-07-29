Drop Table If Exists instrutor;

Create Table instrutor (
    id Serial Primary Key,
    nome Varchar(255) Not Null,
    salario Decimal(10, 2) Not Null
);

Insert Into instrutor (nome, salario)
Values ('Jeffin', 300),
       ('Juliana', 400),
       ('Kleber', 500)

Drop Function If Exists dobro_do_salario;

Create Function dobro_do_salario(instrutor)
Returns Decimal As $$
    Select $1.salario * 2 As dobro;
$$ Language SQL;

Select  nome,
        dobro_do_salario(instrutor.*)
  From  instrutor;

Create Or Replace Function cria_instrutor_falso()
Returns instrutor As $$
    Select  22, 'Nome falso', 200;
$$ Language SQL;

Drop Function If Exists cria_instrutor_falso;

Create Or Replace Function cria_instrutor_falso()
Returns instrutor As $$
    Declare
      retorno instrutor;

    Begin
      Select 22, 'Nome falso', 200 Into retorno;
      Return retorno;
    End;
$$ Language plpgsql;

Select  *
  From  cria_instrutor_falso();