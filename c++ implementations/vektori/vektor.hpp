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

private:
	std::vector<double> m_vektor;

};


#endif //VEKTOR_HPP
