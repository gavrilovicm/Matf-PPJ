%option noinput
%option nounput
%option noyywrap

%{
#include<iostream>

#include"razlomak.hpp"
#include"parser.tab.hpp"
%}

%%
print {
	return print_tok;
}

nom {
	return nom_tok;
}
den {
	return den_tok;
}

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
