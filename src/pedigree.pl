
gender_helper(Name, Gender) :-
	person(_ID, Name, Gender).

marriage_partner(Partner, AnotherPartner) :-
	person(PartnerID, Partner, _PartnerGender),
	person(AnotherPartnerID, AnotherPartner, _AnotherPartnerGender),
	married(PartnerID, AnotherPartnerID).
marriage_partner(Partner, AnotherPartner) :-
	person(PartnerID, Partner, _PartnerGender),
	person(AnotherPartnerID, AnotherPartner, _AnotherPartnerGender),
	married(AnotherPartnerID, PartnerID).

% relationship to descendent
%

parent_gender_helper(Parent, ParentGender, Child, ChildGender) :-
	person(ParentID, Parent, ParentGender),
	person(ChildID, Child, ChildGender),
	parent(ParentID, ChildID).

% father and mother
mother(Parent, Child) :-
	parent_gender_helper(Parent, female, Child, _ChildGender).
father(Parent, Child) :-
	parent_gender_helper(Parent, male, Child, _ChildGender).

% is Offspring a child of Parent
child(Child, Parent) :-
	parent_gender_helper(Parent, _ParentGender, Child, _ChildGender).

son(Son, Parent) :-
	parent_gender_helper(Parent, _ParentGender, Son, male).

daughter(Daughter, Parent) :-
	parent_gender_helper(Parent, _ParentGender, Daughter, female).

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
grand_child_raw_helper(GrandchildID, GrandparentID) :-
	parent(ParentID, GrandchildID),
	parent(GrandparentID, ParentID).

grand_child_gender_helper(
	Grandchild, GrandchildGender,
	Grandparent, GrandparentGender
) :-
	person(GrandchildID, Grandchild, GrandchildGender),
	person(GrandparentID, Grandparent, GrandparentGender),
	grand_child_raw_helper(GrandchildID, GrandparentID).

grand_child(Grandchild, Grandparent) :-
	grand_child_gender_helper(
		Grandchild, _GrandchildGender,
		Grandparent, _GrandparentGender
	).

grand_father(Grandfather, Person) :-
	grand_child_gender_helper(
		Person, _GrandchildGender,
		Grandfather, male
	).

grand_mother(Grandmother, Person) :-
	grand_child_gender_helper(
		Person, _GrandchildGender,
		Grandmother, female
	).

grand_son(Grandson, Person) :-
	grand_child_gender_helper(
		Grandson, male,
		Person, _GrandparentGender
	).

grand_daughter(GrandDaughter, Person) :-
	grand_child_gender_helper(
		GrandDaughter, female,
		Person, _GrandparentGender
	).

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
	gender_helper(Person, PersonGender),
	sibling(Person, AnotherPerson).

brother(Person, AnotherPerson) :-
	sibling_gender_helper(Person, male, AnotherPerson).

sister(Person, AnotherPerson) :-
	sibling_gender_helper(Person, female, AnotherPerson).

% relationship to siblings partners
%

in_law(InLaw, Person) :-
	marriage_partner(InLaw, InLawPartner),
	sibling(InLawPartner, Person).
in_law(InLaw, Person) :-
	marriage_partner(Person, PersonPartner),
	sibling(InLaw, PersonPartner).

in_law_gender_helper(InLaw, InLawGender, Person) :-
	gender_helper(InLaw, InLawGender),
	in_law(InLaw, Person).

brother_in_law(BrotherInLaw, Person) :-
	in_law_gender_helper(BrotherInLaw, male, Person).

sister_in_law(SisterInLaw, Person) :-
	in_law_gender_helper(SisterInLaw, female, Person).

in_law_sibling(InLawSibling, Person) :-
	marriage_partner(Person, PersonPartner),
	marriage_partner(InLawSibling, InLawSiblingPartner),
	sibling(PersonParent, InLawSiblingPartner).

% relationship to siblings of parents
%

cousin(Cousin, Person) :-
	child(Cousin, CousinParent),
	child(Person, PersonParent),
	sibling(CousinParent, PersonParent).

parent_sibling_gender_helper(
	ParentSibling, ParentSiblingGender,
	Person, PersonGender
) :-
	gender_helper(ParentSibling, ParentSiblingGender),
	gender_helper(Person, PersonGender),
	child(Person, PersonParent),
	sibling(ParentSibling, PersonParent).

uncle(Uncle, Person) :-
	parent_sibling_gender_helper(Uncle, male, Person, _PersonGender).

aunt(Aunt, Person) :-
	parent_sibling_gender_helper(Aunt, female, Person, _PersonGender).

nephew(Nephew, Person) :-
	parent_sibling_gender_helper(Person, _PersonGender, Nephew, male).

niece(Niece, Person) :-
	parent_sibling_gender_helper(Person, _PersonGender, Niece, female).

grand_uncle(Granduncle, Person) :-
	child(Person, Parent),
	uncle(Granduncle, Parent).

grand_aunt(Grandaunt, Person) :-
	child(Person, Parent),
	aunt(Grandaunt, Parent).
