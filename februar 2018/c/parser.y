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

typedef enum { false, true, undef} bool;

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

%}

%token i_tok neg_tok ekv_tok ili_tok sled_tok id_tok dod_tok true_tok false_tok undef_tok

%left i_tok ili_tok dod_tok
%left ekv_tok sled_tok
%left neg_tok

%union {
	char* s;
	int br;
	int log;
}

%type <log> E
%type <s> id_tok



%%

Program : NizLinija
		;

NizLinija 
	: NizLinija Linija '\n'
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
