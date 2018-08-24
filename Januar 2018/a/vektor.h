#ifndef VEKTOR_H
#define VEKTOR_H

#include<stdio.h>
#include<stdlib.h>
#include<string.h>

typedef struct Cvor{
	double vrednost;
	struct Cvor* sled;
}cvor;

cvor* dodaj_na_kraj(cvor* lista, double n);

cvor* novi(double n);

void ispisi(cvor* lista);



#endif
