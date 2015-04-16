% prgramming in prolog (using the iso standard)
% the practice of prolog

beverage('Mate').
beverage('Cola').
beverage('Schnaps').
beverage('Water').

person('Steffen').
person('Sven').
person('Max').
person('Tim').
person('Doro').

likes('Steffen', 'Cola').
likes('Steffen', 'Schnaps').
likes('Sven', 'Mate').
likes('Sven', 'Schnaps').
likes('Max', 'Schnaps').
likes('Tim', 'Water').
likes('Tim', 'Cola').
likes('Tim', 'Schnaps').
likes('Doro', 'Water').
likes('Doro', 'Schnaps').

country('China', 1339724852, 9571302, 'Peking').
country('Deutschland', 81802257, 357123, 'Berlin').
country('Indien', 1210193422, 3287590, 'Neu-Delhi').
country('Neuseeland', 4290347, 268680, 'Wellington').
country('USA', 311484627, 9629091, 'Washington D.C.').

% Später soll
% eine Regel
% erstellt werden,
% die die Einwohner pro qkm
% ermittelt.

density(CountryName, Result) :-
	country(CountryName, Population, Area, _Capital),
	Result is Population / Area.


% wenn a und b gleich sind so ist t gleich a oder b
ggt(A, A, A).
% wenn a less b dann t gleich gem ggT von a und b - a
ggt(A, B, T) :-
	A < B,
	C is B - A,
	ggt(A, C, T).
% wenn b less a dann gehe zu 2 mit vertauschten argumenten
ggt(A, B, T) :-
	B < A,
	ggt(B, A, T).

suicide :- halt.

mm(E, [E | _]).
mm(E, [_ | R]) :-
	mm(E, R).

has_car(andy, gm_hummer).
has_car(roland, honda_jazz).
has_car(sabine, ford_cougar).

car_of([], []).
car_of([Person | RestPerson], [Car | RestCar]) :-
	has_car(Person, Car),
	car_of(RestPerson, RestCar).

%univ awesome!
% Functor =.. CallList.
% Functor =.. [Functor, Arg1, Arg2].
