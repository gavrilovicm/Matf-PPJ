%option noinput
%option nounput
%option noyywrap

%{
#include<iostream>
#include<string>
#include<cstdlib>



#include "parser.tab.hpp"
%}

%%

"print" {
	return print_tok;
}

([0-9]|[1-9][0-9]*) {
	yylval.integer = atoi(yytext);
	return broj_tok;
}

[a-zA-Z][a-zA-Z0-9]* {
	yylval.s = new std::string(yytext);
	return prom_tok;
}

[+*()/\n=-] {
	return *yytext;
}

[ \t] {}

. {
	std::cerr<< "Leksicka greska, nepoznat token: " << *yytext << std::endl;
	exit(EXIT_FAILURE);
}


%%
