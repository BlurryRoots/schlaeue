
:- use_module(library(plunit)).

:- begin_tests(pedigree).

load_dependencies :-
	consult('src/db.pl'),
	consult('src/pedigree.pl'),
	consult('src/grammar'),
	consult('src/lexicon').

test(siblings, [setup(load_dependencies)]) :-
	siblings(ActualSiblings, kurt),
	assertion(length(ActualSiblings, 2)),
	assertion(member(lara, ActualSiblings)),
	assertion(member(bernd, ActualSiblings)).

test(brothers, [setup(load_dependencies)]) :-
	findall(
		Brother,
		brother(Brother, lara),
		ActualBrothers
	),
	assertion(length(ActualBrothers, 2)),
	assertion(member(kurt, ActualBrothers)),
	assertion(member(bernd, ActualBrothers)).

test(sisters, [setup(load_dependencies)]) :-
	findall(
		Sister,
		sister(Sister, bernd),
		ActualSisters
	),
	assertion(length(ActualSisters, 1)),
	assertion(member(lara, ActualSisters)).

test(children, [setup(load_dependencies), nondet]) :-
	children(ActualChildren, hans),
	assertion(length(ActualChildren, 2)),
	assertion(member(karl, ActualChildren)),
	assertion(member(lucy, ActualChildren)).

test(parents, [setup(load_dependencies)]) :-
	parents(ActualParents, kurt),
	assertion(length(ActualParents, 2)),
	assertion(member(otto, ActualParents)),
	assertion(member(sina, ActualParents)).

test(grand_parents, [setup(load_dependencies)]) :-
	grand_parents(ActualGrandParents, karl),
	ExpectedMotherFather = otto,
	ExpectedMotherMother = sina,
	ExpectedFatherFather = frank,
	ExpectedFatherMother = karolina,
	assertion(length(ActualGrandParents, 4)),
	assertion(member(ExpectedMotherFather, ActualGrandParents)),
	assertion(member(ExpectedMotherMother, ActualGrandParents)),
	assertion(member(ExpectedFatherFather, ActualGrandParents)),
	assertion(member(ExpectedFatherMother, ActualGrandParents)).

test(grand_child, [setup(load_dependencies)]) :-
	grand_children(ActualGrandchildren, sina),
	assertion(length(ActualGrandchildren, 4)),
	assertion(member(max, ActualGrandchildren)),
	assertion(member(alesya, ActualGrandchildren)),
	assertion(member(karl, ActualGrandchildren)),
	assertion(member(lucy, ActualGrandchildren)).

test(brother_in_law, [setup(load_dependencies)]) :-
	findall(
		BrotherInLaw,
		brother_in_law(BrotherInLaw, hans),
		ActualBrothersInLaw
	),
	assertion(member(kurt, ActualBrothersInLaw)).

test(sister_in_law, [setup(load_dependencies)]) :-
	findall(
		SisterInLaw,
		sister_in_law(SisterInLaw, karla),
		ActualSistersInLaw
	),
	assertion(member(lara, ActualSistersInLaw)).

test(cousin, [setup(load_dependencies)]) :-
	findall(
		Cousin,
		cousin(Cousin, max),
		ActualCousins
	),
	assertion(member(lucy, ActualCousins)).

test(uncle, [setup(load_dependencies)]) :-
	findall(
		Uncle,
		uncle(Uncle, kurt),
		ActualUncles
	),
	assertion(member(tom, ActualUncles)).

test(aunt, [setup(load_dependencies)]) :-
	findall(
		Aunt,
		aunt(Aunt, max),
		ActualAunts
	),
	assertion(member(lara, ActualAunts)).

test(nephew, [setup(load_dependencies)]) :-
	findall(
		Nephew,
		nephew(Nephew, bernd),
		ActualNephews
	),
	assertion(member(max, ActualNephews)).

test(niece, [setup(load_dependencies)]) :-
	findall(
		Niece,
		niece(Niece, bernd),
		ActualNieces
	),
	assertion(member(alesya, ActualNieces)).

test(grand_uncle, [setup(load_dependencies)]) :-
	findall(
		GrandUncle,
		grand_uncle(GrandUncle, karl),
		ActualGrandUncles
	),
	assertion(member(tom, ActualGrandUncles)).

test(grand_aunt, [setup(load_dependencies)]) :-
	findall(
		GrandAunt,
		grand_aunt(GrandAunt, karl),
		ActualGrandAunts
	),
	assertion(member(erna, ActualGrandAunts)).

test(in_law_siblings, [setup(load_dependencies)]) :-
	findall(
		InLawSibling,
		in_law_sibling(InLawSibling, karla),
		ActualInLawSiblings
	),
	assertion(member(hans, ActualInLawSiblings)).

test(who_question_brother, [setup(load_dependencies)]) :-
	Question = [who, is, the, brother, of, erna, ?],
	findall(
		Answer,
		ask_question(Question, Answer),
		ActualAnswers
	),
	assertion(length(ActualAnswers, 1)),
	assertion(member(tom, ActualAnswers)).

test(who_question_sister, [setup(load_dependencies)]) :-
	Question = [who, is, the, sister, of, kurt, ?],
	findall(
		Answer,
		ask_question(Question, Answer),
		ActualAnswers
	),
	assertion(length(ActualAnswers, 1)),
	assertion(member(lara, ActualAnswers)).

test(who_question_uncle, [setup(load_dependencies)]) :-
	Question = [who, is, the, uncle, of, max, ?],
	findall(
		Answer,
		ask_question(Question, Answer),
		ActualAnswers
	),
	assertion(length(ActualAnswers, 1)),
	assertion(member(bernd, ActualAnswers)).

test(who_question_father, [setup(load_dependencies)]) :-
	Question = [who, is, the, father, of, kurt, ?],
	findall(
		Answer,
		ask_question(Question, Answer),
		ActualAnswers
	),
	assertion(length(ActualAnswers, 1)),
	assertion(member(otto, ActualAnswers)).

test(who_question_mother, [setup(load_dependencies)]) :-
	Question = [who, is, the, mother, of, kurt, ?],
	findall(
		Answer,
		ask_question(Question, Answer),
		ActualAnswers
	),
	assertion(length(ActualAnswers, 1)),
	assertion(member(sina, ActualAnswers)).

test(is_question_brother, [setup(load_dependencies)]) :-
	Question = [is, tom, the, brother, of, erna, ?],
	ask_question(Question, Answer),
	assertion(Answer = true).

test(is_question_uncle, [setup(load_dependencies)]) :-
	Question = [is, bernd, the, uncle, of, max, ?],
	ask_question(Question, Answer),
	assertion(Answer = true).

:- end_tests(pedigree).
