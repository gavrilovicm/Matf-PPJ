%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include"lista.h"

#include"y.tab.h"

void yyerror(const char *s){
	fprintf(stderr, "%s\n", s);
	exit(EXIT_FAILURE);
}

extern int yylex();

typedef enum { false, true, undef} bool;

typedef struct{
	cvor* lista;
	char* id;
}promenljiva_liste;

promenljiva_liste prom_l[100];
int br_prom_l = 0;

int postoji_l(char* s){
	int i;
	for (i=0; i<br_prom_l; i++)
		if (strcmp(s, prom_l[i].id) == 0) return i;
	
	return -1;
}


typedef struct {
	bool vrednost;
	char* id;
}promenljiva;

promenljiva prom[100];
int br_prom = 0;

int postoji(char* s){
	int i;
	for (i=0; i<br_prom; i++)
		if(strcmp(s, prom[i].id) == 0) return i;
	return -1;
}

int ind=1;

%}

%token num i_tok id_lista_tok neg_tok ekv_tok ili_tok sled_tok id_tok dod_tok true_tok false_tok undef_tok head_tok tail_tok

%left i_tok ili_tok dod_tok
%left ekv_tok sled_tok
%left neg_tok

%union {
	char* s;
	int br;
	int log;
	cvor* l;
}

%type <log> E
%type <s> id_tok id_lista_tok
%type <l> NizTerm
%type <br> num


%%

Program : NizLinija
		;

NizLinija 
	: NizLinija Linija '\n' {
		ind = 1;
	}
	| 
	;
Linija
	: E {
		if ($1 == 2) printf("Undef\n");
		else if ($1) printf("True\n");
			else printf("False\n");
	}
	| id_tok dod_tok E{
		int k = postoji($1);
		if (k==-1){
			prom[br_prom].vrednost = $3;
			prom[br_prom++].id = $1;
		}else{
			prom[k].vrednost = $3;
		}
	}
	| id_lista_tok dod_tok '[' NizTerm ']' {
		int k = postoji_l($1);
		if (k==-1){
			prom_l[br_prom_l].lista = $4;
			prom_l[br_prom_l++].id = $1;
		}else{
			prom_l[k].lista = $4;
		}
	}
	;

NizTerm
	: NizTerm ',' E {
		$$ = dodaj($1, $3, &ind);
	}
	| E {
		$$ = dodaj(NULL, $1, &ind);
	}
	;


E
	: E i_tok E{
		if (($1 == 2) || ($3 == 2)) $$ = 2;
		else {
			if (($1 == 1) && ($3 == 1)) $$ = 1;
			else $$ = 0;
		}
	}
	| E ili_tok E {
		if (($1 == 2) || ($3 == 2)) $$ = 2;
		else {
			if (($1 == 1) || ($3 == 1)) $$ = 1;
			else $$ = 0;
		}
	}
	| E ekv_tok E {
		if (($1 == 2) || ($3 == 2)) $$ = 2;
		else {
			if ($1 == $3) $$ = 1;
			else $$ = 0;
		}
		
	}
	| E sled_tok E {
		if (($1 == 2) || ($3 == 2)) $$ = 2;
		else {
			if ($1 == 0) $$ = 1;
			else if ($3 == 0) $$ = 0;
				else $$ = 1;
		}
	}
	| neg_tok E {
		if ($2 == 2) $$ = 2;
		else {
			if ($2 == 1) $$ = 0;
				else $$ = 1;
		}
	}
	| id_tok {
		int k = postoji($1);
		if (k==-1) {
			$$ = 2;
		}else
			$$ = prom[k].vrednost;
	}
	| id_lista_tok '[' num ']' {
		int k=postoji_l($1);
		
		if (k == -1) {
			fprintf(stderr, "Promenljiva %s ne postoji\n", $1);
			exit(EXIT_FAILURE);
		}
		else {
			int i = pretrazi(prom_l[k].lista, $3);
			if (i == -1) {
				fprintf(stderr, "Ne postoji indeks %d u listi %s\n", $3, prom_l[k].id);
				exit(EXIT_FAILURE);
			}else {
				$$ = i;
			}
		}
	}
	| head_tok '(' id_lista_tok ')' {
		int k = postoji_l($3);
		if (k == -1){
			fprintf(stderr, "Ne postoji promenljiva %s\n", $3);
			exit(EXIT_FAILURE);
		}
		$$ = prvi(prom_l[k].lista);
	}
	| head_tok '(' E ')' {
		$$ = $3;
	}
	| tail_tok '(' id_lista_tok ')' {
		int k = postoji_l($3);
		if (k == -1){
			fprintf(stderr, "Ne postoji promenljiva %s\n", $3);
			exit(EXIT_FAILURE);
		}
		$$ = poslednji(prom_l[k].lista);
	}
	| tail_tok '(' E ')' {
		$$ = $3;
	}
	| true_tok{
		$$ = 1;
	}
	| false_tok {
		$$ = 0;
	}
	| undef_tok {
		$$ = 2;
	}
	;

%%

int main(){
	yyparse();
	exit(EXIT_SUCCESS);
}
