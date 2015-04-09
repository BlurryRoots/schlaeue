
:- use_module(library(plunit)).

:- begin_tests(pedigree).

load_dependencies :-
	consult('src/db.pl'), consult('src/pedigree.pl').

test(child, [setup(load_dependencies)]) :-
	child(ActualChild, 'Hans Gruber'),
	ExpectedChild = 'Karl Heinz',
	assertion(ExpectedChild = ActualChild).

test(parents, [setup(load_dependencies)]) :-
	parents(ActualParents, 'Kurt Bach'),
	ExpectedParents = ['Otto Normalverbraucher', 'Sina Rose'],
	assertion(ExpectedParents = ActualParents).

test(grand_parents, [setup(load_dependencies)]) :-
	grand_parents(ActualGrandParents, 'Karl Heinz'),
	ExpectedGrandParents = ['Otto Normalverbraucher', 'Sina Rose'],
	assertion(grand_parents(ExpectedGrandParents, ActualGrandParents)).

%test(grand_child, [setup(load_dependencies)]) :-
%	assertion(grand_child('Lucy Lu', 'Sina Rose')).

:- end_tests(pedigree).
