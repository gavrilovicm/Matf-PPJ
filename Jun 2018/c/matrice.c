#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include"matrice.h"

int* dodaj_elem_niz(int* niz, int k, int* vrste, int*brelem){
	
	if (niz == NULL) {
		niz=(int*)malloc((*brelem)*sizeof(int));
		niz[*vrste] = k;
		(*vrste)++;
		return niz;
	}

	if (*vrste > *brelem){
		*brelem *= 2;
		niz = realloc(niz, *brelem);
	}
	niz[*vrste] = k;
	(*vrste)++;
	return niz;
}


int** dodaj_u_matricu(int** mat, int* niz, int* kolone,  int* dim){
	
	if (mat == NULL) {
		mat = (int**)malloc((*dim)*sizeof(int*));
		mat[(*kolone)++] = niz;
		return mat;
	}

	if (*kolone > *dim) {
		(*dim)*=2;
		mat = realloc(mat, *dim);
	}
	
	mat[*kolone] = niz;
	*kolone +=1;
	return mat;
}

void oslobodi(int** mat, int kolone){
	for (int i=0; i<kolone; i++)
		free(mat[i]);
	
}


void ispisi(int** mat, int vrste, int kolone){
	int i, j;
	for (i=0; i<kolone; i++){
		for (j=0; j<vrste; j++)
			printf("%d ", mat[i][j]);
		printf("\n");
	}
}

int** pokoordinatno_mnozenje(int** m1, int** m2, int kolone, int vrste){
	int i,j;
	int** mat;

	mat = (int**)malloc(kolone*sizeof(int*));


	for (i=0; i<kolone; i++){
		mat[i] = (int*)malloc(vrste*sizeof(int));
		for (j=0; j<vrste; j++)
			mat[i][j] = m1[i][j] * m2[i][j];
	}

	return mat;

}

int** pokoordinatno_sabiranje(int** m1, int** m2, int kolone, int vrste){
	int i,j;
	int** mat;

	mat = (int**)malloc(kolone*sizeof(int*));


	for (i=0; i<kolone; i++){
		mat[i] = (int*)malloc(vrste*sizeof(int));
		for (j=0; j<vrste; j++)
			mat[i][j] = m1[i][j] + m2[i][j];
	}

	return mat;

	
}
























