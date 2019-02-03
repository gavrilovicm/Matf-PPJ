%option noinput
%option nounput
%option noyywrap

%{
#include<iostream>
#include<string>
#include<cstdlib>
#include"kutije.hpp"


#include"parser.tab.hpp"
%}

%%

kutija {
	return kutija_token;
}
prazna {
	return prazna_token;
}
puna {
	return puna_token;
}
podigni {
	return podigni_token;
}
prikazi {
	return prikazi_token;
}
[A-Z]+ {
	yylval.s = new std::string(yytext);
	return id_token;
}
"<-" {
	return ubaci_token;
}
([0-9]|[1-9][0-9]*)([.][0-9]+) {
	yylval.d = atof(yytext);
	return real_num_token;
}
([0-9]|[1-9][0-9]*) {
	yylval.i = atoi(yytext);
	return int_num_token;
}
[()=,;[\]?-] {
	return *yytext;
}
[ \n\t] {}
. {
	std::cerr << "Leksicka greska, nepoznat token \"" << *yytext << "\"" << std::endl;
	exit(EXIT_FAILURE);
}



%%
