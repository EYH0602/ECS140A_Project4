% queens(N, Q)
% checks if Q is a valid solution on N x N board
queens(N, Q) :- length(Q, N), board(N, B), queensHelper(Q, 1, B).

% queensHelper(C, Col, Board)
queensHelper([], _, _).
queensHelper([X | Xs], Col, Board) :- 
    member((X, Col), Board), 
    remove((X, Col), Board, NewBoard),
    NewCol is Col + 1,
    queensHelper(Xs, NewCol, NewBoard).

% https://stackoverflow.com/questions/40244936/prolog-cartesian-product-calculator
% the cartesian product of A and B is C
product(A, B, C) :-
    findall((X, Y), (member(X, A), member(Y, B)), C).

board(N, Board) :- 
    numlist(1, N, L1), 
    numlist(1, N, L2),
    product(L1, L2, Board).

% remove(C, Board, R). 
% R is the result board 
% if remove coord C from Board and C's row, column, and diagonal
% remove(_, R, R).
remove(C, Board, Out) :- exclude(need_remove(C), Board, Out).

need_remove(C1, C2) :- same_row(C1, C2).
need_remove(C1, C2) :- same_col(C1, C2).
need_remove(C1, C2) :- same_major(C1, C2).
need_remove(C1, C2) :- same_minor(C1, C2).

same_row((X, _), (X, _)).
same_col((_, Y), (_, Y)).
same_major((X1, Y1), (X2, Y2)) :- (X1 + Y1) =:= (X2 + Y2).
same_minor((X1, Y1), (X2, Y2)) :- (X1 - X2) =:= (Y1 - Y2).


