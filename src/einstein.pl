
/*
	(red, green, ivory, blue, yellow)
	(englishman, spaniard, ukrainian, norwegian, japanese)
	(dog, snake, zebra, fox, horse)
	(tea, orange_juice, milk, water, coffee)
	(old_gold, kools, chesterfield, lucky_strike, parliament)
*/

% Entry [Color, Inhabitant, Pet, Drink, Cigarette]

solve(Community) :-
% 1) There are five houses in a row , each of a different color
	length(Community, 5),
% 2) The Englishman lives in the red house.
	member([], Community),
% 3) The Spaniard owns the dog.
% 4) Coffee is drunk in the green house.
% 5) The Ukrainian drinks tea.
% 6) The green house is immediately to the right of the ivory house.
% 7) The Old Gold smoker owns the snake.
% 8) Kools are smoked in the yellow house.
% 9) Milk is drunk in the middle house.
%10) The Norwegian lives in the first house on the left.
%11) The man who smokes Chesterfields lives in the house next to the man with the fox.
%12) Kools are smoked in the house next to the house where the horse is kept.
%13) The Lucky Strike smoker drinks orange juice.
%14) The Japanese smoke Parliaments.
%15) The Norwegian lives next to the blue house

	true.
