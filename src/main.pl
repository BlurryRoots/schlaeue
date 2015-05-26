% main file, when run main/0 is being executed

load_knowledge_base :-
	consult('src/db'),
	consult('src/pedigree'),
	consult('src/grammar'),
	consult('src/lexicon').

run_queries :-
	Question1 = [who, is, the, brother, of, erna, ?],
	ask_question(Question1, Answer1),
	write(Question1), write(' -> '), write(Answer1),
	nl,
	Question2 = [is, tom, the, brother, of, erna, ?],
	ask_question(Question2, Answer2),
	write(Question2), write(' -> '), write(Answer2),
	nl,
	Question3 = [is, tom, the, brother, of, erna, ?],
	ask_question_with_respons(Question3, Answer3, Response1),
	write(Question3), write(' -> '), write(Answer3), nl,
	write('Response: '), write(Response1),
	nl.

main :-
	load_knowledge_base, run_queries.
