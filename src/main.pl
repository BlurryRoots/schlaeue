
print_community([], _Number).
print_community([Flat | Community], Number) :-
	write('In flat nr('), write(Number), write('): '), write(Flat), nl,
	NextNumber is Number + 1,
	print_community(Community, NextNumber).
print_community(Community) :-
	print_community(Community, 1).

run_testgenerate :-
	consult('src/einstein_testgenerate'),
	solve(Community),
	print_community(Community).

main :-
	write('Running test generate approach:'), nl,
	run_testgenerate.
