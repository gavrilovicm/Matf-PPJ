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
