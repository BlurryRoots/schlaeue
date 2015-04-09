
:- use_module(library(plunit)).

:- begin_tests(pedigree).

load_dependencies :-
	consult('src/db.pl'), consult('src/pedigree.pl').

test(child, [setup(load_dependencies)]) :-
	assertion(child('Lucy Lu', 'Hans Gruber')).

test(parents, [setup(load_dependencies)]) :-
	assertion(parents(['Otto Normalverbraucher', 'Sina Rose'], 'Kurt Bach')).

test(grand_parents, [setup(load_dependencies)]) :-
	assertion(grand_parents(['Otto Normalverbraucher', 'Sina Rose'], 'Karl Heinz')).

test(grand_child, [setup(load_dependencies)]) :-
	assertion(grand_child('Lucy Lu', 'Sina Rose')).

:- end_tests(pedigree).
