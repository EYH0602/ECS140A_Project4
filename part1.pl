% concat(L1, L2, L)
% L is the concatenation of L1 and L2
concat([], [], []).
concat([], [Y | Ys], [Y | Zs]) :- concat([], Ys, Zs).
concat([X | Xs], Ys, [X | Zs]) :- concat(Xs, Ys, Zs).

% element_at(X, N, L)
% element X is the Nth element in list L
element_at(X, 1, [X | _]).
element_at(X, N2, [_ | Ys]) :- element_at(X, N1, Ys), N2 is N1 + 1.

% myReverse(L1, L2) the reverse of list L1 is L2
myReverse(Xs, Ys) :- reverseHelper(Xs, Ys, []).

reverseHelper([], Xs, Xs).
reverseHelper([X | Xs], Ys, Zs) :- reverseHelper(Xs, Ys, [X | Zs]).


% flatten(L1, L2)
% L2 is the flattened version of L1
myFlatten(X, X).
myFlatten([X | Xs], [X | Ys]) :- X \= [], myFlatten(Xs, Ys).
myFlatten([X | Xs], Ys) :-
    myFlatten(X, FlattenX), 
    myFlatten(Xs, FlattenXs), 
    concat(FlattenX, FlattenXs, Ys).

% compress(L1, L2)
% L1, L2 is its compressed version by eliminating the duplicates.
compress(X, X).
compress(Xs, Ys) :- compressHelper(Xs, Ys, []).

compressHelper([], Ys, Zs) :- reverse(Ys, Zs).
compressHelper([X | Xs], Ys, [X | Zs]) :- compressHelper(Xs, Ys, [X | Zs]).
compressHelper([X | Xs], Ys, Zs) :- compressHelper(Xs, Ys, [X | Zs]).
