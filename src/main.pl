% peanuts as pedigree?

% import module with predicates to query db
%:- use_module(pedigree).

load_knowledge_base :-
	consult('src/db'), consult('src/pedigree').

run_queries :-
	(parents(Parents, 'Karl Heinz')
	,write('Parents of Karl Heinz: '), nl
	,tab(4), write(Parents)
	,nl),
	(grand_parents(Grandparents, 'Karl Heinz')
	,write('Grandparents of Karl Heinz: '), nl
	,tab(4), write(Grandparents)
	,nl),
	(ancestors(Ancestors, 'Karl Heinz')
	,write('Ancestors of Karl Heinz: '), nl
	,tab(4), write(Ancestors)
	,nl),
	(siblings(Siblings, 'Karl Heinz')
	,write('Siblings of Karl Heinz: '), nl
	,tab(4), write(Siblings)
	,nl),
	(parent_sibling(ParentSiblings, 'Karl Heinz')
	,write('ParentSiblings of Karl Heinz'), nl
	,tab(4), write(ParentSiblings)
	,nl)
	.

main :-
	load_knowledge_base, run_queries.
