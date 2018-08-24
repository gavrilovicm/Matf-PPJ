#ifndef LISTA_H
#define LISTA_H

typedef struct Cvor{
	int vr;
	int indeks;
	struct Cvor* sled;
}cvor;


cvor* novi(int vrednost, int indeks);

cvor* dodaj(cvor* lista,int vrednost, int* indeks);

int pretrazi(cvor* lista, int k);

//funkcija koriscena za debagovanje
//nema neku svrhu :)
//----------------------------
//void ispisi(cvor* lista);
//----------------------------

int poslednji(cvor* lista);

int prvi(cvor* lista);

#endif
