
person('Lara Croft').
person('Lucy Lu').
person('Sina Rose').

person('Hans Gruber').
person('Karl Heinz').
person('Kurt Bach').
person('Otto Normalverbraucher').

father('Hans Gruber', 'Karl Heinz').
mother('Lara Croft', 'Karl Heinz').

father('Otto Normalverbraucher', 'Lara Croft').

child(Offspring, Parent) :-
	father(Parent, Offspring);
	mother(Parent, Offspring).

grand_child(Offspring, Grandparent) :-
	child(Offspring, Parent),
	child(Parent, Grandparent).

parents(Offspring, Parents) :-
	findall(Parent, child(Offspring, Parent), Parents).

grandparents(Offspring, Grandparents) :-
	findall(
		Grandparent,
		grand_child(Offspring, Grandparent),
		Grandparents
	).

write_list([]).
write_list([Head | Tail]) :-
	write(Head), nl,
	write_list(Tail).

main :-
	(parents('Karl Heinz', Parents)
	,write('Parents of Karl Heinz: ')
	,write(Parents)
	,nl),
	(grandparents('Karl Heinz', Grandparents)
	,write('Grandparents of Karl Heinz: ')
	,write(Grandparents)
	,nl)
	.
