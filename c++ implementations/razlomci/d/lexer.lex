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
[a-zA-Z][a-zA-Z0-9]* {
	yylval.s = new std::string(yytext);
	return id_tok;
}

(-)?([0-9]|[1-9][0-9]+) {
	yylval.i = atoi(yytext);
	return num_tok;
}

[+*/[\](),\n=-] {
	return *yytext;
}
[ \t] {}

. {
	std::cout << "Greska nepoznat token" << *yytext << std::endl;
	return 0;
}
%%
