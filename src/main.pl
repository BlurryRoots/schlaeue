
print_community([], _Number).
print_community([Flat | Community], Number) :-
	write('In flat nr('), write(Number), write('): '), write(Flat), nl,
	NextNumber is Number + 1,
	print_community(Community, NextNumber).
print_community(Community) :-
	print_community(Community, 1).

main :-
	consult('src/einstein'),
	solve(Community),
	print_community(Community).
