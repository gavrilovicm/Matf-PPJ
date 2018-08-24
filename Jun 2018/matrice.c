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

int** mnozenje(int** mat1, int** mat2, int vrste_prve, int kolone_prve, int vrste_druge, int kolone_druge){
	int i,j,k1, k2;
	int** m;
	m = (int**)malloc(vrste_prve*sizeof(int*));
	
	k1=0;
	
	for (i=0; i<vrste_prve; i++){
		m[i] = (int*)malloc(kolone_druge*sizeof(int));
		k2=0;
		//anuliramo sve vrednosti ove vrste
		for (j=0; j<kolone_druge; j++){
			m[i][j] = 0;
		}

		for (j=0; j<kolone_druge; j++){
			for (int l=0; l<kolone_prve; l++){
				m[i][j] += mat1[k1][l] * mat2[l][k2];
		}
			k2++;
		}
		k1++;
	}
	return m;

}


int** transponuj(int** mat, int vrste, int kolone){
	int** m = (int**)malloc(vrste*sizeof(int*));
	int i,j;

	for (i=0; i<vrste; i++){
		m[i] = (int*)malloc(kolone*sizeof(int));
		for (j=0; j<kolone; j++)
			m[i][j] = mat[j][i];
	}

	return m;
}
















