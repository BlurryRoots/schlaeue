:- use_module(library(clpfd)).

right_of(2, 1).
right_of(3, 2).
right_of(4, 3).
right_of(5, 4).
right_of(1, 5).

next_to(1, 5).
next_to(5, 1).
next_to(A, B) :-
	(A #= B + 1) #\/ (A #= B - 1).

solve(Colors, Inhabitants, Pets, Drinks, Cigarettes) :-
	Colors = [Red, Green, Ivory, Blue, Yellow],
	Inhabitants = [Englishman, Spaniard, Ukrainian, Norwegian, Japanese],
	Pets = [Dog, Snake, Zebra, Fox, Horse],
	Drinks = [Tea, OrangeJuice, Milk, Water, Coffee],
	Cigarettes = [OldGold, Kools, Chesterfield, LuckyStrike, Parliament],

	% color (red, green, ivory, blue, yellow)
	Colors ins 1..5,
	% inhabitant (englishman, spaniard, ukrainian, norwegian, japanese)
	Inhabitants ins 1..5,
	% pet (dog, snake, zebra, fox, horse)
	Pets ins 1..5,
	% drink (tea, orange_juice, milk, water, coffee)
	Drinks ins 1..5,
	% cigarette (old_gold, kools, chesterfield, lucky_strike, parliament)
	Cigarettes ins 1..5,

	all_distinct(Colors),
	all_distinct(Inhabitants),
	all_distinct(Pets),
	all_distinct(Drinks),
	all_distinct(Cigarettes),
	% 1) There are five houses in a row , each of a different color.

	% Entry [Color, Inhabitant, Pet, Drink, Cigarette].

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
	next_to(Horse, Kools),
	%13) The Lucky Strike smoker drinks orange juice.
	LuckyStrike #= OrangeJuice,
	%14) The Japanese smoke Parliaments.
	Japanese #= Parliament,
	%15) The Norwegian lives next to the blue house
	Norwegian #= Blue,
	Water #\= 0,
	Zebra #\= 0.
