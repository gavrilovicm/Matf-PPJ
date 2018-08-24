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

%token i_tok ekv_tok ili_tok sled_tok id

%left i_tok ili_tok
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
	| E ili_tok E
	| E ekv_tok E
	| E sled_tok E
	| id
	;

%%

int main(){
	yyparse();
	exit(EXIT_SUCCESS);
}
