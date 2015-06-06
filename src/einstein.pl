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

% House list signature
% 	[Color, Inhabitant, Pet, Drink, Cigarette]

%  1) Five houses in a row, all have different colors.
%  2) Englishman in red house.
check_englishman([]) :-
	false.
check_englishman([House | Rest]) :-
	[red, englishman | _] = House;
	check_englishman(Rest).
%  3) Spaniard owns dog.
check_spaniard([]) :-
	false.
check_spaniard([House | Rest]) :-
	[_, spaniard, dog | _] = House;
	check_spaniard(Rest).
%  4) Coffee in green house.
check_coffee([]) :-
	false.
check_coffee([House | Rest]) :-
	[green, _, _, coffee, _] = House;
	check_coffee(Rest).
%  5) Ukrainian drinks tea.
check_ukrainian([]) :-
	false.
check_ukrainian([House | Rest]) :-
	[_, ukrainian, _, tea, _] = House;
	check_ukrainian(Rest).
%  6) Green house right of ivory house.
check_greenhouse([]) :-
	false.
check_greenhouse([House, RightHouse | Rest]) :-
	(
		[green | _] = House,
		[ivory | _] = RightHouse
	);
	check_greenhouse(Rest).
%  7) Old Gold smoker owns snake.
check_oldgold([]) :-
	false.
check_oldgold([House | Rest]) :-
	[_, _, snake, _, old_gold] = House;
	check_oldgold(Rest).
%  8) Kools smoker in yellow house.
% 12) Kools smoker in house next to house with horse
check_kools_helper([yellow, _, _, _, kools], [_, _, horse, _, _]).
check_kools_helper([_, _, horse, _, _], [yellow, _, _, _, kools]).
check_kools([]) :-
	false.
check_kools([House, RightHouse | Rest]) :-
	check_kools_helper(House, RightHouse);
	check_kools(Rest).
%  9) Milk in middle house.
check_kools([_, _, House, _, _]) :-
	[_, _, _, milk, _] = House.
% 10) Norwegian first house left.
% 15) Norwegian lives next to blue house
check_norwegian([House, RightHouse, _, _, _]) :-
	[_, norwegian, _, _, _] = House,
	[blue, _, _, _, _] = RightHouse.
% 11) Chesterfields smoker in house next to man with fox.
check_chesterfields_helper([_, _, _, _, chesters], [_, _, fox, _, _]).
check_chesterfields_helper([_, _, fox, _, _], [_, _, _, _, chesters]).
check_chesterfields([]) :-
	false.
check_chesterfields([House, RightHouse | Rest]) :-
	check_chesterfields_helper(House, RightHouse);
	check_chesterfields(Rest).
% 13) Lucky Strike smoker drinks orange juice
check_lucky([]) :-
	false.
check_lucky([[_, _, _, orange_juice, lucky_strike] | _]).
check_lucky([_ | Rest]) :-
	check_lucky(Rest).
% 14) Japanese smokes Parliament
check_japanese([]) :-
	false.
check_japanese([[_, japanese, _, _, parliament] | _]).
check_japanese([_ | Rest]) :-
	check_lucky(Rest).

generate([A, B, C, D, E]) :-
	findall(X, color(X), Colors), permutation(Colors, [CoA, CoB, CoC, CoD, CoE]),
	findall(X, inhabitant(X), Inhabitants), permutation(Inhabitants, [InA, InB, InC, InD, InE]),
	findall(X, pet(X), Pets), permutation(Pets, [PeA, PeB, PeC, PeD, PeE]),
	findall(X, drink(X), Drinks), permutation(Drinks, [DrA, DrB, DrC, DrD, DrE]),
	findall(X, cigarette(X), Cigarettes), permutation(Cigarettes, [CiA, CiB, CiC, CiD, CiE]),
	A = [CoA, InA, PeA, DrA, CiA],
	B = [CoB, InB, PeB, DrB, CiB],
	C = [CoC, InC, PeC, DrC, CiC],
	D = [CoD, InD, PeD, DrD, CiD],
	E = [CoE, InE, PeE, DrE, CiE].

test(Houses) :-
	check_englishman(Houses),
	check_spaniard(Houses),
	check_coffee(Houses),
	check_ukrainian(Houses),
	check_greenhouse(Houses),
	check_oldgold(House),
	check_kools(House),
	check_norwegian(House),
	check_chesterfields(House),
	check_lucky(House),
	check_japanese(House).

solve(Result) :-
	generate(Result),
	test(Result).
