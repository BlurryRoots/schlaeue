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
		[_Verb, [Subject]] = VP,
		[_Arti, Key] = NP,
		[_Prep, [OtherSubject]] = P,
		Predicate =.. [Key, Subject, OtherSubject],
		Predicate, Answer = true
		), !;
		Answer = false
	}.

% completion questions (who is the brother of erna?)
question([SP, VP], question(SP, VP), Answer) -->
	interrogative(SP, _P, _),
	verbal_phrase(VP, _S, _Attributes),
	[?],
	{
		[_Verb, Subjects] = VP,
		[_Art, Key, [_Prep, [Subject]]] = Subjects,
		Predicate =.. [Key, Answer, Subject],
		Predicate
	}.

verbal_phrase([V, NP], verbal_phrase(Verb, Noun), Attributes) -->
	verb(V, Verb, Attributes),
	noun_phrase(NP, Noun, _).

prepositional_phrase([P, N], noun_phrase(Prep, Noun), Attributes) -->
	preposition(P, Prep, _),
	noun_phrase(N, Noun, Attributes).

noun_phrase([A, N], noun_phrase(Article, Noun), Attributes) -->
	article(A, Article, _),
	noun(N, Noun, Attributes).
noun_phrase([P], noun_phrase(Noun), Attributes) -->
	proper_noun(P, Noun, Attributes).
noun_phrase([A, N, P], noun_phrase(Article, Noun, Prep), Attributes) -->
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
