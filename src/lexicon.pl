
lexicon(who, who, interrogative, attributes(_, _, _)).

lexicon(am, are, verb, attributes(1, plural, present)).
lexicon(are, are, verb, attributes(2, plural, present)).
lexicon(is, are, verb, attributes(3, singular, present)).

lexicon(the, the, article, attributes(_, _, _)).

lexicon(of, of, preposition, attributes(_, _, _)).

lexicon(married, married, noun, attributes(3, singular, present)).
lexicon(parent, parent, noun, attributes(3, singular, present)).
lexicon(parents, parents, noun, attributes(2, plural, present)).
lexicon(father, father, noun, attributes(3, singular, present)).
lexicon(mother, mother, noun, attributes(3, singular, present)).
lexicon(sibling, sibling, noun, attributes(3, singular, present)).
lexicon(siblings, siblings, noun, attributes(2, plural, present)).
lexicon(brother, brother, noun, attributes(3, singular, present)).
lexicon(sister, sister, noun, attributes(3, singular, present)).
lexicon(child, child, noun, attributes(3, singular, present)).
lexicon(grand_parent, grand_parent, noun, attributes(3, singular, present)).
lexicon(grand_mother, grand_mother, noun, attributes(3, singular, present)).
lexicon(grand_father, grand_father, noun, attributes(3, singular, present)).
lexicon(in_law, in_law, noun, attributes(3, singular, present)).
lexicon(cousin, cousin, noun, attributes(3, singular, present)).
lexicon(nephew, nephew, noun, attributes(3, singular, present)).
lexicon(niece, niece, noun, attributes(3, singular, present)).
lexicon(aunt, aunt, noun, attributes(3, singular, present)).
lexicon(uncle, uncle, noun, attributes(3, singular, present)).
lexicon(grand_uncle, grand_uncle, noun, attributes(3, singular, present)).
lexicon(grand_aunt, grand_aunt, noun, attributes(3, singular, present)).

lexicon(Noun, Noun, proper_noun, attributes(3, singular, present)) :-
	female(Noun);
	male(Noun).
