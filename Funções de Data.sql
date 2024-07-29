Select  Concat(primeiro_nome, ' ', ultimo_nome)                 As nome_completo,
        Extract(Year From Age(data_nascimento))                   As num_idade
  From  aluno;