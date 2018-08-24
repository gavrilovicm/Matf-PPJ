#include<stdio.h>
#include<stdlib.h>
#include<string.h>

#include"vektor.h"


cvor* novi(double n){
	cvor* pom = malloc(sizeof(cvor));
	if (pom == NULL) {
		fprintf(stderr, "Neuspela alokacija\n");
		exit(EXIT_FAILURE);
	}
	pom->sled = NULL;
	pom->vrednost = n;
	return pom;
}

cvor* dodaj_na_kraj(cvor* lista, double n){
	
	if (lista == NULL) lista = novi(n);
	else{
		cvor *pom = lista;
		while (pom->sled != NULL) pom = pom->sled;

		pom->sled = novi(n);
	}
	return lista;
}

void ispisi(cvor* lista){
	
	printf("<");
	cvor* pom = lista;
	while (pom->sled != NULL){
		printf("%.2lf, ", pom->vrednost);
		pom = pom->sled;
	}
	printf("%.2lf>\n", pom->vrednost);
}

















