%option noinput 
%option nounput
%option noyywrap

%{
#include<iostream>
#include<vector>
#include<cstdlib>
#include<string>
#include<map>
#include"vektor.hpp"



#include"parser.tab.hpp"
%}


%%

vector {
	return vector_token;
}
print {
	return print_token;
}
(-)?([0-9]|[1-9][0-9]*)([.][0-9]*)? {
	yylval.double_type = atof(yytext);
	return num_token;
}
[a-z]([0-9]*)? {
	yylval.s = new std::string(yytext);
	return id_token;
}
[,[\].=;+*-] {
	return *yytext;
}
[ \n\t] {}
. {
	std::cout << "Leksicka greska: nepoznat token \"" << *yytext << " \"" << std::endl;
	exit(EXIT_FAILURE);
}




%%
