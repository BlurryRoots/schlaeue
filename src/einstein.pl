:- use_module(library(clpfd)).

% colored houses
color(red).
color(green).
color(ivory).
color(blue).
color(yellow).
% poeple living in said houses
inhabitant(englishman).
inhabitant(spaniard).
inhabitant(ukrainian).
inhabitant(norwegian).
inhabitant(japanese).
% the pet of said inhabitants
pet(dog).
pet(snake).
pet(zebra).
pet(fox).
pet(horse).
% the drinks those inhabtiants drink
drink(tea).
drink(orange_juice).
drink(milk).
drink(water).
drink(coffee).
% the cigarettes they smoke
cigarette(old_gold).
cigarette(kools).
cigarette(chesters).
cigarette(lucky_strike).
cigarette(parliament).

next_to(Nr, Nr2) :-
	D is Nr - Nr2, abs(D, 1).
right_of(Nr, Nr2) :-
	Nr is Nr2 - 1.

% House list signature
% 	[Nr, Color, Inhabitant, Pet, Drink, Cigarette]
generate([A, B, C, D, E]) :-
	findall(X, color(X), Colors), permutation(Colors, [CoA, CoB, CoC, CoD, CoE]),
	findall(X, inhabitant(X), Inhabitants), permutation(Inhabitants, [InA, InB, InC, InD, InE]),
	findall(X, pet(X), Pets), permutation(Pets, [PeA, PeB, PeC, PeD, PeE]),
	findall(X, drink(X), Drinks), permutation(Drinks, [DrA, DrB, DrC, DrD, DrE]),
	findall(X, cigarette(X), Cigarettes), permutation(Cigarettes, [CiA, CiB, CiC, CiD, CiE]),
	A = [1, CoA, InA, PeA, DrA, CiA],
	B = [2, CoB, InB, PeB, DrB, CiB],
	C = [3, CoC, InC, PeC, DrC, CiC],
	D = [4, CoD, InD, PeD, DrD, CiD],
	E = [5, CoE, InE, PeE, DrE, CiE].

test(Houses) :-
%  1) Five houses in a row, all have different colors.
%  2) Englishman in red house.
	member([_, red, englishman | _], Houses),
%  3) Spaniard owns dog.
	member([_, _, spaniard, dog | _], Houses),
%  4) Coffee in green house.
%  6) Green house right of ivory house.
	member([NrGreen, green, _, _, coffee, _], Houses),
	member([NrIvory, ivory | _], Houses),
	right_of(NrGreen, NrIvory),
%  5) Ukrainian drinks tea.
	member([_, _, _, ukrainian, _, tea, _], Houses),
%  7) Old Gold smoker owns snake.
	member([_, _, _, snake, _, old_gold], Houses),
%  8) Kools smoker in yellow house.
% 12) Kools smoker in house next to house with horse
	member(House, [NrYellow, yellow, _, _, _, kools], Houses),
	member(House, [NrHorse_, _, horse, _, _], Houses),
	next_to(NrYellow, NrHorse_),
%  9) Milk in middle house.
	member([3, _, _, _, milk, _], Houses),
% 10) Norwegian first house left.
% 15) Norwegian lives next to blue house
	member([NrNorwegian, _, norwegian, _, _, _], Houses),
	NrNorwegian = 1,
	member([NrBlue, blue, _, _, _, _], Houses),
	next_to(NrNorwegian, NrBlue),
% 11) Chesterfields smoker in house next to man with fox.
	member([NrFox, _, _, fox, _, _], Houses),
	member([NrChester, _, _, _, _, chesters], Houses),
	next_to(NrFox, NrChester),
% 13) Lucky Strike smoker drinks orange juice
	member([_, _, _, _, orange_juice, lucky_strike], Houses),
% 14) Japanese smokes Parliament
	member([_, _, japanese, _, _, parliament], Houses).

solve(Result) :-
	generate(Result),
	test(Result).
