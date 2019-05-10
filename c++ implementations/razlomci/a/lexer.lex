%option noinput
%option nounput
%option noyywrap

%{
#include<iostream>

#include"parser.tab.hpp"
%}

%%

(-)?([0-9]|[1-9][0-9]+) {
	yylval.i = atoi(yytext);
	return num_tok;
}

[+*/[\](),\n-] {
	return *yytext;
}
[ \t] {}

. {
	std::cout << "Greska nepoznat token" << *yytext << std::endl;
	return 0;
}
%%
