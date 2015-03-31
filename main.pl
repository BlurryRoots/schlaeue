
person('Lara Croft').
person('Lucy Lu').
person('Sina Rose').

person('Hans Gruber').
person('Karl Heinz').
person('Kurt Bach').

father('Hans Gruber', 'Karl Heinz').
mother('Lara Croft', 'Karl Heinz').

offspring(Offspring, Parent) :-
	father(Parent, Offspring);
	mother(Parent, Offspring).

parents(Offspring, Parents) :-
	findall(Parent, offspring(Offspring, Parent), Parents).

main :-
	write('Hey there!'),
	nl,
	(parents('Karl Heinz', Parents),
	 write(Parents),
	 nl)
	.
