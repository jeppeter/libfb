
%{

#define  SYMBOL_DIGIT           1
#define  SYMBOL_SYMBOL          2
#define  SYMBOL_ALL_OTHER       3

#include <stdio.h>
#include <stdlib.h>

static int lex_lines = 0;
static int meet_eof = 0;

%}



DIGIT [0-9]+(\.[0-9]+)?
SYMBOL [a-zA-Z_][a-zA-Z0-9_]*


%%

\n {lex_lines++;}


DIGIT {
	return SYMBOL_DIGIT;
}

SYMBOL {
	return SYMBOL_SYMBOL;
}


.* { fprintf(stdout,"line [%s]\n", yytext); }


%%

int main(int argc,char* argv[])
{
	yylex();	
	fprintf(stdout,"lines [%d]\n",lex_lines);
	return 0;
}

