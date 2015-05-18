% main file, when run main/0 is being executed

load_knowledge_base :-
	consult('src/db'),
	consult('src/pedigree'),
	consult('src/grammer'),
	consult('src/lexicon').

run_queries :-
	question(Parts, Grammer, Answer, [who, is, brother, lara], Unmatched),
	write(Parts), nl,
	write(Grammer), nl,
	write(Answer), nl,
	write(Unmatched), nl.

main :-
	load_knowledge_base, run_queries.
