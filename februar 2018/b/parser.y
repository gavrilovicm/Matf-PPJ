%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

#include"y.tab.h"

void yyerror(const char *s){
	fprintf(stderr, "%s\n", s);
	exit(EXIT_FAILURE);
}

extern int yylex();


%}

%token i_tok ekv_tok ili_tok sled_tok id dod_tok true_tok false_tok

%left i_tok ili_tok dod_tok
%left ekv_tok sled_tok



%%

Program : NizLinija
		;

NizLinija 
	: NizLinija Linija '\n'
	| 
	;
Linija
	: E
	;

E
	: E i_tok E
	| id dod_tok E
	| E ili_tok E
	| E ekv_tok E
	| E sled_tok E
	| id
	| true_tok
	| false_tok
	;

%%

int main(){
	yyparse();
	exit(EXIT_SUCCESS);
}
