% Fatos representando livros
%livro(id,Titulo, Autor, Categoria, Ano).
livro(1,'Il�ada', 'Homero', epopeia, -800).
livro(2,'A Divina Com�dia', 'Dante', poesia, 1304).
livro(3,'Hamlet', 'Shakespeare', drama, 1603).
livro(4,'Dom Quixote', 'Cervantes', romance, 1605).
livro(5,'Fausto', 'Goethe', trag�dia, 1808).
livro(6,'Orgulho e Preconceito', 'Jane Austen', romance, 1813).
livro(7,'Frankenstein', 'Mary Shelley', ficcao_cientifica, 1818).
livro(8,'Os Tr�s Mosqueteiros', 'Alexandre Dumas', aventura, 1844).
livro(9,'O Corvo', 'Edgar Allan Poe', poesia, 1845).
livro(10,'Moby Dick', 'Herman Melville', aventura, 1851).
livro(11,'Madame Bovary', 'Gustave Flaubert', romance, 1856).
livro(12,'As Flores do Mal', 'Charles Baudelaire', poesia, 1857).
livro(13,'Os Miser�veis', 'Victor Hugo', romance, 1862).
livro(14,'O M�dico e o Monstro', 'Robert Louis Stevenson', horror, 1886).
livro(15,'O Retrato de Dorian Gray', 'Oscar Wilde', ficcao, 1890).
livro(16,'Em Busca do Tempo Perdido', 'Marcel Proust', romance, 1913).
livro(17,'Ulisses', 'James Joyce', romance, 1922).
livro(18,'Mrs. Dalloway', 'Virginia Woolf', romance, 1925).
livro(19,'Admir�vel Mundo Novo', 'Aldous Huxley', ficcao_cientifica, 1932).
livro(20,'1984', 'George Orwell', ficcao, 1949).

%fatos representando pessoas
%pessoa(cpf,nome).
pessoa(70778358127,'pablo').
pessoa(953 567 841 23,'pedro').
pessoa(96321548769,'Lucas').
pessoa(95348617324,'maria').
pessoa(75986410358,'Julia').

% Fatos Definindo um emprestimo
%emprestimo(emprestimoId,livro_id,pessoa_cpf,data_inicio,data_fim).
:- dynamic emprestimo/5.
emprestimo(1,1,70778358127,'10/10/2023','10/12/2023').
emprestimo(2,10,95356784123,'10/10/2023','10/12/2023').

% gera um emprestimo de livro e guarda o id do emprestimo na variavel
% EmprestimoId
gerarEmprestimo(EmprestimoId) :-
    buscarLivro(LivroId),

    buscarPessoa(CpfPessoa),

    write('Informe a data de retirada do livro: '),
    read(DATA_INICIO),nl,

    write('Informe a data de devolu��o do livro: '),
    read(DATA_FIM),nl,

    gerarIdUnicoParaOEmprestimo(IdUnico),

    assert(emprestimo(IdUnico,LivroId,CpfPessoa,DATA_INICIO,DATA_FIM)),
    write('emprestimo de livro gerado com sucesso. Id do emprestimo: '),write(IdUnico),
    EmprestimoId is IdUnico.

%faz a devolu��o de um livro a partir do id do emprestimo
devolverLivro :-
    repeat,
    write('Informe o Id do empr�stimo para que seja removido da base de dados: '),
    read(EmprestimoId),
    (
        emprestimo(EmprestimoId,_,_,_,_) ->
        retract(emprestimo(EmprestimoId,_,_,_,_)), write('Livro devolvido com Sucesso! '), ! ;
        write('N�o existe Emprestimo com este Id! '),nl, fail

    ).

buscarLivro(LivroId) :-
    repeat,
    write('Informe o id do livro: '),
    read(ID),
    (
        livro(ID,_,_,_,_) ->
        LivroId is ID, ! ;
        write('N�o existe livro com este id!'),nl, fail
    ).
buscarPessoa(CpfPessoa) :-
    repeat,
    write('Informe o CPF da pessoa: '),
    read(CPF),
    (
        pessoa(CPF,_) ->
        CpfPessoa is CPF, ! ;
        write('N�o existe Pessoa com este cpf!'),nl, fail
    ).
%id unico de 0 a 10 mil para o empr�stimo ()
gerarIdUnicoParaOEmprestimo(IdUnico) :-
    repeat,
    random(0,10001,RandomNumber),
    (
        emprestimo(RandomNumber,_,_,_,_) ->
        fail ;
        IdUnico is RandomNumber, !
    ).


consultar_livro(Titulo):-
    livro(_,Titulo, Autor, Categoria, Ano),
    format('Livro: ~w\nAutor: ~w\nCategoria: ~w\nAno: ~w\n\n',[Titulo, Autor, Categoria, Ano]),
    fail.
consutar_autor(Autor):-
    livro(_,Titulo, Autor, Categoria, Ano),
    format('Livro: ~w\nAutor: ~w\nCategoria: ~w\nAno: ~w\n\n',[Titulo, Autor, Categoria, Ano]),
    fail.
consultar_categoria(Categoria):-
    livro(_,Titulo, Autor, Categoria, Ano),
    format('Livro: ~w\nAutor: ~w\nCategoria: ~w\nAno: ~w\n\n',[Titulo, Autor, Categoria, Ano]),
    fail.
consultar_ano(Ano):-
    livro(_,Titulo, Autor, Categoria, Ano),
    format('Livro: ~w\nAutor: ~w\nCategoria: ~w\nAno: ~w\n\n',[Titulo, Autor, Categoria, Ano]),
    fail.
consulta_intervalo_ano(AnoI, AnoF):-
    livro(_,Titulo, Autor, Categoria, Ano),
    Ano >= AnoI,
    Ano =< AnoF,
    format('Livro: ~w\nAutor: ~w\nCategoria: ~w\nAno: ~w\n\n',[Titulo, Autor, Categoria, Ano]),
    fail.
