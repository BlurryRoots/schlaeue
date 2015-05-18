% define a dcg for pedigree queries

ask_question(Question, Answer) :-
	question(_Semantic, _Grammer, Answer, Question, _Unmatched).

question([SP, VP], question(SP, VP), Answer) -->
	pronoun(SP, _P, _),
	verbal_phrase(VP, _S, _Attributes),
	{
		[_Verb, Adjective, Subject] = VP,
		Predicate =.. [Adjective, Answer, Subject],
		Predicate
	}.

%adjectival_phrase([])
verbal_phrase([V, A, NP], verbal_phrase(Verb, Adjective, Noun), Attributes) -->
	verb(V, Verb, Attributes),
	adjective(A, Adjective, _),
	noun_phrase(NP, Noun, _).
verbal_phrase([V, NP], verbal_phrase(Verb, Noun), Attributes) -->
	verb(V, Verb, Attributes),
	noun_phrase(NP, Noun, _).
verbal_phrase([X, _], verbal_phrase(Verb), Attributes) -->
	verb(X, Verb, Attributes).

noun_phrase(S, noun_phrase(Noun), Attributes) -->
	proper_noun(S, Noun, Attributes).

proper_noun(Noun, proper_noun(Noun), Attributes) --> [X], {
	lexicon(X, Noun, proper_noun, Attributes)
}.

pronoun(Pronoun, pornoun(Pronoun), Attributes) --> [X], {
	lexicon(X, Pronoun, pronoun, Attributes)
}.

adjective(Adjective, adjective(Adjective), Attributes) --> [X], {
	lexicon(X, Adjective, adjective, Attributes)
}.

verb(Verb, verb(Verb), Attributes) --> [X], {
	lexicon(X, Verb, verb, Attributes)
}.
