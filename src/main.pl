% main file, when run main/0 is being executed

load_knowledge_base :-
	consult('src/db'),
	consult('src/pedigree'),
	consult('src/grammer'),
	consult('src/lexicon').

run_queries :-
	%findall([Str, Att, Value, X], proper_noun(S, A, B, C), Results),
	proper_noun(S, _, [karina], X),
	Results = [S, X],
	write(Results), nl.

main :-
	load_knowledge_base, run_queries.
