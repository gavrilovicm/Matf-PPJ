#ifndef KUTIJE_HPP
#define KUTIJE_HPP

#include<iostream>
#include<vector>
#include<map>
#include<cstdlib>
#include<string>
#include<algorithm>


class Kutija{
private:
	std::vector<double> m_koef;
	unsigned m_zapremina;
	bool m_ima_podskup;
	std::vector<double> m_podskup;

public:
	friend std::ostream& operator<<(std::ostream& out, Kutija& k);
	Kutija();
	Kutija(double& k);
	Kutija(int& k);
	Kutija& operator-(const Kutija& k);
	void dodaj(const double& d);
	void dodaj(const int& d);
	void dodaj_skup(const Kutija& k);
	bool puna();
	bool prazna();
	void setZapremina(const int& z);


};




#endif //KUTIJE_HPP
