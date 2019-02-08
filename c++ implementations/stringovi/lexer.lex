%option noinput
%option nounput 
%option noyywrap

%{
#include<iostream>
#include<string>
#include<cstdlib>
#include<vector>

#include"parser.tab.hpp"

%}

%%

string {
	return string_token;
}
reverse {
	return reverse_token;
}
length {
	return length_token;
}
print {
	return print_token;
}
sort {
	return sort_token;
}
substring {
	return substring_token;
}
upper {
	return upper_token;
}
lower {
	return lower_token;
}
"+=" {
	return concat_token;
}
"==" {
	return eq_token;
}
([0-9]|[1-9][0-9]*) {
	yylval.i = atoi(yytext);
	return num_token;
}

["][a-zA-Z0-9]*["] {
	std::string* s = new std::string(yytext);
	std::string s1 = s->substr(1, s->length()-2);
	yylval.s = new std::string(s1);
	delete s;
	return value_token;
}

[a-zA-Z][a-zA-Z0-9]* {
	yylval.s = new std::string(yytext);
	return id_token;
}
[+*";[\](),=] {
	return *yytext;
}
[ \n\t] {}
. {
	std::cerr << "Leksicka greska: nepoznat token \"" << *yytext << "\"" << std::endl;
	exit(EXIT_FAILURE);
}


%%
