

all:input


input:lex.o
	gcc -Wall -o $@ $< -lfl

lex.o:lex.c
	gcc -Wall -c $< -o $@

lex.c:lex.l
	flex -o $@ $<



clean:
	rm -f lex.c
	rm -f input lex.o