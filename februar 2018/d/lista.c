#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include"lista.h"

cvor* novi(int vrednost, int indeks){

	cvor* novi = malloc(sizeof(cvor));
	if (novi == NULL) {
		fprintf(stderr, "Greska pri alokaciji\n");
		exit(EXIT_FAILURE);
	}
	novi->vr = vrednost;
	novi->indeks = indeks;
	novi->sled = NULL;
	return novi;
}


cvor* dodaj(cvor* lista,int vrednost, int* indeks){

	if (lista==NULL) {
		(*indeks) = (*indeks)+1;
		lista = novi(vrednost, (*indeks)-1);
		return lista;
	}
	
	cvor* pom = lista;
	while(pom->sled != NULL) pom=pom->sled;

	pom->sled = novi(vrednost, *indeks);
	(*indeks)++;
	return lista;
}
/*
 *funkcija koriscena za debagovanje
 *nema neku svrhu :)

void ispisi(cvor* lista){
	cvor* pom = lista;
	while(pom!=NULL){
		printf("%d %d\n", pom->vr, pom->indeks);
		pom=pom->sled;
	}
}
*/ 
int pretrazi(cvor* lista, int k){
	if (lista == NULL) return -1;

	cvor* pom = lista;
	while(pom!=NULL){
		if (pom->indeks == k) return pom->vr;
		pom=pom->sled;
	}
	return -1;
}

int poslednji(cvor* lista){
	cvor* pom = lista;
	while(pom->sled!=NULL) pom=pom->sled;

	return pom->vr;
		
}

int prvi(cvor* lista){
	return lista->vr;
}



