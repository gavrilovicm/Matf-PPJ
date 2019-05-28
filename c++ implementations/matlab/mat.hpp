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
	static Matrica* pomnozi(Matrica m1, Matrica m2);
	static Matrica* saberi(Matrica m1, Matrica m2);
	Matrica* pomnozi1(Matrica m1);

	friend std::ostream& operator << (std::ostream& out, Matrica& m);
};


#endif
