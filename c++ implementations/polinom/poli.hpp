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
	std::vector<double>& coefs();
	void dodaj_koef(const double& broj);
	Polinom operator+(const Polinom& p);
	Polinom operator-(const Polinom& p);
	Polinom operator*(const Polinom& p);
	bool operator==(const Polinom& p);
	bool operator!=(const Polinom& p);
	double operator [](const double& num);
	Polinom* izvod() const;
	Polinom* integral(const double& num) const;
	Polinom();
	Polinom(std::vector<double>& p);
	unsigned power() const;
	void promeni_znak();

};

#endif
