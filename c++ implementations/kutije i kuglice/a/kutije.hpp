#ifndef KUTIJE_HPP
#define KUTIJE_HPP

#include<iostream>
#include<vector>
#include<map>
#include<cstdlib>
#include<string>


class Kutija{
private:
	std::vector<double> m_koef;
	unsigned m_zapremina;
	bool m_ima_podskup;

public:
	friend std::ostream& operator<<(std::ostream& out, Kutija& k);
	Kutija();
	Kutija(double& k);
	Kutija(int& k);
	Kutija& operator+(const Kutija& k);
	void dodaj(const double& d);
	void dodaj(const int& d);
	bool puna();
	bool prazna();
	void setZapremina(const int& z);


};




#endif //KUTIJE_HPP
