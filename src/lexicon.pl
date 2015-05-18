
lexicon(who, who, pronoun, attributes(_, _, _)).

lexicon(am, are, verb, attributes(1, plural, present)).
lexicon(are, are, verb, attributes(2, plural, present)).
lexicon(is, are, verb, attributes(3, singular, present)).

lexicon(married, married, adjective, attributes(_, _, _)).

lexicon(Noun, Noun, proper_noun, attributes(3, singular, present)) :-
	female(Noun);
	male(Noun).
