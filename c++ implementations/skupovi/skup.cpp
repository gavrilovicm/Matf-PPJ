#include<iostream>
#include<string>
#include<cstdlib>
#include<map>
#include<set>
#include<vector>
#include"skup.hpp"


std::ostream& operator << (std::ostream& out, const Skup& s){
	out << "{ " ;
	auto iter = s.m_set.begin();
	while (iter != s.m_set.end()){
		std::cout << *iter << " ";
		iter++;
	}
//	for (auto e : s.m_set){
//		out << e << ", " ;
//	}
	out << "}" << std::endl;

	return out;
}

Skup::Skup(int& num){
	m_set.insert(num);

}

void Skup::add(const int& m){
	m_set.insert(m);
}

Skup::Skup(){}

Skup::Skup(const std::set<int>& s)
	:m_set(s){};
