% Emma Markle & Phoebe Mugford

:- lib(lists).
:- lib(fd).
:- lib(fd_search).

% Solve a puzzle involving digits from 1 to 9 arranged into 4 numbers such that
% the product of the first two numbers equals the product of the last two numbers.
digits(X):- 
	setupDigits(X), 
	labeling(X).

% Initialize variables and constraints for the digits puzzle. The variables A, B, C, D, E, F, G, H, I
% are constrained to values from 1 to 9. It sets up equations and constraints for the puzzle and assigns 
% the results to M, N, O, P.
setupDigits(Y):- 
	X = [A,B,C,D,E,F,G,H,I],
	X :: 1..9,
	
	(A*100 + B*10 + C) #= M,
	(D*10 + E) #= N,
	(F*10 + G) #= O,
	(H*10 + I) #= P,
	M * N #= O * P,
	alldifferent(X),
	Y = [M,N,O,P].

% Solve the digits puzzle with the goal of minimizing the negative product of the first two numbers.
maxdigits(X):-
	setupDigits(X),
	X = [M,N,O,P],
	Prod #= -1*M*N, 
	minimize(labeling(X), Prod).

% Solve a puzzle with 5 variables such that the sums of their pairs match predefined weights, and each pair sum 
% corresponds to a unique weight in the list of weights.
hay(X):-
	setupHay(X),
	labeling(X).

% Initialize variables and constraints for the hay puzzle. Variables A, B, C, D, E are constrained to values 
% from 1 to 120. It sets up constraints where the sums of pairs of variables match predefined weights.
setupHay(X):-
	X = [A,B,C,D,E],
	X :: 1..120,
	VX = [V1,V2,V3,V4,V5,V6,V7,V8,V9,V10],
	Weights = [110,112,113,114,115,116,117,118,120,121],
	VX :: Weights,

	A+B #= V1,
	A+C #= V2,
	A+D #= V3,
	A+E #= V4,
	B+C #= V5,
	B+D #= V6,
	B+E #= V7,
	C+D #= V8,
	C+E #= V9,
	D+E #= V10,

	alldifferent(VX).

% Solve the beer puzzle where 6 variables are constrained to specific values, and the sum of the first two variables multiplied by 2
% equals the sum of the remaining three variables. All variables must be different.
beer(X):- 
	setupBeer(X).

% Initialize variables and constraints for the beer puzzle. The variables are constrained to specific values and the
% constraint ensures the equation involving these variables is satisfied.
setupBeer(F):- 
	X = [A,B,C,D,E,F],
	X :: [15,31,19,20,16,18],
	
	2*(A+B) #= C+D+E,
	alldifferent(X),
	labeling(X).

% Solve the planets puzzle where 12 variables represent planets, and their sums must match specific values,
% and the sum of the first 7 variables is equal to a given value.
planets(X):-
	setupPlanets(X).

% Solve the planets puzzle with an additional constraint where one planet's value must be less than another's.
planets2(X):-
	setupPlanets2(X).

% Initialize variables and constraints for the planets puzzle. The variables represent different planets with specific constraints
% on their sums. Additionally, the sum of the first 7 variables is constrained to a given value.
setupPlanets(Yy):-
	Xx = [U,R,N,E,T,S,A,P,O,M,L,J,I,H,V,C,Y],
	Xx :: 1..60,
	
	P+L+U+T+O #= 40,
	U+R+A+N+U+S #= 36,
	N+E+P+T+U+N+E #= 29,
	S+A+T+U+R+N #= 33,
	J+U+P+I+T+E+R #= 50,
	M+A+R+S #= 32,
	E+A+R+T+H #= 31,
	M+O+O+N #= 36,
	V+E+N+U+S #= 39,
	M+E+R+C+U+R+Y #= 33,
	S+U+N #= 18,

	alldifferent(Xx),
	labeling(Xx),
	P+L+A+N+E+T+S #= Yy.

