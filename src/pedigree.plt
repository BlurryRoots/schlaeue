
:- use_module(library(plunit)).

:- begin_tests(pedigree).

load_dependencies :-
	consult('src/db.pl'), consult('src/pedigree.pl').

test(stuff, [
	setup(load_dependencies)
]) :-
	findall(C, father('Hans Gruber', C), Children),
	write('Children: '), write(Children),
	assertion(child('Lucy Lu', 'Hans Gruber')).

:- end_tests(pedigree).
