% peanuts as pedigree?

% import module with predicates to query db
%:- use_module(pedigree).

load_knowledge_base :-
	consult('src/db'), consult('src/pedigree').

run_queries :-
	(parents('Karl Heinz', Parents)
	,write('Parents of Karl Heinz: '), nl
	,tab(4), write(Parents)
	,nl),
	(grand_parents('Karl Heinz', Grandparents)
	,write('Grandparents of Karl Heinz: '), nl
	,tab(4), write(Grandparents)
	,nl),
	(ancestors('Karl Heinz', Ancestors)
	,write('Ancestors of Karl Heinz: '), nl
	,tab(4), write(Ancestors)
	,nl),
	(siblings('Karl Heinz', Siblings)
	,write('Siblings of Karl Heinz: '), nl
	,tab(4), write(Siblings)
	,nl),
	(parent_sibling('Karl Heinz', ParentSiblings)
	,write('ParentSiblings of Karl Heinz'), nl
	,tab(4), write(ParentSiblings)
	,nl)
	.

main :-
	load_knowledge_base, run_queries.
