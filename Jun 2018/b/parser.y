%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include"matrice.h"

#include"y.tab.h"

extern int yylex();

void yyerror(){
	fprintf(stderr, "Greska.\n");
	exit(EXIT_FAILURE);
}



typedef struct {
	char* ime;
	int** mat;
	int br_linija;
}promenljiva;

promenljiva prom[100];
int br_prom = 0;

int vrste=0, kolone=0, brelem=50;
int max_vrste, max_kolone;

int postoji(char* s){
	
	for (int i=0; i<br_prom; i++)
		if (strcmp(s, prom[i].ime) == 0) return i;

	return -1;
}
%}

%token disp_tok size_tok 
%token <br> num
%token <s> id

%union {
	int br;
	int* niz;
	int** mat;
	char* s;
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
 			ispisi($3, max_vrste, max_kolone);
			oslobodi($3, kolone);
			kolone=0;
			vrste=0;
	}
	| id '=' E {
		
		int k = postoji($1);
		if (k!=-1) {
			prom[k].mat = $3;
			prom[k].br_linija = kolone;
			prom[k].ime = $1;
		}else{
			prom[br_prom].mat = $3;
			prom[br_prom].br_linija = kolone;
			prom[br_prom++].ime = $1;
			oslobodi($3, kolone);
			kolone=0;
			vrste=0;
		}
	}
	| size_tok '(' E ')' {
		printf("%dx%d\n", max_kolone, max_vrste);
	}
	| E
	;

E 
	: '[' E_m ']' {
		$$ = $2;
		max_kolone = kolone;
		kolone=0;
	}
	| id {
		int k = postoji($1);
		if (k == -1){
			fprintf(stderr, "Ne postoji promenljiva\n");
			exit(EXIT_FAILURE);
		} else {
			$$ = prom[k].mat;
		}
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
