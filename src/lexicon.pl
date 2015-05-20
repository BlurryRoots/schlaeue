
lexicon(who, who, interrogative, attributes(_, _, _)).

lexicon(am, are, verb, attributes(1, plural, present)).
lexicon(are, are, verb, attributes(2, plural, present)).
lexicon(is, are, verb, attributes(3, singular, present)).

lexicon(the, the, article, attributes(_, _, _)).

lexicon(of, of, preposition, attributes(_, _, _)).

lexicon(married, married, noun, attributes(_, _, _)).
lexicon(parent, parent, noun, attributes(_, _, _)).
lexicon(father, father, noun, attributes(_, _, _)).
lexicon(sibling, sibling, noun, attributes(_, _, _)).
lexicon(brother, brother, noun, attributes(_, _, _)).
lexicon(sister, sister, noun, attributes(_, _, _)).
lexicon(child, child, noun, attributes(_, _, _)).
lexicon(grand_parent, grand_parent, noun, attributes(_, _, _)).
lexicon(grand_mother, grand_mother, noun, attributes(_, _, _)).
lexicon(grand_father, grand_father, noun, attributes(_, _, _)).
lexicon(in_law, in_law, noun, attributes(_, _, _)).
lexicon(cousin, cousin, noun, attributes(_, _, _)).
lexicon(nephew, nephew, noun, attributes(_, _, _)).
lexicon(niece, niece, noun, attributes(_, _, _)).
lexicon(aunt, aunt, noun, attributes(_, _, _)).
lexicon(uncle, uncle, noun, attributes(_, _, _)).

lexicon(Noun, Noun, proper_noun, attributes(3, singular, present)) :-
	female(Noun);
	male(Noun).
