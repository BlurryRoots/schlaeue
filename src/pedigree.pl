
:- module(pedigree, [
	child/2,
	grand_child/2,
	parents/2,
	grand_parents/2,
	descendent/2,
	ancestors/2,
	sibling/2,
	siblings/2,
	parent_sibling/2
]).

% is Offspring a child of Parent
child(Offspring, Parent) :-
	father(Parent, Offspring).
child(Offspring, Parent) :-
	mother(Parent, Offspring).

% is Offspring a grandchild of Parent
grand_child(Offspring, Grandparent) :-
	child(Offspring, Parent),
	child(Parent, Grandparent).

parents(Offspring, Parents) :-
	findall(Parent, child(Offspring, Parent), Parents).

grand_parents(Offspring, Grandparents) :-
	findall(
		Grandparent,
		grand_child(Offspring, Grandparent),
		Grandparents
	).

descendent(Person, Ancestor) :-
	child(Person, Ancestor).
descendent(Person, Ancestor) :-
	child(Person, AnotherPerson), descendent(AnotherPerson, Ancestor).

ancestors(Person, Ancestors) :-
	findall(Ancestor, descendent(Person, Ancestor), Ancestors).

sibling(Person, AnotherPerson) :-
	dif(Person, AnotherPerson),
	father(Father, Person), father(Father, AnotherPerson),
	mother(Mother, Person), mother(Mother, AnotherPerson).

siblings(Person, Siblings) :-
	findall(Sibling, sibling(Person, Sibling), Siblings).

parent_sibling(Person, ParentSibling) :-
	dif(Person, ParentSibling),
	child(Person, Parent),
	sibling(Parent, ParentSibling).
