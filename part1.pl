% concat(L1, L2, L)
% L is the concatenation of L1 and L2
my_concat([], [], []).
my_concat([], [Y | Ys], [Y | Zs]) :- my_concat([], Ys, Zs).
my_concat([X | Xs], Ys, [X | Zs]) :- my_concat(Xs, Ys, Zs), !.

% element_at(X, N, L)
% element X is the Nth element in list L
element_at(X, 1, [X | _]).
element_at(X, N2, [_ | Ys]) :- element_at(X, N1, Ys), N2 is N1 + 1.

% myReverse(L1, L2) the reverse of list L1 is L2
my_reverse(Xs, Ys) :- reverseHelper(Xs, Ys, []).

reverseHelper([], Xs, Xs).
reverseHelper([X | Xs], Ys, Zs) :- reverseHelper(Xs, Ys, [X | Zs]).


% flatten(L1, L2)
% L2 is the flattened version of L1
my_flatten([], []).
my_flatten([X | Xs], Ys) :-
    my_flatten(X, FlattenX), 
    my_flatten(Xs, FlattenXs), 
    my_concat(FlattenX, FlattenXs, Ys).
my_flatten([X | Xs], [X | Ys]) :- X \= [], my_flatten(Xs, Ys), !.

% compress(L1, L2)
% L1, L2 is its compressed version by eliminating the duplicates.
compress(Xs, Ys) :- compressHelper(Xs, Ys, []), !.

compressHelper([], Ys, Zs) :- reverse(Ys, Zs).
compressHelper([X | Xs], Ys, Zs) :-
    member(X, Zs),
    compressHelper(Xs, Ys, Zs).
compressHelper([X | Xs], Ys, Zs) :-
    compressHelper(Xs, Ys, [X | Zs]).
