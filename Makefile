
default: run

run:
	@swipl -q -l src/main.pl -g "main, halt"

TESTS = no_test.plt

test: $(TESTS)

%.plt:
	@echo "Start of test $*"
	@swipl -q -l src/$@ -g "run_tests($*), halt"
	@echo "End of test $*"
