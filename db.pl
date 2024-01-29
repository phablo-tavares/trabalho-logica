:-dynamic mulher/1.
:-dynamic homem/1.
:-dynamic genitor/2.


/*start() :- write('digite o valor de X: '),nl,read(X),Y is sqrt(X),nl,write(Y),nl. */
%sfdgsdfgdsfg
mulher(pam).
mulher(ann).
mulher(liz).
mulher(pat).
homem(tom).
homem(bob).
homem(jim).
genitor(pam,bob).
genitor(tom,bob).
genitor(tom,liz).
genitor(bob,ann).
genitor(bob,pat).
genitor(pat,jim).
filho(X,Y) :- genitor(Y,X).
mae(X,Y) :- genitor(Y,X) , mulher(X).
avo(X,Z) :- genitor(X,Y),genitor(Y,Z).

% assert/1 - acrescenta o fato/regra como ultimo �tem do
% predicado.Ex:assert(homem(pedro)).

% asserta/1 - acrescenta o fato/regra
% como primeiro �tem do predicado
%
% retract/1 remove da base o primeiro elemento com clausula(fato/regra)
% igual ao termo passado como par�metro.
% Ex: retract(homem(pedro)).

% retractall/1 remove da base todos elementos com
% clausula(fato/regra) igual ao termo passado como par�metro. Ex:
% retract(homem(pedro)).

% retract/1 remove da base o primeiro elemento com clausula(fato/regra)
% igual ao termo passado como par�metro.
% Ex: retract(homem(pedro)).

% retractall/1 remove da base todos elementos com
% clausula(fato/regra) igual ao termo passado como par�metro. Ex:
% retractall(homem(pedro)).

% abolish/1 remove da base todos elementos com
% clausula(fato/regra) igual ao termo passado como par�metro(mesmo se
% n�o for din�mico). Ex: abolish(homem(pedro)).


descendente(X,Y) :- genitor(Y,X).
descendente(X,Y) :- genitor(Y,W) , descendente(X,W).

fatorial(0,1).
fatorial(N,F) :-
    N >= 0,
    Nmenos1 is N-1,
    fatorial(Nmenos1,FdeNmenos1),
    F is N*FdeNmenos1.



escreverMulheres :- mulher(X),write(X),nl,fail.



recorrencia(N,Resultado) :- N =:= 2 , Resultado is 2.
recorrencia(N,Resultado) :- N > 2,
    Nmenos1 is N -1,
    recorrencia(Nmenos1,ResultadoNmenos1),
    Resultado is ResultadoNmenos1 - (3*N*N).




escrevaFim :- repeat,
    write('escrefa a sua palavra: '),
    read(Palavra),nl,
    (
                      (Palavra == fim -> !);
                      (processar(Palavra),fail)
    ).

processar(Palavra) :- write('Palavra: '),write(Palavra),nl.

xEstaNaLista(X , [X|_]). %achou o elemento a ser buscado
xEstaNaLista(X , [_|Tail]) :- xEstaNaLista(X ,Tail). %vai para o proximo elemento da lista



ehUltimo(X,[X]).
ehUltimo(X,[_|Tail]) :- ehUltimo(X,Tail).

tamanho([],0).
tamanho([_|T],Tam) :- tamanho(T,Tam1), Tam is Tam1 + 1.
