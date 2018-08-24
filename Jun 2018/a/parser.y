%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include"matrice.h"

#include"y.tab.h"

extern int yylex();

void yyerror(const char* s){
	fprintf(stderr, "Greska.\n");
	exit(EXIT_FAILURE);
}



typedef struct {
	char* id;
	int** mat;
	int br_linija;
}promenljiva;

promenljiva prom[100];
int br_prom = 0;

int vrste=0, kolone=0, brelem=50;
int max_vrste;

%}

%token disp_tok size_tok
%token <br> num

%union {
	int br;
	int* niz;
	int** mat;
}
%type <niz> NizBrojeva E_j
%type <mat> E_m E 

%%

Program : NizLinija
		;
NizLinija
	: NizLinija Linija '\n'
	| 
	;

Linija
	: disp_tok '(' E ')' {
		ispisi($3, max_vrste, kolone);
		oslobodi($3, kolone);
		kolone=0;
		vrste=0;
	}
	| size_tok '(' E ')' {
		printf("%dx%d\n", kolone, max_vrste);
	}
	| E
	;

E 
	: '[' E_m ']' {
		$$ = $2;
	}
	;

E_m
	: E_m ';' E_j {
		$$ = dodaj_u_matricu($1, $3, &kolone, &brelem);
	}
	| E_j {
		$$ = dodaj_u_matricu(NULL, $1, &kolone, &brelem);
	}
	;

E_j
	: '[' NizBrojeva ']' {
		max_vrste = vrste;
		vrste = 0;
		$$ = $2;
	}
	;

NizBrojeva 
	: NizBrojeva ',' num{
		$$ = dodaj_elem_niz($1, $3, &vrste, &brelem);
	}
	| num {
		$$ = dodaj_elem_niz(NULL, $1, &vrste, &brelem);
	}
	;






%%

int main(){
	yyparse();
	exit(EXIT_SUCCESS);
}
