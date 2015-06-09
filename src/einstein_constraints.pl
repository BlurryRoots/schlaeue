:- use_module(library(clpfd)).

right_of(A, B) :-
	A #= B + 1.

next_to(A, B) :-
	right_of(A, B).
next_to(A, B) :-
	A #= B - 1.

% maps the solved domains to the possible values and builds the houses
map([], [], Accu, Mapping) :-
	% at the end of recursion, reverse to get right order back
	reverse(Accu, Reversed),
	% and create new lists which are the values at each index in given list
	transpose(Reversed, Mapping).
map([D | RestD], [V | RestV], Accu, Mapping) :-
	% map domain (numbers) to the possible values, where the key is the house
	% number and the value is the possible value (like dog or norwegian)
	% see http://www.swi-prolog.org/pldoc/doc_for?object=pairs_keys_values/3
	pairs_keys_values(Pairs, D, V),
	% sort the entries by key (house number), relation works on associate lists
	keysort(Pairs, SortedPairs),
	% extract the sorted values so they can later be transposed
	pairs_keys_values(SortedPairs, _, SortedValues),
	% recurse to build the matrix
	map(RestD, RestV, [SortedValues | Accu], Mapping).
map(Domains, Values, Mapping) :-
	% call helper
	map(Domains, Values, [], Mapping).

define_domain(Domain) :-
	Domain ins 1..5, all_distinct(Domain).
pindown_domain(Domain) :-
	label(Domain).

solve(Community) :-
	% Define the problems domains.
	Domains = [Colors, Inhabitants, Pets, Drinks, Cigarettes],
	% color (red, green, ivory, blue, yellow)
	Colors = [Red, Green, Ivory, Blue, Yellow],
	define_domain(Colors),
	% inhabitant (englishman, spaniard, ukrainian, norwegian, japanese)
	Inhabitants = [Englishman, Spaniard, Ukrainian, Norwegian, Japanese],
	define_domain(Inhabitants),
	% pet (dog, snake, zebra, fox, horse)
	Pets = [Dog, Snake, Zebra, Fox, Horse],
	define_domain(Pets),
	% drink (tea, orange_juice, milk, water, coffee)
	Drinks = [Tea, OrangeJuice, Milk, Water, Coffee],
	define_domain(Drinks),
	% cigarette (old_gold, kools, chesterfield, lucky_strike, parliament)
	Cigarettes = [OldGold, Kools, Chesterfield, LuckyStrike, Parliament],
	define_domain(Cigarettes),

	% 1) There are five houses in a row , each of a different color.

	% 2) The Englishman lives in the red house.
	Englishman #= Red,
	% 3) The Spaniard owns the dog.
	Spaniard #= Dog,
	% 4) Coffee is drunk in the green house.
	Coffee #= Green,
	% 5) The Ukrainian drinks tea.
	Ukrainian #= Tea,
	% 6) The green house is immediately to the right of the ivory house.
	right_of(Green, Ivory),
	% 7) The Old Gold smoker owns the snake.
	OldGold #= Snake,
	% 8) Kools are smoked in the yellow house.
	Kools #= Yellow,
	% 9) Milk is drunk in the middle house.
	Milk #= 3,
	%10) The Norwegian lives in the first house on the left.
	Norwegian #= 1,
	%11) The man who smokes Chesterfields lives in the house next to the man with the fox.
	next_to(Fox, Chesterfield),
	%12) Kools are smoked in the house next to the house where the horse is kept.
	next_to(Kools, Horse),
	%13) The Lucky Strike smoker drinks orange juice.
	LuckyStrike #= OrangeJuice,
	%14) The Japanese smoke Parliaments.
	Japanese #= Parliament,
	%15) The Norwegian lives next to the blue house
	next_to(Norwegian, Blue),

	% To suppress the unused warnings
	Zebra #\= 0, Water #\= 0,

	% Pin down all Variables, so a definitive answer can be found.
	pindown_domain(Colors),
	pindown_domain(Inhabitants),
	pindown_domain(Pets),
	pindown_domain(Drinks),
	pindown_domain(Cigarettes),

	% build the community by mapping the domain values to their values
	Values = [
		[red, green, ivory, blue, yellow],
		[englishman, spaniard, ukrainian, norwegian, japanese],
		[dog, snake, zebra, fox, horse],
		[tea, orange_juice, milk, water, coffee],
		[old_gold, kools, chesterfield, lucky_strike, parliament]
	],
	map(Domains, Values, Community).
