%option noyywrap
%option noinput
%option nounput
%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include"vektor.h"
#include<math.h>

#include"y.tab.h"


extern void yyerror(const char* s);

%}

%%

ugao {
	return ugao_tok;
}

"print" {
	return print_tok;
}

[a-zA-Z]+ {
	yylval.s = strdup(yytext);
	return id_tok;
}

[*:=<>;(),+.|-] {
	return *yytext;
}


[-]?[0-9]*(\.[0-9]+)? {
	yylval.broj = atof(yytext);
	return num;
}

[ \n\t] {

}

. {
	fprintf(stderr, "Leksicka greska, nepoznat token : %s\n", yytext);
	exit(EXIT_FAILURE);
}


%%
