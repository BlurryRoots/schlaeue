% main file, when run main/0 is being executed

load_knowledge_base :-
	consult('src/db'), consult('src/pedigree').

run_queries :-
	write('hey there!').

main :-
	load_knowledge_base, run_queries.
