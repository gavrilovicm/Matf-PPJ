#include"kutije.hpp"


std::ostream& operator<<(std::ostream& out, Kutija& k){
	std::sort(k.m_koef.begin(), k.m_koef.end());
	out << "[";
	for (auto i=k.m_koef.begin(); i<k.m_koef.end(); i++)
		out << *i << " ";

	if (k.m_ima_podskup)  {
		out << '[';
		for (auto j=k.m_podskup.begin(); j!=k.m_podskup.end(); j++)
			out << *j << " " ;
		out << ']';
	}
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

	if ((m_koef.size() == (m_zapremina-1)) && (m_ima_podskup))
		return true;

	return false;
}
bool Kutija::prazna(){
	if ((m_koef.size() == 0) && (!m_ima_podskup))
		return true;

	return false;
}


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


void Kutija::dodaj_skup(const Kutija& k){
	if (m_ima_podskup) {
		std::cerr << "Vec postoji kutija unutar ove kutije.." << std::endl;
		exit(EXIT_FAILURE);
	}
	if (m_zapremina <= k.m_zapremina) {
		std::cerr << "Kutija mora biti strogo manje zapremine od one u koju se ubacuje" << std::endl;
		exit(EXIT_FAILURE);
	}
	m_ima_podskup = true;
	m_podskup = k.m_koef;
}

Kutija& Kutija::operator-(const Kutija& k){
	//pretpostavka je da je kutija koja se izbacuje dobro navedena
	//i sadrzi se u kutiji iz koje se izbacuje... :) 
	// TODO - odradicu proveru ispravnosti kasnije ako me ne bude mrzelo..
	m_ima_podskup = false;
	m_podskup.clear();

	return *this;
}



