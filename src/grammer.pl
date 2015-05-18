% define a dcg for pedigree queries

proper_noun(proper_noun(Noun), Attributes) --> [Noun], {
	lexicon(Noun, Noun, proper_noun, Attributes)
}.
