nota(joao,6).
situacao(Aluno):- nota(Aluno,X),
    (
    (X>=7 , write('aprovado'));
    (X>=5 , X =< 7 , write('recuperação'));
    (X<5, write('reprovado'))
    )
    .

