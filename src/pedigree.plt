
:- use_module(library(plunit)).

:- begin_tests(pedigree).

load_dependencies :-
	consult('src/db.pl'), consult('src/pedigree.pl').

test(child, [setup(load_dependencies), nondet]) :-
	children(ActualChildren, 'Hans Koks'),
	assertion(length(ActualChildren, 2)),
	assertion(member('Karl Koks', ActualChildren)),
	assertion(member('Lucy Koks', ActualChildren)).

test(parents, [setup(load_dependencies)]) :-
	parents(ActualParents, 'Kurt Normalverbraucher'),
	ExpectedParents = ['Otto Normalverbraucher', 'Sina Käse'],
	assertion(ExpectedParents = ActualParents).

test(grand_parents, [setup(load_dependencies)]) :-
	grand_parents(ActualGrandParents, 'Karl Koks'),
	ExpectedMotherFather = 'Otto Normalverbraucher',
	ExpectedMotherMother = 'Sina Käse',
	ExpectedFatherFather = 'Frank Koks',
	ExpectedFatherMother = 'Karolina Koks',
	assertion(length(ActualGrandParents, 4)),
	assertion(member(ExpectedMotherFather, ActualGrandParents)),
	assertion(member(ExpectedMotherMother, ActualGrandParents)),
	assertion(member(ExpectedFatherFather, ActualGrandParents)),
	assertion(member(ExpectedFatherMother, ActualGrandParents)).

test(grand_child, [setup(load_dependencies)]) :-
	grand_children(ActualGrandchildren, 'Sina Käse'),
	assertion(length(ActualGrandchildren, 4)),
	assertion(member('Max Kolumna', ActualGrandchildren)),
	assertion(member('Alesya Kolumna', ActualGrandchildren)),
	assertion(member('Karl Koks', ActualGrandchildren)),
	assertion(member('Lucy Koks', ActualGrandchildren)).

:- end_tests(pedigree).
