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


soma(A,B,S) :- S is A + B.






