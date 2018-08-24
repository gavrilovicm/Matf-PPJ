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

"/\\" {
	return i_tok;
}

"\\/" {
	return ili_tok;
}

"=>" {
	return sled_tok;
}

"<=>" {
	return ekv_tok;
}

[a-zA-Z]+ {
	return id;
}

[\n+.?:=-] {
	return *yytext;
}

[ \t] {}

. {}


%%
