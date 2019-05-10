#include "razlomak.hpp"

int nzd(int a, int b);

Razlomak::Razlomak(int _brojilac, int _imenilac){
	if (_imenilac == 0){
		std::cerr << "Nije dozvoljeno pravljenje razlomaka sa nulom" << std::endl;
		exit(EXIT_FAILURE);
	}
	int delilac = nzd(std::max(_brojilac, _imenilac), std::min(_brojilac, _imenilac));
	m_brojilac = _brojilac / delilac;
	m_imenilac = _imenilac / delilac;
}

std::ostream& operator << (std::ostream& out, Razlomak& r){
	if (r.getImenilac() == 1 || r.getImenilac() == -1){
		out << '[' << r.getBrojilac() << ']' << std::endl;
	}else{
		out << '[' << r.getBrojilac() << ", " << r.getImenilac() << ']' << std::endl;
	}
	return out;
}

Razlomak* Razlomak::operator + (Razlomak& drugi){
	int zajednicki, brojilac;

	zajednicki = this->getImenilac() * drugi.getImenilac();
	brojilac = this->getBrojilac()*drugi.getImenilac() + drugi.getBrojilac()*this->getImenilac();

	int delilac = nzd(zajednicki, brojilac);
	zajednicki /= delilac;
	brojilac /= delilac;

	return new Razlomak(brojilac, zajednicki);
}

Razlomak* Razlomak::operator - (Razlomak& drugi){
	int zajednicki, brojilac;

	zajednicki = this->getImenilac() * drugi.getImenilac();
	brojilac = this->getBrojilac()*drugi.getImenilac() - drugi.getBrojilac()*this->getImenilac();

	std::cout << zajednicki << brojilac << std::endl;

	int delilac = nzd(zajednicki, brojilac);
	zajednicki /= delilac;
	brojilac /= delilac;
	return new Razlomak(brojilac, zajednicki);
}

Razlomak* Razlomak::operator * (Razlomak& drugi){
	int brojilac = this->getBrojilac() * drugi.getBrojilac();
	int imenilac = this->getImenilac() * drugi.getImenilac();
	int delilac = nzd(imenilac , brojilac);
	imenilac /= delilac;
	brojilac /= delilac;
	return new Razlomak(brojilac, imenilac);
}
Razlomak* Razlomak::operator / (Razlomak& drugi){
	if (drugi.getBrojilac() == 0){
		std::cerr << "Ne moze se deliti nulom." << std::endl;
		exit(EXIT_FAILURE);
	}else{
		int brojilac = this->getBrojilac() * drugi.getImenilac();
		int imenilac = this->getImenilac() * drugi.getBrojilac();
		int delilac = nzd(imenilac , brojilac);
		imenilac /= delilac;
		brojilac /= delilac;
		return new Razlomak(brojilac, imenilac);
	}
}

int Razlomak::getBrojilac(){
	return this->m_brojilac;
}

int Razlomak::getImenilac(){
	return this->m_imenilac;
}


int nzd(int a, int b){
	if (b == 0){
		return a;
	}else{
		return std::abs(nzd(b, a % b));
	}
}

