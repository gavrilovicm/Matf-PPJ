#include<iostream>
#include<iostream>
#include<vector>
#include<cstdlib>
#include<string>
#include<map>
#include"vektor.hpp"

Vektor::Vektor(){}

Vektor::Vektor(const std::vector<double>& v){
	m_vektor = v;
}
Vektor::Vektor(double& poc, double& kraj){
	m_vektor.push_back(poc);
	m_vektor.push_back(kraj);
}
//GETer 
Vektor Vektor::getvek(){
	return m_vektor;
}
void Vektor::dodaj(double k){
	m_vektor.push_back(k);
}
std::ostream& operator<<(std::ostream& out, const Vektor& v){
	if (v.m_vektor.size() == 0) {
		out << "[]" << std::endl;
		return out;
	}
	out << "[" << v.m_vektor[0] << ", " << v.m_vektor[1] << "]" << std::endl;
	return out;
}
void Vektor::pomnozi(const double& k){
	if (m_vektor.size() == 0){
		std::cout << "Vektor je prazan" << std::endl;
	}else{
		m_vektor[0] *= k;
		m_vektor[1] *= k;
	}
}
Vektor Vektor::operator+(const Vektor& v){
	if (this->m_vektor.size() == 0 ||
			v.m_vektor.size() == 0){
		std::cerr << " Ne moze se sabirati prazan(nedefinisan) vektor" << std::endl;
		exit(EXIT_FAILURE);
	}else{
		std::vector<double> pom(2);
		pom[0] = (this->m_vektor[0] + v.m_vektor[0]);
		pom[1] = (this->m_vektor[1] + v.m_vektor[1]);
		return Vektor(pom); //RVO :)
	}
}












