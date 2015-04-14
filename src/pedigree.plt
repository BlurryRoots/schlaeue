
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

test(brother_in_law, [setup(load_dependencies)]) :-
	findall(
		BrotherInLaw,
		brother_in_law(BrotherInLaw, 'Hans Koks'),
		ActualBrothersInLaw
	),
	assertion(member('Kurt Normalverbraucher', ActualBrothersInLaw)).

test(sister_in_law, [setup(load_dependencies)]) :-
	findall(
		SisterInLaw,
		sister_in_law(SisterInLaw, 'Karla Kolumna'),
		ActualSistersInLaw
	),
	assertion(member('Lara Normalverbraucher', ActualSistersInLaw)).
	
test(cousin, [setup(load_dependencies)]) :-
	findall(
		Cousin,
		cousin(Cousin, 'Max Kolumna'),
		ActualCousins
	),
	assertion(member('Lucy Koks', ActualCousins)).
	
test(uncle, [setup(load_dependencies)]) :-
	findall(
		Uncle,
		uncle(Uncle, 'Kurt Normalverbraucher'),
		ActualUncles
	),
	assertion(member('Tom Käse', ActualUncles)).
	
test(aunt, [setup(load_dependencies)]) :-
	findall(
		Aunt,
		aunt(Aunt, 'Max Kolumna'),
		ActualAunts
	),
	assertion(member('Lara Normalverbraucher', ActualAunts)).
	
test(nephew, [setup(load_dependencies)]) :-
	findall(
		Nephew,
		nephew(Nephew, 'Bernd Normalverbraucher'),
		ActualNephews
	),
	assertion(member('Max Kolumna', ActualNephews)).
	
test(niece, [setup(load_dependencies)]) :-
	findall(
		Niece,
		niece(Niece, 'Bernd Normalverbraucher'),
		ActualNieces
	),
	assertion(member('Alesya Kolumna', ActualNieces)).
	
test(grand_uncle, [setup(load_dependencies)]) :-
	findall(
		GrandUncle,
		grand_uncle(GrandUncle, 'Karl Koks'),
		ActualGrandUncles
	),
	assertion(member('Tom Käse', ActualGrandUncles)).


test(grand_aunt, [setup(load_dependencies)]) :-
	findall(
		GrandAunt,
		grand_aunt(GrandAunt, 'Karl Koks'),
		ActualGrandAunts
	),
	assertion(member('Erna Käse', ActualGrandAunts)).

%test(in_law, [setup(load_dependencies)]) :-
%	sister_in_law(ActualSisterInLaw, 'Hans Koks'),
%	ExpectedSisterInLaw = 'Karla Kolumna',
%	assertion(ExpectedSisterInLaw = ActualSisterInLaw).

:- end_tests(pedigree).
