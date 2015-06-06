:- use_module(library(plunit)).

:- begin_tests(einstein).

/* problem domains
	color (red, green, ivory, blue, yellow)
	inhabitant (englishman, spaniard, ukrainian, norwegian, japanese)
	pet (dog, snake, zebra, fox, horse)
	drink (tea, orange_juice, milk, water, coffee)
	cigarette (old_gold, kools, chesterfield, lucky_strike, parliament)

	Entry [Color, Inhabitant, Pet, Drink, Cigarette]
*/

prepare :-
	consult('src/einstein').

test(right_side_relation, [setup(prepare)]) :-
	Community = [[hans], [karl], [julia], [laura]],
	assertion(first([hans], Community)).

test(right_side_relation, [setup(prepare)]) :-
	Community = [[hans], [karl], [julia], [laura]],
	assertion(right_of([karl], [hans], Community)).

test(next_relation, [setup(prepare)]) :-
	Community = [[hans], [karl], [julia], [laura]],
	assertion(next_to([laura], [julia], Community)).

% testing the result for correctness
% see https://de.wikipedia.org/wiki/Zebrar%C3%A4tsel for possible solutions
% in this exercise the relations are right (instead of left)
test(solving, [setup(prepare), nondet]) :-
	solve(Community),
	assertion(length(Community, 5)),
	assertion(member([ivory, spaniard, dog, orange_juice, lucky_strike], Community)),
	assertion(member([green, japanese, zebra, coffee, parliament], Community)),
	assertion(member([red, englishman, snake, milk, old_gold], Community)),
	assertion(member([blue, ukrainian, horse, tea, chesterfield], Community)),
	assertion(member([yellow, norwegian, fox, water, kools], Community)).

:- end_tests(einstein).
