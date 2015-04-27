% so start all over again!

couple(Person, AnotherPerson) :-
	married(Person, AnotherPerson);
	married(AnotherPerson, Person).

mother(Mother, Person) :-
	female(Mother), parent(Mother, Person).

father(Father, Person) :-
	male(Father), parent(Father, Person).

sibling(Sibling, Person) :-
	dif(Sibling, Person),
	mother(Mother, Sibling), father(Father, Sibling),
	mother(Mother, Person), father(Father, Person).

siblings(Siblings, Person) :-
	findall(Sibling, sibling(Sibling, Person), Siblings).

brother(Brother, Person) :-
	male(Brother), sibling(Brother, Person).

sister(Sister, Person) :-
	female(Sister), sibling(Sister, Person).

child(Child, Person) :-
	parent(Person, Child).

children(Children, Person) :-
	findall(Child, child(Child, Person), Children).

parents(Parents, Person) :-
	findall(Parent, parent(Parent, Person), Parents).

grand_parent(GrandParent, Person) :-
	parent(GrandParent, Parent), parent(Parent, Person).
grand_mother(GrandMother, Person) :-
	female(GrandMother), grand_parent(GrandMother, Person).
grand_father(GrandFather, Person) :-
	male(GrandFather), grand_parent(GrandFather, Person).

grand_parents(GrandParents, Person) :-
	findall(GrandParent, grand_parent(GrandParent, Person), GrandParents).

grand_children(GrandChildren, Person) :-
	findall(GrandChild, grand_parent(Person, GrandChild), GrandChildren).

in_law(InLaw, Person) :-
	sibling(InLaw, InLawSibling), couple(InLawSibling, Person).

brother_in_law(BrotherInLaw, Person) :-
	male(BrotherInLaw), in_law(BrotherInLaw, Person).

sister_in_law(SisterInLaw, Person) :-
	female(SisterInLaw), in_law(SisterInLaw, Person).

cousin(_Cousin, _Person) :-
	false.

uncle(_Uncle, _Person) :-
	false.

aunt(_Aunt, _Person) :-
	false.

nephew(_Nephew, _Person) :-
	false.

niece(_Niece, _Person) :-
	false.

grand_uncle(_Granduncle, _Person) :-
	false.

grand_aunt(_Grandaunt, _Person) :-
	false.

in_law_sibling(_InLawSibling, _Person) :-
	false.

