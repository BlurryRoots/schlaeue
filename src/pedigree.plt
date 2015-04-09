
:- use_module(library(plunit)).

:- begin_tests(pedigree).

load_dependencies :-
	consult('src/db.pl'), consult('src/pedigree.pl').

test(child, [setup(load_dependencies)]) :-
	assertion(child('Lucy Lu', 'Hans Gruber')).

test(parents, [setup(load_dependencies)]) :-
	assertion(parents('Kurt Bach', ['Otto Normalverbraucher', 'Sina Rose'])).

:- end_tests(pedigree).
