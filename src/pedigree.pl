
% father and mother
mother(Parent, Child) :-
	person(ParentID, Parent),
	person(ChildID, Child),
	female(ParentID), parent(ParentID, ChildID).
father(Parent, Child) :-
	person(ParentID, Parent),
	person(ChildID, Child),
	male(ParentID), parent(ParentID, ChildID).

% is Offspring a child of Parent
child(Child, Parent) :-
	father(Parent, Child).
child(Child, Parent) :-
	mother(Parent, Child).

parents(Parents, Child) :-
	findall(Parent, child(Child, Parent), Parents).

children(Children, Parent) :-
	findall(Child, child(Child, Parent), Children).

% is Offspring a grandchild of Parent
grand_child(Grandchild, Grandparent) :-
	person(GrandchildID, Grandchild),
	person(GrandparentID, Grandparent),
	parent(ParentID, GrandchildID),
	parent(GrandparentID, ParentID).

grand_parents(Grandparents, Grandchild) :-
	findall(
		Grandparent,
		grand_child(Grandchild, Grandparent),
		Grandparents
	).

grand_children(Grandchildren, Grandparent) :-
	findall(
		Grandchild,
		grand_child(Grandchild, Grandparent),
		Grandchildren
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
	person(PersonID, Person),
	person(AnotherPersonID, AnotherPerson),
	parent(ParentID, PersonID),
	parent(AnotherParentID, AnotherPersonID),
	sibling(ParentID, AnotherParentID).

niece(Person, AnotherPerson) :-
	female(Person),
	dif(Person, AnotherPerson),
	parent_sibling(Person, AnotherPerson).

nephew(Person, AnotherPerson) :-
	male(Person),
	dif(Person, AnotherPerson),
	parent_sibling(Person, AnotherPerson).