% Initialize variables and constraints for the planets puzzle with an additional constraint that one planet's value must be less than another's.
setupPlanets2(Yy):-
	Xx = [U,R,N,E,T,S,A,P,O,M,L,J,I,H,V,C,Y],
	Xx :: 1..60,
	
	P+L+U+T+O #= 40,
	U+R+A+N+U+S #= 36,
	N+E+P+T+U+N+E #= 29,
	S+A+T+U+R+N #= 33,
	J+U+P+I+T+E+R #= 50,
	M+A+R+S #= 32,
	E+A+R+T+H #= 31,
	M+O+O+N #= 36,
	V+E+N+U+S #= 39,
	M+E+R+C+U+R+Y #= 33,
	S+U+N #= 18,
	N #< U,

	alldifferent(Xx),
	labeling(Xx),
	P+L+A+N+E+T+S #= Yy.

% Helper predicate to sum the elements of a list.
add([],0).
add([X|Xs],Y) :- add(Xs,Z),Y = X+Z.

% Helper predicate to multiply the elements of a list by a given factor.
mult([],Y,[]).
mult([X|Xs],Y,[Z|Zs]) :- Z = X*Y, mult(Xs,Y,Zs).

% Helper predicate to compute the power of a number.
pow(X,0,1).
pow(0,Y,1).
pow(X,Y,Z):- Y1 is Y-1, pow(X,Y1,Z1), Z is Z1*X.

% Solve the tea puzzle where 3 variables represent quantities of tea and must sum to 20,
% with their weighted sum matching 570. The goal is to minimize the amount of the first variable.
tea(T):- 
	T = [A,B,C],
	T :: 0..20,
	A + B + C #= 20,
	(A * 30) + (B * 27) + (C * 21) #= 570,
	minimize(labeling(T), A).

% Solve the eggs puzzle where one variable represents the number of eggs and it must be a common multiple
% of 2 through 7, with the goal of minimizing this number.
eggs(T):- 
	T = [X],
	X #> 0,
	2 * A + 1 #= X,
	3 * B + 1 #= X,
	4 * C + 1 #= X,
	5 * D + 1 #= X,
	6 * E + 1 #= X,
	7 * F #= X,
	minimize(labeling(T), X).

% Solve the wine puzzle where each of 5 variables is a list of 5 numbers,
% and constraints on sums and weighted sums are imposed to satisfy specific conditions.
wine(X):-
	X = [A,B,C,D,E],
	A = [A1,A2,A3,A4,A5],
	B = [B1,B2,B3,B4,B5],
	C = [C1,C2,C3,C4,C5],
	D = [D1,D2,D3,D4,D5],
	E = [E1,E2,E3,E4,E5],

	A :: 1..9,
	B :: 1..9,
	C :: 1..9,
	D :: 1..9,
	E :: 1..9,

	A1+B1+C1+D1+E1 #= 9,
	A2+B2+C2+D2+E2 #= 9,
	A3+B3+C3+D3+E3 #= 9,
	A4+B4+C4+D4+E4 #= 9,
	A5+B5+C5+D5+E5 #= 9,

	A1+A2+A3+A4+A5 #= Y,
	B1+B2+B3+B4+B5 #= Y,
	C1+C2+C3+C4+C5 #= Y,
	D1+D2+D3+D4+D5 #= Y,
	E1+E2+E3+E4+E5 #= Y,

	A1*4+A2*3+A3*2+A4 #= Z,
	B1*4+B2*3+B3*2+B4 #= Z,
	C1*4+C2*3+C3*2+C4 #= Z,
	D1*4+D2*3+D3*2+D4 #= Z,
	E1*4+E2*3+E3*2+E4 #= Z,

	labeling(A),
	labeling(B),
	labeling(C),
	labeling(D),
	labeling(E),

