% define a dcg for pedigree queries

get_response(Question, Answer) :-
	response(_Semantic, _Grammer, Answer, Question, _Unmatched).

ask_question(Question, Answer) :-
	question(_Semantic, _Grammar, Answer, Question, _Unmatched).

ask_question_with_respons(Question, Answer, Response) :-
	question(S, _G, Answer, Question, _),
	sentence(_, S, Response, _).

sentence([N, V, A, K, P, S2], Semantic) -->
	noun_phrase(SS1, noun_phrase(N), Attr),
	verb(V, _, Attr),
	noun_phrase(Key, noun_phrase(A, K), _),
	preposition(P, _, _),
	proper_noun(SS2, proper_noun(S2), _),
	{
		Semantic =.. [Key, SS1, SS2]
	}.
sentence([A, K, P, S2, V, N], Semantic) -->
	noun_phrase(Key, noun_phrase(A, K), _),
	preposition(P, _, _),
	proper_noun(SS2, proper_noun(S2), _),
	verb(V, _, Attr),
	noun_phrase(SS1, noun_phrase(N), Attr),
	{
		Semantic =.. [Key, SS1, SS2]
	}.

% descicion question (is tom the brother of erna?)
question([VP, NP, P], question(Verb, Noun, Prep), Semantic) -->
	verbal_phrase(VP, Verb, _),
	noun_phrase(NP, Noun, _),
	prepositional_phrase(P, Prep, _),
	[?],
	{
		Semantic =.. [NP, VP, P]
	}.

% completion questions (who is the brother of erna?)
question([I, V, NP, P], question(SI, SV, SNP, SP), Semantic) -->
	interrogative(I, SI, _),
	verb(V, SV, _),
	noun_phrase(NP, SNP, _),
	prepositional_phrase(P, SP, _),
	[?],
	{
		Semantic =.. [NP, Answer, P]
	}.

verbal_phrase(NP, verbal_phrase(Verb, Noun), Attributes) -->
	verb(_V, Verb, Attributes),
	noun_phrase(NP, Noun, _).

prepositional_phrase(N, p(Prep, Noun), Attributes) -->
	preposition(_P, Prep, _),
	noun_phrase(N, Noun, Attributes).

noun_phrase(N, noun_phrase(Article, Noun), Attributes) -->
	article(_A, Article, _),
	noun(N, Noun, Attributes).
noun_phrase(N, noun_phrase(Noun), Attributes) -->
	proper_noun(N, Noun, Attributes).
noun_phrase(N, noun_phrase(Article, Noun, Prep), Attributes) -->
	article(_A, Article, _),
	(noun(N, Noun, Attributes); proper_noun(N, Noun, Attributes)),
	prepositional_phrase(_P, Prep, _).

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
