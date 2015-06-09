:- use_module(library(plunit)).

:- begin_tests(einstein_constraints).

/* problem domains
	color (red, green, ivory, blue, yellow)
	inhabitant (englishman, spaniard, ukrainian, norwegian, japanese)
	pet (dog, snake, zebra, fox, horse)
	drink (tea, orange_juice, milk, water, coffee)
	cigarette (old_gold, kools, chesterfield, lucky_strike, parliament)

	Entry [Color, Inhabitant, Pet, Drink, Cigarette]
*/

prepare :-
	consult('src/einstein_constraints').

test(right, [setup(prepare)]) :-
	assertion(right_of(2, 1)).

test(next, [setup(prepare)]) :-
	assertion(next_to(2, 3)),
	assertion(next_to(3, 2)).

test(solving, [setup(prepare), nondet]) :-
	solve(_).

:- end_tests(einstein_constraints).
