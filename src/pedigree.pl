
% is Offspring a child of Parent
child(Child, Parent) :-
	father(Parent, Child).
child(Child, Parent) :-
	mother(Parent, Child).

parent(Parent, Child) :-
	mother(Parent, Child).
parent(Parent, Child) :-
	father(Parent, Child).

parents(Parents, Child) :-
	findall(Parent, child(Child, Parent), Parents).

% is Offspring a grandchild of Parent
grand_child(Grandchild, Grandparent) :-
	parent(Parent, Grandchild),
	parent(Grandparent, Parent).

grand_parents(Grandparents, Grandchild) :-
	findall(
		Grandparent,
		grand_child(Grandchild, Grandparent),
		Grandparents
	).

descendent(Person, Ancestor) :-
	child(Person, Ancestor).
descendent(Person, Ancestor) :-
	child(Person, AnotherPerson), descendent(AnotherPerson, Ancestor).

ancestors(Ancestors, Person) :-
	findall(Ancestor, descendent(Person, Ancestor), Ancestors).

sibling(Person, AnotherPerson) :-
	dif(Person, AnotherPerson),
	father(Father, Person), father(Father, AnotherPerson),
	mother(Mother, Person), mother(Mother, AnotherPerson).

siblings(Siblings, Person) :-
	findall(Sibling, sibling(Person, Sibling), Siblings).

brother(Person, AnotherPerson) :-
	male(Person), sibling(Person, AnotherPerson).

sister(Person, AnotherPerson) :-
	female(Person), sibling(Person, AnotherPerson).

parent_sibling(Person, AnotherPerson) :-
	parent(Parent, Person),
	parent(AnotherParent, AnotherPerson),
	sibling(Parent, AnotherParent).

niece(Person, AnotherPerson) :-
	female(Person),
	dif(Person, AnotherPerson),
	parent_sibling(Person, AnotherPerson).

nephew(Person, AnotherPerson) :-
	male(Person),
	dif(Person, AnotherPerson),
	parent_sibling(Person, AnotherPerson).
