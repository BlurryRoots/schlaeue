% module for solving a einstein puzzle

/* problem domains
	color (red, green, ivory, blue, yellow)
	inhabitant (englishman, spaniard, ukrainian, norwegian, japanese)
	pet (dog, snake, zebra, fox, horse)
	drink (tea, orange_juice, milk, water, coffee)
	cigarette (old_gold, kools, chesterfield, lucky_strike, parliament)

	Entry [Color, Inhabitant, Pet, Drink, Cigarette]
*/

% checks if the resident has the first house in the community
first(A, [A | _Rest]).

middle(A, [_, _, A, _, _]).

% checks if A lives (directly) to the right of B
right_of(A, B, [B, A | _Rest]).
right_of(A, B, [_ | Rest]) :-
	right_of(A, B, Rest).

% checks if A lives either to the right or the left of B
next_to(A, B, Community) :-
	right_of(A, B, Community).
next_to(A, B, Community) :-
	right_of(B, A, Community).

solve(Community) :-
% 1) There are five houses in a row , each of a different color
	length(Community, 5),
	Community = [
		[C1 | _], [C2 | _], [C3 | _], [C4 | _], [C5 | _]
	],
	list_to_set([C1, C2, C3, C4, C5], [C1, C2, C3, C4, C5]),
% 2) The Englishman lives in the red house.
	member([red, englishman, _, _, _], Community),
% 3) The Spaniard owns the dog.
	member([_, spaniard, dog, _, _], Community),
% 4) Coffee is drunk in the green house.
	member([green, _, _, coffee, _], Community),
% 5) The Ukrainian drinks tea.
	member([_, ukrainian, _, tea, _], Community),
% 6) The green house is immediately to the right of the ivory house.
	right_of([green, _, _, _, _], [ivory, _, _, _, _], Community),
% 7) The Old Gold smoker owns the snake.
	member([_, _, snake, _, old_gold], Community),
% 8) Kools are smoked in the yellow house.
	member([yellow, _, _, _, kools], Community),
% 9) Milk is drunk in the middle house.
	middle([_, _, _, milk, _], Community),
%10) The Norwegian lives in the first house on the left.
	first([_, norwegian, _, _, _], Community),
%11) The man who smokes Chesterfields lives in the house next to the man with the fox.
	next_to([_, _, _, _, chesterfield], [_, _, fox, _, _], Community),
%12) Kools are smoked in the house next to the house where the horse is kept.
	next_to([_, _, _, _, kools], [_, _, horse, _, _], Community),
%13) The Lucky Strike smoker drinks orange juice.
	member([_, _, _, orange_juice, lucky_strike], Community),
%14) The Japanese smoke Parliaments.
	member([_, japanese, _, _, parliament], Community),
%15) The Norwegian lives next to the blue house
	next_to([_, norwegian, _, _, _], [blue, _, _, _, _], Community),
% Missing membership of a water drinker
	member([_, _, _, water, _], Community),
% Missing membership of the person owning the zebra
	member([_, _, zebra, _, _], Community).
