
%{

#define  SYMBOL_DIGIT           1
#define  SYMBOL_SYMBOL          2

%}

int lex_lines = 0;


DIGIT [0-9]+(\.[0-9]+)?
SYMBOL [a-zA-Z_][a-zA-Z0-9_]*


%%

\n lex_lines++;


DIGIT {
	return SYMBOL_DIGIT;
}

SYMBOL {
	return SYMBOL_SYMBOL;
}

%%
