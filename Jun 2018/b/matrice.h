#ifndef MATRICE_H
#define MATRICE_H

#include<stdio.h>
#include<stdlib.h>



int* dodaj_elem_niz(int* niz, int k, int*vrste, int* brelem);

int** dodaj_u_matricu(int** mat, int* niz, int* kol, int* dim);

void ispisi(int** mat, int vrste, int kolone);

void oslobodi(int** mat, int broj);


#endif
