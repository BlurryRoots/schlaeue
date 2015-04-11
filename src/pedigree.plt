
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
	ExpectedMotherFather = 'Otto Normalverbraucher',
	ExpectedMotherMother = 'Sina Rose',
	ExpectedFatherFather = 'Frank Frei',
	ExpectedFatherMother = 'Karolina Koks',
	assertion(length(ActualGrandParents, 4)),
	assertion(member(ExpectedMotherFather, ActualGrandParents)),
	assertion(member(ExpectedMotherMother, ActualGrandParents)),
	assertion(member(ExpectedFatherFather, ActualGrandParents)),
	assertion(member(ExpectedFatherMother, ActualGrandParents)).

test(grand_child, [setup(load_dependencies)]) :-
	grand_child(ActualGrandChild, 'Sina Rose'),
	ExpectedGrandChild = 'Karl Heinz',
	assertion(ExpectedGrandChild = ActualGrandChild).

:- end_tests(pedigree).
