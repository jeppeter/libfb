all: eval

eval.lex.c: eval.l
	flex -o $@ --header-file=$(patsubst %.c,%.h,$@) --debug $<

eval.tab.c: eval.y
	bison -o $@ --defines=$(patsubst %.c,%.h,$@) --debug $<

eval: main.c eval.tab.c eval.lex.c eval.h
	$(CC) -o $@ -Wall --std=c11 -ggdb -D_XOPEN_SOURCE=700 $(filter %.c,$^)

clean:
	rm -f eval.tab.c eval.lex.c eval.tab.h eval.lex.h main