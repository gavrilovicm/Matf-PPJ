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
	int br_vrsta;
	int br_kolona;
}promenljiva;

promenljiva prom[100];
int br_prom = 0;

int vrste=0, kolone=0, brelem=50;

int postoji(char* s){
	
	for (int i=0; i<br_prom; i++)
		if (strcmp(s, prom[i].ime) == 0) return i;

	return -1;
}

int tr_vrste=0, tr_kolone=0;

%}

%token disp_tok size_tok km_tok kp_tok
%token <br> num
%token <s> id

%left km_tok 
%left id

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
 			ispisi($3, tr_vrste, tr_kolone);
			oslobodi($3, tr_kolone);
			kolone=0;
			vrste=0;
	}
	| disp_tok '(' id ')' {
			int l = postoji($3);
			if (l == -1) {
				fprintf(stderr, "Nema promenljive %s\n", $3);
				exit(EXIT_FAILURE);
			}
 			ispisi(prom[l].mat, prom[l].br_vrsta, prom[l].br_kolona);
			kolone=0;
			vrste=0;
	}
	| id '=' E {
		
		int k = postoji($1);
		if (k!=-1) {
			prom[k].mat = $3;
			prom[k].br_kolona = tr_kolone;
			prom[k].br_vrsta = tr_vrste;
			prom[k].ime = $1;
		}else{
			prom[br_prom].mat = $3;
			prom[br_prom].br_kolona = tr_kolone;
			prom[br_prom].br_vrsta = tr_vrste;
			prom[br_prom++].ime = $1;
			kolone=0;
			vrste=0;
		}
	}
	| id '=' id {
		int l = postoji($3);
		if (l==-1) {
			fprintf(stderr, "Nema promenljive %s\n", $3);		
			exit(EXIT_FAILURE);
		}

		int k = postoji($1);
		if (k!=-1) {
			prom[k].mat = prom[l].mat;
			prom[k].br_kolona = prom[l].br_kolona;
			prom[k].br_vrsta = prom[l].br_vrsta;
			prom[k].ime = $1;
		}else{
			prom[br_prom].mat = prom[l].mat;
			prom[br_prom].br_kolona = prom[l].br_kolona;
			prom[br_prom].br_vrsta = prom[l].br_vrsta;
			prom[br_prom++].ime = $1;
			kolone=0;
			vrste=0;
		}
	}
	| size_tok '(' E ')' {
		printf("%dx%d\n", tr_kolone, tr_vrste);
	}
	| size_tok '(' id ')' {
		int k = postoji($3);
		int vr=prom[k].br_vrsta;
		int kol = prom[k].br_kolona;

		printf("%dx%d\n", kol, vr);
	}
	| E
	;

E 
	: '[' E_m ']' {
		$$ = $2;
		tr_kolone = kolone;
		kolone=0;
	}
	| id km_tok id {
		int k1 = postoji($1);
		int k2 = postoji($3);
		if (k1 == -1){
			fprintf(stderr, "Ne postoji promenljiva %s\n", $1);
			exit(EXIT_FAILURE);
		}
		if (k2 == -1){
			fprintf(stderr, "Ne postoji promenljiva %s\n", $3);
			exit(EXIT_FAILURE);
		}
		int vrste_prve = prom[k1].br_vrsta;
		int kolone_prve = prom[k1].br_kolona;
		int vrste_druge = prom[k2].br_vrsta;
		int kolone_druge = prom[k2].br_kolona;
		if ((vrste_prve != vrste_druge)||(kolone_prve != kolone_druge)) {
			fprintf(stderr, "Dimenzije se ne poklapaju\n");
			exit(EXIT_FAILURE);
		}
		int** mat1 = prom[k1].mat;
		int** mat2 = prom[k2].mat;
		$$ = pokoordinatno_mnozenje(mat1, mat2, kolone_prve, vrste_druge);
		tr_vrste = vrste_prve;
		tr_kolone = kolone_prve;
	}
	
	| id kp_tok id {
		int k1 = postoji($1);
		int k2 = postoji($3);
		if (k1 == -1){
			fprintf(stderr, "Ne postoji promenljiva %s\n", $1);
			exit(EXIT_FAILURE);
		}
		if (k2 == -1){
			fprintf(stderr, "Ne postoji promenljiva %s\n", $3);
			exit(EXIT_FAILURE);
		}
		int vrste_prve = prom[k1].br_vrsta;
		int kolone_prve = prom[k1].br_kolona;
		int vrste_druge = prom[k2].br_vrsta;
		int kolone_druge = prom[k2].br_kolona;
		if ((vrste_prve != vrste_druge)||(kolone_prve != kolone_druge)) {
			fprintf(stderr, "Dimenzije se ne poklapaju\n");
			exit(EXIT_FAILURE);
		}
		int** mat1 = prom[k1].mat;
		int** mat2 = prom[k2].mat;
		$$ = pokoordinatno_sabiranje(mat1, mat2, kolone_prve, vrste_druge);
		tr_vrste = vrste_prve;
		tr_kolone = kolone_prve;

	}
/*
	nemam ideju kako da mi E bude u isto vreme i 'id' i da vrati matricu
	koja odgovara id-u a takodje i njene dimenzije pa sam napravio svaku 
	instrukciju da moze da prihvati id a i samu matricu E
	====================================================================
	zbog toga svaka instrukcija ima duplu definiciju, jednu za E jednu za id
	pa je sledeci deo za 'id' izbacen iz koda ...
	

*/
/*	| id {
		int k = postoji($1);
		if (k == -1){
			fprintf(stderr, "Ne postoji promenljiva %s\n", $1);
			exit(EXIT_FAILURE);
		} else {
			$$ = prom[k].mat;
		}
	}*/		
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
		tr_vrste = vrste;
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
