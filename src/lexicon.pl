
lexicon(who, who, pronoun, attributes(_, _, _)).

lexicon(am, are, verb, attributes(1, plural, present)).
lexicon(are, are, verb, attributes(2, plural, present)).
lexicon(is, are, verb, attributes(3, singular, present)).

lexicon(married, married, adjective, attributes(_, _, _)).
lexicon(brother, brother, adjective, attributes(_, _, _)).
lexicon(sibling, sibling, adjective, attributes(_, _, _)).
lexicon(sister, sister, adjective, attributes(_, _, _)).
lexicon(aunt, aunt, adjective, attributes(_, _, _)).
lexicon(uncle, uncle, adjective, attributes(_, _, _)).

lexicon(Noun, Noun, proper_noun, attributes(3, singular, present)) :-
	female(Noun);
	male(Noun).
