
run:
	@swipl -q -l src/main.pl -g "main, halt"

test:
	@swipl -q -l src/pedigree.pl -l src/pedigree.plt -g "run_tests(pedigree), halt"
