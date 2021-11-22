% concat(L1, L2, L)
% L is the concatenation of L1 and L2
concat([], [], []).
concat([], [Y | YS], [Y | ZS]) :- concat([], YS, ZS).
concat([X | XS], YS, [X | ZS]) :- concat(XS, YS, ZS).

% element_at(X, N, L)
% element X is the Nth element in list L
element_at(X, 1, [X | _]).
element_at(X, N2, [Y | YS]) :- element_at(X, N1, YS), N2 is N1 + 1.

