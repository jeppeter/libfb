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
  | calclist expr { printf("%f\n", $2);}
  ;


expr : term { $$ = $1; YYDPRINTF((stderr,"expr %f\n", $$)); }
 | expr PLUS term { $$ = $1 + $3; YYDPRINTF((stderr,"expr PLUS %f\n", $$)); }
 | expr MINUS term { $$ = $1 - $3;  YYDPRINTF((stderr,"expr MINUS %f\n", $$));}
;

term:
  factor { $$ = $1;  YYDPRINTF((stderr,"term %f\n", $$)); }
  | term MULTIPLE factor { $$ = $1 * $3; YYDPRINTF((stderr,"term MULTIPLE %f\n", $$));}
  | term DIVIDE factor { $$ = $1 / $3;  YYDPRINTF((stderr,"term DIVIDE %f\n", $$));}
;

factor:
  NUMBER { $$ = yylval;  YYDPRINTF((stderr,"factor NUMBER %f\n", $$)); }
  | LBRACE expr RBRACE { $$ = $2;  YYDPRINTF((stderr,"factor expr %f\n", $$));}
;

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