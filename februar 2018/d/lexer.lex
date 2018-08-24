%option noinput
%option nounput
%option noyywrap
%{

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include"lista.h"

#include"y.tab.h"

extern void yyerror(const char* s);


%}


%%

head { return head_tok;}

tail { return tail_tok;}

"True" {
	return true_tok;
}

"False" {return false_tok;}

"Undef" {return undef_tok;}

":=" {return dod_tok;}

"/\\" {
	return i_tok;
}

"\\/" {
	return ili_tok;
}

"=>" {
	return sled_tok;
}
"!" {return neg_tok;}

"<=>" {
	return ekv_tok;
}

[A-Z][A-Z0-9]* {
	yylval.s = strdup(yytext);
	return id_lista_tok;
}

[a-zA-Z]+ {
	yylval.s = strdup(yytext);
	return id_tok;
}

[1-9][0-9]* {
	yylval.br = atoi(yytext);
	return num;
}

[\n[\],+().?:=-] {
	return *yytext;
}

[ \t] {}

. {}


%%
