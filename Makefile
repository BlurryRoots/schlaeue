
run:
	@swipl -q -l src/main.pl -g "main, halt"

TESTS := pedigree.plt

test: $(TESTS)
	@swipl -q -l src/$^ -g "run_tests(pedigree), halt"

%.plt:
	@echo "running test for $@"
