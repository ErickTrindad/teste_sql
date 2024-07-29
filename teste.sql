SELECT  '0000141'
       ,Replace(Max(Case When idx % 2 = 1 Then arr_element End), ':', '')            AS des_caracteristica
       ,Max(Case When idx % 2 = 0 Then arr_element End) AS des_atributo
  From (Select  Unnest(regexp_split_to_array('Modelo: Rolex Metal: Ouro amarelo Ocasião: Casual', '\s+(?=[A-Z])'))                                      As arr_element
               ,Generate_Series(1, array_length(regexp_split_to_array('Modelo: Rolex Metal: Ouro amarelo Ocasião: Casual', '\s+(?=[A-Z])'), 1))         As idx) splitado
 Group By (idx - 1) 