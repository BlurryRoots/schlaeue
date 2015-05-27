:- use_module(library(plunit)).

:- begin_tests(lab_addition).

load_dependencies :-
	consult('src/db'),
	consult('src/pedigree'),
	consult('src/grammar'),
	consult('src/lexicon').

test(ask_question_and_receive_response, [setup(load_dependencies), nondet]) :-
	false.

:- end_tests(lab_addition).
