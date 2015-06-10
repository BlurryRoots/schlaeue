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
	nl.

lab_extension :-
	question(_, _, Predicate, [who,is,the,brother,of,erna,?], _),
	Predicate,
	sentence(_, Predicate, Sentence, _),
	write('Predicate is '), write(Predicate), nl,
	write('Sentence is '), write(Sentence), nl.

main :-
	load_knowledge_base, run_queries, lab_extension.
