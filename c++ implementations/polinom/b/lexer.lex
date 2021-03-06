%option noinput
%option nounput
%option noyywrap

%{
#include<iostream>
#include<string>
#include<cstdlib>
#include"poli.hpp"


#include"parser.tab.hpp"

%}
%%

[-]?([0-9]|[1-9][0-9]*)([.]([1-9]|[0-9][1-9]*))? {
	yylval.double_type = atof(yytext);
	return broj_token;
}
[*<>,\n+-] {
	return *yytext;
}
[ \t] {}
. {
	std::cerr << "Leksicka greska, nepoznat token \"" << *yytext << "\" "  << std::endl;
	exit(EXIT_FAILURE);
}


%%


