%option noinput
%option nounput
%option noyywrap

%{
#include<iostream>
#include<string>
#include<cstdlib>
#include<map>
#include<set>
#include<vector>
#include"skup.hpp"


#include"parser.tab.hpp"

%}


%%

check {
	return check_token;
}
print {
	return print_tok;
}
card {
	return card_token;
}
"\\/" {
	return union_token;
}
"/\\" {
	return intersect_token;
}
"\\" {
	return diff_token;
}
([0-9]|[1-9][0-9]*) {
	yylval.int_type = atoi(yytext);
	return num_tok;
}

[a-zA-Z]* {
	yylval.s = new std::string(yytext);
	return id_tok;
}

[;=.}{<:~,] {
	return *yytext;
}
[ \n\t] {}
. {
	std::cerr << "Leksicka greska, nepoznat token: " << *yytext << std::endl;
	exit(EXIT_FAILURE);
}

%%

