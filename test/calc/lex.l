
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
\r {}
. { 
    int jk;
	unsigned char* ptr = (unsigned char*)yytext;
	unsigned char* plast = ptr;
	fprintf(stderr,"lines [%d] [%s]\n", lines,yytext); 
	for (jk=0;jk < yyleng ; jk ++,ptr++) {
		if ((jk % 16) == 0) {
			if (jk > 0) {
				fprintf(stderr,"    ");
				while(plast != ptr) {
					if (*plast >= 0x20 && *plast <= 0x7e) {
						fprintf(stderr,"%c", *plast);
					} else {
						fprintf(stderr,".");
					}
					plast ++;
				}
				fprintf(stderr,"\n0x%08x:",jk);
			}
			fprintf(stderr," 0x%02x", *ptr);
		}
	}

	if (plast != ptr) {
		while((jk % 16)) {
			fprintf(stderr,"     ");
			jk ++;
		}

		fprintf(stderr,"    ");
		while(plast != ptr) {
			if (*plast >= 0x20 && *plast <= 0x7e) {
				fprintf(stderr,"%c", *plast);
			} else {
				fprintf(stderr,".");
			}
			plast ++;
		}
		fprintf(stderr,"\n");
	}
}

%%