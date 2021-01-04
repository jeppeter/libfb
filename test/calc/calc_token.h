#ifndef __CALC_TOKEN_H_EABD0C500EB69BA05ABC0091BDB30568__
#define __CALC_TOKEN_H_EABD0C500EB69BA05ABC0091BDB30568__

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus*/


int yylex();
void yyerror(char* fmt,...) ;
extern char* yytext;
extern int lines;

#ifdef __cplusplus
};
#endif /* __cplusplus*/

#endif /* __CALC_TOKEN_H_EABD0C500EB69BA05ABC0091BDB30568__ */
