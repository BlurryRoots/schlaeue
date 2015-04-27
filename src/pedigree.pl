% so start all over again!

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

brother(_Brother, _Person) :-
	false.

sister(_Sister, _Person) :-
	false.

children(_Children, _Person) :-
	false.

parents(_Parents, _Person) :-
	false.

grand_parents(_GrandParents, _Person) :-
	false.

grand_children(_GrandChildren, _Person) :-
	false.

brother_in_law(_BrotherInLaw, _Person) :-
	false.

sister_in_law(_SisterInLaw, _Person) :-
	false.

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

