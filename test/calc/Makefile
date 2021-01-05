

all:calc


calc:calc.tab.o lex.o
	gcc -Wall -g -o $@ $^ -lfl

%.o:%.c
	gcc -Wall -g -c $< -o $@

calc.tab.h calc.tab.c:calc.y
	bison  -d $<

lex.c:lex.l calc.tab.h
	flex -o $@ $<


clean:
	rm -f calc calc.tab.c calc.tab.h lex.c  *.o