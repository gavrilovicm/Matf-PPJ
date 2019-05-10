#ifndef RAZLOMAK_HPP
#define RAZLOMAK_HPP

#include<iostream>

class Razlomak {
private:
	int m_brojilac;
	int m_imenilac;
public:
	int getBrojilac();
	int getImenilac();

	Razlomak(int _brojilac, int _imenilac);
	Razlomak* operator + (Razlomak& drugi);
	Razlomak* operator - (Razlomak& drugi);
	Razlomak* operator * (Razlomak& drugi);
	Razlomak* operator / (Razlomak& drugi);

	friend std::ostream& operator << (std::ostream& out, Razlomak& r);
};
#endif
