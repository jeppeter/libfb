%{
#include "calc.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include "calc_token.h"
#include <stdarg.h>

%}

%token PLUS MINUS
%token MULTIPLE DIVIDE
%token LBRACE RBRACE
%token NUMBER

%define api.value.type {double}
%debug

%%

calclist :
  expr { printf("%f\n", $1);}


expr : 
 term PLUS term { $$ = $1 + $3; }
 | term MINUS term { $$ = $1 - $3; }

term:
  factor { $$ = $1; }
  | factor MULTIPLE factor { $$ = $1 * $3;}
  | factor DIVIDE factor { $$ = $1 / $3; }

factor:
  NUMBER { $$ = yylval; }
  | LBRACE expr RBRACE { $$ = $2; }


%%

int main(int argc,char* argv[])
{
	yydebug = 1;
	yyin = stdin;
	if (argc > 1) {
		yyin = fopen(argv[1],"r+");
	}
	yyparse();
	return 0;
}

void yyerror(char* fmt,...)
{
	va_list ap;
	va_start(ap,fmt);
	fprintf(stderr,"begin error [%d] YYDEBUG [%d]\n",lines, YYDEBUG);
	vfprintf(stderr,fmt,ap);
	fprintf(stderr,"end error\n");
	return;
}