% define a dcg for pedigree queries

ask_question(Question, Answer) :-
	question(_Semantic, _Grammer, Answer, Question, _Unmatched).

% descicion question (is tom the brother of erna?)
question([VP, NP, P], question(Verb, Noun, Prep), Answer) -->
	verbal_phrase(VP, Verb, _),
	noun_phrase(NP, Noun, _),
	prepositional_phrase(P, Prep, _),
	[?],
	{
		(
		Predicate =.. [NP, VP, P], Predicate, Answer = true;
		Answer = false
		), !
	}.

% completion questions (who is the brother of erna?)
question([I, V, NP, P], question(SNP), Answer) -->
	interrogative(I, SI, _),
	verb(V, SV, _),
	noun_phrase(NP, SNP, _),
	prepositional_phrase(P, SP, _),
	[?],
	{
		Predicate =.. [NP, Answer, P],
		Predicate
	}.

verbal_phrase(NP, verbal_phrase(Verb, Noun), Attributes) -->
	verb(V, Verb, Attributes),
	noun_phrase(NP, Noun, _).

prepositional_phrase(N, noun_phrase(Prep, Noun), Attributes) -->
	preposition(P, Prep, _),
	noun_phrase(N, Noun, Attributes).

noun_phrase(N, noun_phrase(Article, Noun), Attributes) -->
	article(A, Article, _),
	noun(N, Noun, Attributes).
noun_phrase(N, noun_phrase(Noun), Attributes) -->
	proper_noun(N, Noun, Attributes).
noun_phrase(N, noun_phrase(Article, Noun, Prep), Attributes) -->
	article(A, Article, _),
	(noun(N, Noun, Attributes); proper_noun(N, Noun, Attributes)),
	prepositional_phrase(P, Prep, _).

interrogative(Value, interrogative(Value), Attributes) --> [X], {
	lexicon(X, Value, interrogative, Attributes)
}.

proper_noun(Noun, proper_noun(Noun), Attributes) --> [X], {
	lexicon(X, Noun, proper_noun, Attributes)
}.
noun(Value, noun(Value), Attributes) --> [X], {
	lexicon(X, Value, noun, Attributes)
}.

preposition(Value, preposition(Value), Attributes) --> [X], {
	lexicon(X, Value, preposition, Attributes)
}.

article(Value, preposition(Value), Attributes) --> [X], {
	lexicon(X, Value, article, Attributes)
}.

adjective(Value, adjective(Value), Attributes) --> [X], {
	lexicon(X, Value, adjective, Attributes)
}.

verb(Value, verb(Value), Attributes) --> [X], {
	lexicon(X, Value, verb, Attributes)
}.
