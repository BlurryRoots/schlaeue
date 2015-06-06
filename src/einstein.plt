:- use_module(library(plunit)).

:- begin_tests(einstein).

prepare :-
	consult('src/einstein').

test(solving, [setup(prepare), fail]) :-
	solve(_).

:- end_tests(einstein).
