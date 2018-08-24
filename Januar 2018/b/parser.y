%{

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include"vektor.h"

#include"y.tab.h"

void yyerror(const char* s){
	fprintf(stderr,"%s\n", s);
	exit(EXIT_FAILURE);
}

extern int yylex();

typedef struct {
	cvor* vektor;
	char* id;
}vek;

vek vektor[100];
int br_vektor = 0;

int postoji(char* s){
	if (br_vektor == 0) return -1;
	for (int i=0; i<br_vektor; i++){
		if (strcmp(vektor[i].id, s) == 0) return i;
	}
	return -1;
}



%}

%union {
	char* s;
	double broj;
	cvor* v;
}


%left '+' '-'
%left '*' 


%token <broj> num
%token <s> id_tok
%token print_tok

%type <v> E Niz_brojeva 


%%

Program : NizLinija
		;

NizLinija
	: NizLinija Linija ';'
	|
	;

Linija
	: id_tok ':' '=' E {
		int k = postoji($1);
		if (k == -1){
			vektor[br_vektor].id = $1;
		vektor[br_vektor++].vektor = $4;
	}else{
			vektor[k].vektor = $4;
		}
	}
	| print_tok '(' E ')' {
		if ($3 != NULL) ispisi($3);
	}
	;

E
	: id_tok {
		int k = postoji($1);
		if (k==-1) {
			fprintf(stderr, "Ne postoji promenljiva %s\n", $1);	
			$$ = NULL;
		}else $$ = vektor[k].vektor;
	}
	| '<' Niz_brojeva '>' {
		$$ = $2;
	}
	| E '+' E {
		if (duz($1) != duz($3)) {
			printf("Greska u dimenziji vektora\n");	
			$$ = NULL;
		}
		else {
			$$ = saberi($1, $3);
		}
	}
	| E '-' E {
		printf("OVDE\n\n");
		if (duz($1) != duz($3)){
			printf("Greska u dimenziji vektora\n");	
			$$ = NULL;
		}
		else {
			$$ = oduzmi($1, $3);
		}

	}
	| num '*' E {
		$$ = mnozi($3, $1);
	}
	;

Niz_brojeva 
	: Niz_brojeva ',' num {
		$$ = dodaj_na_kraj($1, $3);
	}
	| num {
		$$ = dodaj_na_kraj(NULL, $1);
	}
	;



%%


int main(){
	yyparse();
	exit(EXIT_SUCCESS);
}