% Solve the Kakurasu puzzle by defining rows with binary values and applying constraints to meet specific weighted sums for each row and column.
kakurasu(X):-
	X = [A,B,C,D,E,F,G,H],
	Vals = [1,2,3,4,5,6,7,8],
	A = [A1,A2,A3,A4,A5,A6,A7,A8],
	B = [B1,B2,B3,B4,B5,B6,B7,B8],
	C = [C1,C2,C3,C4,C5,C6,C7,C8],
	D = [D1,D2,D3,D4,D5,D6,D7,D8],
	E = [E1,E2,E3,E4,E5,E6,E7,E8],
	F = [F1,F2,F3,F4,F5,F6,F7,F8],
	G = [G1,G2,G3,G4,G5,G6,G7,G8],
	H = [H1,H2,H3,H4,H5,H6,H7,H8],
	A :: 0..1,
	B :: 0..1,
	C :: 0..1,
	D :: 0..1,
	E :: 0..1,
	F :: 0..1,
	G :: 0..1,
	H :: 0..1,
	C1 + C2*2 + C3*3 + C4*4 + C5*5 + C6*6 + C7*7 + C8*8 #= 5,
	D1 + D2*2 + D3*3 + D4*4 + D5*5 + D6*6 + D7*7 + D8*8 #= 10,
	E1 + E2*2 + E3*3 + E4*4 + E5*5 + E6*6 + E7*7 + E8*8 #= 29,
	G1 + G2*2 + G3*3 + G4*4 + G5*5 + G6*6 + G7*7 + G8*8 #= 26,
	
	A1 + B1*2 + C1*3 + D1*4 + E1*5 + F1*6 + G1*7 + H1*8 #= 6,
	A2 + B2*2 + C2*3 + D2*4 + E2*5 + F2*6 + G2*7 + H2*8 #= 15,
	A3 + B3*2 + C3*3 + D3*4 + E3*5 + F3*6 + G3*7 + H3*8 #= 28,
	A4 + B4*2 + C4*3 + D4*4 + E4*5 + F4*6 + G4*7 + H4*8 #= 27,
	A5 + B5*2 + C5*3 + D5*4 + E5*5 + F5*6 + G5*7 + H5*8 #= 30,
	A6 + B6*2 + C6*3 + D6*4 + E6*5 + F6*6 + G6*7 + H6*8 #= 28,
	A7 + B7*2 + C7*3 + D7*4 + E7*5 + F7*6 + G7*7 + H7*8 #= 6,
	A8 + B8*2 + C8*3 + D8*4 + E8*5 + F8*6 + G8*7 + H8*8 #= 30,

	labeling(A),
	labeling(B),
	labeling(C),
	labeling(D),
	labeling(E),
	labeling(F),
	labeling(G),
	labeling(H),
	labeling(X).	

% Solve a grid-based puzzle by defining rows and columns with binary values and applying constraints to match specific sums for rows, columns, and diagonals.
grid(X):-
	X = [A,B,C,D],
	A = [A1,A2,A3,A4],
	B = [B1,B2,B3,B4],
	C = [C1,C2,C3,C4],
	D = [D1,D2,D3,D4],
	A :: 0..1,
	B :: 0..1,
	C :: 0..1,
	D :: 0..1,
	A1 + A2 + A3 + A4 #= ASUM,
	B1 + B2 + B3 + B4 #= BSUM,
	C1 + C2 + C3 + C4 #= CSUM,
	D1 + D2 + D3 + D4 #= DSUM,
	A1 + B1 + C1 + D1 #= ONESUM,
	A2 + B2 + C2 + D2 #= TWOSUM,
	A3 + B3 + C3 + D3 #= THREESUM,
	A4 + B4 + C4 + D4 #= FOURSUM,
	2*_ #= ASUM + ONESUM - A1,
	2*_ #= ASUM + TWOSUM - A2,
	2*_ #= ASUM + THREESUM - A3,
	2*_+1 #= ASUM + FOURSUM - A4,
	2*_ #= BSUM + ONESUM - B1,
	2*_ #= BSUM + TWOSUM - B2,
	2*_ #= BSUM + THREESUM - B3,
	2*_+1 #= BSUM + FOURSUM - B4,
	2*_+1 #= CSUM + ONESUM - C1,
	2*_ #= CSUM + TWOSUM - C2,
	2*_+1 #= CSUM + THREESUM - C3,
	2*_ #= CSUM + FOURSUM - C4,
	2*_+1 #= DSUM + ONESUM - D1,
	2*_ #= DSUM + TWOSUM - D2,
	2*_ #= DSUM + THREESUM - D3,
	2*_ #= DSUM + FOURSUM - D4,
	labeling(A),
	labeling(B),
	labeling(C),
	labeling(D),
	labeling(X).

