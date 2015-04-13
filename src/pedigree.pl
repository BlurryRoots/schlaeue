
gender(Name, Gender) :-
	person(_ID, Name, Gender).

% relationship to descendent
%

parent_gender_helper(Parent, ParentGender, Child) :-
	person(ParentID, Parent, ParentGender),
	person(ChildID, Child, _ChildGender),
	parent(ParentID, ChildID).

% father and mother
mother(Parent, Child) :-
	parent_gender_helper(Parent, female, Child).
father(Parent, Child) :-
	parent_gender_helper(Parent, male, Child).

% is Offspring a child of Parent
child(Child, Parent) :-
	father(Parent, Child).
child(Child, Parent) :-
	mother(Parent, Child).

parents(Parents, Child) :-
	findall(Parent, child(Child, Parent), Parents).

children(Children, Parent) :-
	findall(Child, child(Child, Parent), Children).

descendent(Person, Ancestor) :-
	child(Person, Ancestor).
descendent(Person, Ancestor) :-
	child(Person, AnotherPerson), descendent(AnotherPerson, Ancestor).

ancestors(Ancestors, Person) :-
	findall(Ancestor, descendent(Person, Ancestor), Ancestors).

% is Offspring a grandchild of Parent
grand_child(Grandchild, Grandparent) :-
	person(GrandchildID, Grandchild, _GrandchildGender),
	person(GrandparentID, Grandparent, _GrandparentGender),
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

% relationship to siblings
%

sibling(Person, AnotherPerson) :-
	dif(Person, AnotherPerson),
	father(Father, Person), father(Father, AnotherPerson),
	mother(Mother, Person), mother(Mother, AnotherPerson).

siblings(Siblings, Person) :-
	findall(Sibling, sibling(Person, Sibling), Siblings).

sibling_gender_helper(Person, PersonGender, AnotherPerson) :-
	person(_PersonID, Person, PersonGender),
	person(_AnotherPersonID, AnotherPerson, _AnotherPersonGender),
	sibling(Person, AnotherPerson).

brother(Person, AnotherPerson) :-
	sibling_gender_helper(Person, male, AnotherPerson).

sister(Person, AnotherPerson) :-
	sibling_gender_helper(Person, female, AnotherPerson).

% relationship to siblings partners
%

in_law_gender_helper(Person, PersonGender, AnotherPerson) :-
	person(_PersonID, Person, PersonGender),
	person(AnotherPersonID, AnotherPerson, _AnotherPersonGender),
	person(SiblingID, Sibling, _SiblingGender),
	sibling(Person, Sibling), married(SiblingID, AnotherPersonID).

brother_in_law(Person, AnotherPerson) :-
	in_law_gender_helper(Person, male, AnotherPerson).

sister_in_law(Person, AnotherPerson) :-
	in_law_gender_helper(Person, female, AnotherPerson).

% relationship to siblings of parents
%

parent_sibling(Person, AnotherPerson) :-
	dif(Person, AnotherPerson),
	person(PersonID, Person, _PersonGender),
	person(AnotherPersonID, AnotherPerson, _AnotherPersonGender),
	person(ParentID, Parent, _ParentGender),
	person(AnotherParentID, AnotherParent, _AnotherParentGender),
	parent(ParentID, PersonID),
	parent(AnotherParentID, AnotherPersonID),
	sibling(Parent, AnotherParent).

parent_sibling_gender_helper(Person, PersonGender, AnotherPerson) :-
	person(_PersonID, Person, PersonGender),
	person(_AnotherPersonID, AnotherPerson, _AnotherPersonGender),
	parent_sibling(Person, AnotherPerson).

nephew(Person, AnotherPerson) :-
	parent_sibling_gender_helper(Person, male, AnotherPerson).

niece(Person, AnotherPerson) :-
	parent_sibling_gender_helper(Person, female, AnotherPerson).

cousin_gender_helper(Person, PersonGender, Cousin) :-
	gender(Person, PersonGender),
	parent_sibling(Person, ParentSibling),
	child(Cousin, ParentSibling).

cousin(Person, Cousin) :-
	cousin_gender_helper(Person, _PersonGender, Cousin).
