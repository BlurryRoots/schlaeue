% Prints each flat with its attributes (Color, Inhabitant, Pet, Drink, Smoke)
print_community([], _Number).
print_community([Flat | Community], Number) :-
	write('In flat nr('), write(Number), write('): '), write(Flat), nl,
	NextNumber is Number + 1,
	print_community(Community, NextNumber).
print_community(Community) :-
	print_community(Community, 1).

% Runs the test and generate approach.
run_testgenerate :-
	write('Running test generate approach:'), nl,
	consult('src/einstein_testgenerate'),
	time(solve(Community)),
	print_community(Community).

% Runs the constraints approach.
run_constrainst :-
	write('Running constraints approach:'), nl,
	consult('src/einstein_constraints'),
	time(solve(Community)),
	print_community(Community).

main :-
	run_testgenerate, nl,
	run_constrainst, nl.
