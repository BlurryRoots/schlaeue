:- use_module(library(plunit)).

:- begin_tests(lab_addition).

load_dependencies :-
	consult('src/db'),
	consult('src/pedigree'),
	consult('src/grammar'),
	consult('src/lexicon').

test(ask_question_and_receive_response, [setup(load_dependencies)]) :-
	% ask a question
	Question = [who, is, the, sister, of, tom, ?],
	question(_, _, Semantic, Question, _),
	% proof the semantic response (e.g. sister(X, tom))
	Semantic,
	% create a response
	sentence(_, Semantic, Response, _),
	length(Response, L), L > 0.

:- end_tests(lab_addition).
