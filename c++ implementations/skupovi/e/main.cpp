#include<iostream>
#include"skup.hpp"
#include<string.h>
#include<map>

int main(int argc, char** argv){
	(void)argc;
	(void)argv;
	
	int k = 5;
	Skup* s = new Skup(k);
	std::cout << *s << std::endl;
	
	
	return 0;
}

