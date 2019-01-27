#ifndef VEKTOR_HPP
#define VEKTOR_HPP
#include<iostream>
#include<vector>
#include<cstdlib>
#include<string>
#include<map>



class Vektor{
public:
	Vektor();
	Vektor(const std::vector<double>& v);
	Vektor(double& poc, double& kraj);
	Vektor getvek();
	friend std::ostream& operator<<(std::ostream& out, const Vektor& v);
	Vektor operator+(const Vektor& v);
	void pomnozi(const double& k);
	void dodaj(double k);

private:
	std::vector<double> m_vektor;

};


#endif //VEKTOR_HPP
