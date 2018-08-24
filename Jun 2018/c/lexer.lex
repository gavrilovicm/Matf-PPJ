%option noyywrap
%option noinput
%option nounput
%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include"matrice.h"

#include"y.tab.h"

extern int yyerror();
%}


%%

disp { return disp_tok; }
size { return size_tok; }

[1-9][0-9]* {
	yylval.br = atoi(yytext);
	return num;
}

".+" {
	return kp_tok;
}

".*" {
	return km_tok;
}


[a-zA-Z][0-9a-zA-Z]* {
	yylval.s = strdup(yytext);
	return id;
}

[()[\]\n,=;] {return *yytext;}

[ \t] {}

. {
	fprintf(stderr, "Leksicka greska, nepoznat token %s\n", yytext);
	exit(EXIT_FAILURE);
}

%%
