#ifndef MATRICE_H
#define MATRICE_H

#include<stdio.h>
#include<stdlib.h>



int* dodaj_elem_niz(int* niz, int k, int*vrste, int* brelem);

int** dodaj_u_matricu(int** mat, int* niz, int* kol, int* dim);

void ispisi(int** mat, int vrste, int kolone);

void oslobodi(int** mat, int broj);

int** pokoordinatno_mnozenje(int** m1, int** m2, int kolone, int vrste);

int** pokoordinatno_sabiranje(int** m1, int** m2, int kolone, int vrste);

int** mnozenje(int** m1, int** m2, int vp, int kp, int vd, int kd);

int** transponuj(int** mat, int vrste, int kolone);


#endif
