#ifndef POLI_H
#define POLI_H
#include<iostream>
#include<string>
#include<vector>

class Polinom {
private:
	std::vector<double> m_coef;
	friend std::ostream& operator << (std::ostream& out, const Polinom& pol);

public:
	void dodaj_koef(const double& broj);

};

#endif
