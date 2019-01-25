#include<iostream>
#include<vector>
#include<string.h>
#include<map>
#include<cstdlib>
#include"poli.hpp"


std::vector<double>& Polinom::coefs(){
	return m_coef;
}
std::ostream& operator << (std::ostream& out, const Polinom& pol){
	for (unsigned i=0; i<pol.m_coef.size(); i++){
		if (pol.m_coef[i] > 0) {
			out << " +" << pol.m_coef[i] << "x^" << i;
		}else if (pol.m_coef[i] < 0){
			out << " " << pol.m_coef[i] << "x^" << i;
		}else{
			//kada je jednak nuli ne ispisujemo ga :) 
		}
	}
	return out;
}

void Polinom::dodaj_koef(const double& broj){

	if (broj!=0) m_coef.push_back(broj);
}
Polinom Polinom::operator+(const Polinom& p){
	unsigned max = std::max(this->power(), p.power()); 
	std::vector<double> k(max + 1);

	for (unsigned i=0; i< k.size(); i++)
		if (i <= this->power() && i <= p.power()){
			k[i] = (this->m_coef[i] + p.m_coef[i]);
		}else if (i <= this->power()){
			k[i] = (this->m_coef[i]);
		}else if (i <= p.power()){
			k[i] = (p.m_coef[i]);
		}else{
			k[i] = 0;
		}
	return Polinom(k);
}
Polinom Polinom::operator-(const Polinom& p){
	unsigned max = std::max(this->power(), p.power()); 
	std::vector<double> k(max + 1);

	for (unsigned i=0; i< k.size(); i++)
		if (i <= this->power() && i <= p.power()){
			k[i] = (this->m_coef[i] - p.m_coef[i]);
		}else if (i <= this->power()){
			k[i] = (this->m_coef[i]);
		}else if (i <= p.power()){
			k[i] = -(p.m_coef[i]);
		}else{
			k[i] = 0;
		}
	return Polinom(k);
}
unsigned Polinom::power() const{
	if (m_coef.empty())
		return 0;
	else
		return m_coef.size()-1;
}
void Polinom::promeni_znak(){
	for (auto i=this->m_coef.begin(); i!=this->m_coef.end(); i++){
		*i = - *i;
	}
}

Polinom Polinom::operator*(const Polinom& p){
	std::vector<double> k(this->power() + p.power() + 1);

	for (unsigned i=0; i < this->m_coef.size(); i++){
		for (unsigned j=0; j < p.m_coef.size(); j++){
			k[i+j] += (this->m_coef[i] * p.m_coef[j]);
		}
	}
	
	return Polinom(k);
}

bool Polinom::operator==(const Polinom& p){
	std::cout << "pre" << std::endl;
	if (this->m_coef.size() != p.m_coef.size()) return false;
	std::cout << "posle" << std::endl;

	for (unsigned i=0; i<p.m_coef.size(); i++){
		if (this->m_coef[i] != p.m_coef[i]) return false; 
	}
	return true;
}

bool Polinom::operator!=(const Polinom& p){
	return !(*this == p);
}
Polinom::Polinom(std::vector<double>& p)
	: m_coef(p){}

Polinom::Polinom(){

}
