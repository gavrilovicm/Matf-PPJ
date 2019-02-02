#include"kutije.hpp"


std::ostream& operator<<(std::ostream& out, Kutija& k){
	out << "[";
	for (auto i=k.m_koef.begin(); i<k.m_koef.end(); i++)
		out << *i << " ";
	out << "]";
	return out;
}

Kutija::Kutija(){}
Kutija::Kutija(double& k){
	m_koef.push_back(k);
}
Kutija::Kutija(int& k){
	m_koef.push_back(k);
}
void Kutija::dodaj(const int& k){
	if (m_zapremina == m_koef.size()) 
		std::cout << "Kutija je puna, ne moze da stane vise elemenata.." << std::endl;
	else {
		m_koef.push_back(k);
	}
}

bool Kutija::puna(){
	if ((m_koef.size() == m_zapremina))
		return true;

	if (m_koef.size() == (m_zapremina-1) && (m_ima_podskup))
		return true;

	return false;
}
bool Kutija::prazna(){
	if ((m_koef.size() == 0) && (!m_ima_podskup))
		return true;

	return false;
}

//Kutija& Kutija::operator+(const Kutija& k){
//	
//}

void Kutija::setZapremina(const int& z){
	m_zapremina = z;
}

void Kutija::dodaj(const double& k){
	if (m_zapremina == m_koef.size()) 
		std::cout << "Kutija je puna, ne moze da stane vise elemenata.." << std::endl;
	else {
		m_koef.push_back(k);
		m_zapremina++;
	}
}
