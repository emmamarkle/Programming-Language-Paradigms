% Emma Markle

% Check if a list has all distinct elements.
different([X|XS]):- not member(X, XS), different(XS).
different([]).

% Recursive case to check if all elements in a list are distinct.
differentR([X|XS]):- different(X), differentR(XS). 
differentR([]).

% Flatten a list of lists into a single list.
flattenL([],[]).
flattenL([X | [A|XS]], Y):- append(X, A, Z), flattenL([Z|XS], Y).
flattenL([X], Y):- X = Y.

% Compute the length of a list.
myLength([X|XS], Y) :- myLength(XS, Z), Y is Z+1.
myLength([], 0).

% Increment each element of a list by 1.
add1([],[]).
add1([X|XS], [Y|YS]) :- Y is X + 1, add1(XS, YS).

% Add corresponding elements of two lists to produce a third list.
addup([],[],[]).
addup([X|XS], [Y|YS], [Z|ZS]) :- Z is X + Y, addup(XS, YS, ZS).

% Remove consecutive duplicate elements from a list.
remdups([],[]).
remdups([X], [X]).
remdups([X,X|XS], Y):- remdups([X|XS], Y).
remdups([X,Y|XS], [X|YS]) :- X \= Y, remdups([Y|XS], YS).

% Calculate the sum of elements in a list.
sumlist([],0).
sumlist([X], X).
sumlist([X|XS], Sum):- sumlist(XS, Y), Sum is X + Y.

% Merge two sorted lists into a single sorted list.
merge_lists([],[],[]).
merge_lists([X|XS], [], [X|XS]).
merge_lists([],[Y|YS], [Y|YS]).
merge_lists([X|XS], [Y|YS], [X,Y|ZS]):- merge_lists(XS, YS, ZS).
