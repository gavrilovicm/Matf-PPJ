%option noinput
%option nounput
%option noyywrap
%{
#include<iostream>
#include<vector>
#include"mat.hpp"

#include"parser.tab.hpp"
%}
%%

disp {
	return disp_tok;
}
size {
	return size_tok;
}
".+" {
	return pokoordinatno_sabiranje_tok;
}
".*" {
	return pokoordinatno_mnozenje_tok;
}
[a-zA-Z] {
	if (((*yytext) >= 'a') && ((*yytext) <= 'z')){
		yylval.c = *yytext;
		return id_tok;
	}else{
		yylval.c = *yytext + ('a' - 'A');
		return id_tok;
	}
}


(-)?([0-9]|[1-9][0-9]*) {
	yylval.i = atoi(yytext);
	return num_tok;
}
"'" {
	return transp_tok;
}
[(),*[\];\n=-] {
	return *yytext;
}

[ \t] {}

. {
	std::cout << "Greska, nepoznat token: " << *yytext << std::endl;
	exit(EXIT_FAILURE);
}
%%
