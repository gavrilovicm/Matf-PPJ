#ifndef SKUP_HPP
#define SKUP_HPP
#include<iostream>
#include<string>
#include<cstdlib>
#include<map>
#include<set>
#include<vector>

class Skup{
public:
	
	Skup(int& num);
	Skup(const std::set<int>& s);
	Skup();
	void add(const int& m);

	friend std::ostream& operator << (std::ostream& out, const Skup& s);
private:
	std::set<int> m_set;

};






#endif // SKUP_HPP
