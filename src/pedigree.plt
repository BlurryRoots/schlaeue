
:- use_module(library(plunit)).

:- begin_tests(pedigree).

load_dependencies :-
	consult('src/db.pl'), consult('src/pedigree.pl').

test(siblings, [setup(load_dependencies)]) :-
	siblings(ActualSiblings, 'Kurt Normalverbraucher'),
	assertion(length(ActualSiblings, 2)),
	assertion(member('Lara Normalverbraucher', ActualSiblings)),
	assertion(member('Bernd Normalverbraucher', ActualSiblings)).

test(brothers, [setup(load_dependencies)]) :-
	findall(
		Brother,
		brother(Brother, 'Lara Normalverbraucher'),
		ActualBrothers
	),
	assertion(length(ActualBrothers, 2)),
	assertion(member('Kurt Normalverbraucher', ActualBrothers)),
	assertion(member('Bernd Normalverbraucher', ActualBrothers)).

test(sisters, [setup(load_dependencies)]) :-
	findall(
		Sister,
		sister(Sister, 'Bernd Normalverbraucher'),
		ActualSisters
	),
	assertion(length(ActualSisters, 1)),
	assertion(member('Lara Normalverbraucher', ActualSisters)).

test(children, [setup(load_dependencies), nondet]) :-
	children(ActualChildren, 'Hans Koks'),
	assertion(length(ActualChildren, 2)),
	assertion(member('Karl Koks', ActualChildren)),
	assertion(member('Lucy Koks', ActualChildren)).

test(parents, [setup(load_dependencies)]) :-
	parents(ActualParents, 'Kurt Normalverbraucher'),
	assertion(length(ActualParents, 2)),
	assertion(member('Otto Normalverbraucher', ActualParents)),
	assertion(member('Sina Käse', ActualParents)).

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

%test(in_law, [setup(load_dependencies)]) :-
%	sister_in_law(ActualSisterInLaw, 'Hans Koks'),
%	ExpectedSisterInLaw = 'Karla Kolumna',
%	assertion(ExpectedSisterInLaw = ActualSisterInLaw).

:- end_tests(pedigree).
