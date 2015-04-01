
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

offspring(Offspring, Parent) :-
	father(Parent, Offspring);
	mother(Parent, Offspring).

parents(Offspring, Parents) :-
	findall(Parent, offspring(Offspring, Parent), Parents).

grandparents(Offspring, Grandparents) :-
	findall(
		Grandparent,
		(offspring(Offspring, Parent),
		 offspring(Parent, Grandparent)),
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
