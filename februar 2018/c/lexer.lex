%option noinput
%option nounput
%option noyywrap
%{

#include<stdio.h>
#include<stdlib.h>
#include<string.h>

#include"y.tab.h"

extern void yyerror(const char* s);


%}


%%

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

[a-zA-Z]+ {
	yylval.s = strdup(yytext);
	return id_tok;
}

[\n+.?:=-] {
	return *yytext;
}

[ \t] {}

. {}


%%
