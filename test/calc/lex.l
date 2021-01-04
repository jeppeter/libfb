
%{
#include "calc.tab.h"
#include "calc_token.h"
#include <stdio.h>
int lines = 0;
%}

%%
"+" {return PLUS;}
"-" {return MINUS;}
"*" {return MULTIPLE;}
"/" {return DIVIDE;}
"(" {return LBRACE;}
")" {return RBRACE;}
[0-9]+(\.[0-9]+)? { yylval = atof(yytext);return NUMBER;}
\n  {lines ++;}
"//".* {}
[ \t]+ {}
. { fprintf(stderr,"lines [%d] [%s]\n", lines,yytext);}

%%