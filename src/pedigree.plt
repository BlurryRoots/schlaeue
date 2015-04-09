
:- use_module(library(plunit)).

:- begin_tests(pedigree).

load_dependencies :-
	consult('src/db.pl'), consult('src/pedigree.pl').

test(child, [setup(load_dependencies)]) :-
	child(ActualChild, 'Hans Gruber'),
	ExpectedChild = 'Lucy Lu',
	assertion(ExpectedChild = ActualChild).

test(parents, [setup(load_dependencies)]) :-
	parents(ActualParents, 'Kurt Bach'),
	ExpectedParents = ['Otto Normalverbraucher', 'Sina Rose'],
	assertion(ExpectedParents = ActualParents).

:- end_tests(pedigree).
