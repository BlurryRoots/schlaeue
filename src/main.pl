% main file, when run main/0 is being executed

load_knowledge_base :-
	consult('src/db'),
	consult('src/pedigree'),
	consult('src/grammer'),
	consult('src/lexicon').

run_queries :-
	Question = [who, is, brother, erna],
	ask_question(Question, Answer),
	write(Question), write(' -> '), write(Answer).

main :-
	load_knowledge_base, run_queries.
