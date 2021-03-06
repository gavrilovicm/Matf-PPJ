#ifndef MAT_HPP
#define MAT_HPP
#include<iostream>
#include<cstdlib>
#include<vector>


class Matrica {
private:
	std::vector<std::vector<int>> m_matrica;
public:
	Matrica(){};
	Matrica(std::vector<std::vector<int>> m);
	Matrica* dodaj_vrstu(std::vector<int> vrsta);
	std::vector<std::vector<int>> getMatrica();
	void velicina();

	friend std::ostream& operator << (std::ostream& out, Matrica& m);
};


#endif
