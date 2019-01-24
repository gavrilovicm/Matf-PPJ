#include<iostream>
#include<vector>
#include<string.h>
#include<map>
#include<cstdlib>
#include"poli.hpp"


std::ostream& operator << (std::ostream& out, const Polinom& pol){
	for (unsigned i=0; i<pol.m_coef.size(); i++){
		if (pol.m_coef[i] > 0) {
			out << " +" << pol.m_coef[i] << "x^" << i;
		}else{
			out << " -" << pol.m_coef[i] << "x^" << i;
		}
	}
	return out;
}

void Polinom::dodaj_koef(const double& broj){

	if (broj!=0) m_coef.push_back(broj);
}
