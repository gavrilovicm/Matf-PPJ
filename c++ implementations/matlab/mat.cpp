#include"mat.hpp"

std::ostream& operator << (std::ostream& out, Matrica& m){
	std::vector<std::vector<int>> mat = m.getMatrica();
	if (mat.size() == 1){
		unsigned i;
		out << "[";
		for (i=0; i<mat[0].size() - 1; i++){
			out << mat[0][i] << ",";
		}
		out << mat[0][i] << "]" << std::endl;
	}else{
		unsigned i, j;
		out << "[";
		for (i=0; i<mat.size()-1; ++i){
			out << "[";
			for (j=0; j<mat[i].size()-1; ++j){
				out << mat[i][j] << ", ";
			}
			out << mat[i][j] << "], ";
		}
		out << "[";
		for (j=0; j<mat[i].size()-1; ++j){
			out << mat[i][j] << ", ";
		}
		out << mat[i][j] << "]";
		out << "]" << std::endl;
	}
	return out;
}
Matrica* Matrica::dodaj_vrstu(std::vector<int> vrsta){
	this->m_matrica.push_back(vrsta);
	return this;
}
std::vector<std::vector<int>> Matrica::getMatrica(){
	return this->m_matrica;
}
Matrica::Matrica(std::vector<std::vector<int>> m){
	m_matrica = m;
}

void Matrica::velicina(){
	std::cout << m_matrica.size() << "x" << m_matrica[0].size() << std::endl;
}

Matrica* Matrica::pomnozi(Matrica m1, Matrica m2){

	std::vector<std::vector<int>> mat1, mat2, nova;
	mat1 = m1.getMatrica();
	mat2 = m2.getMatrica();

	for (unsigned i=0; i<mat1.size(); i++){
		std::vector<int> vrsta;
		for (unsigned j=0; j<mat1[i].size(); j++){
			vrsta.push_back(mat1[i][j] * mat2[i][j]);
		}
		nova.push_back(vrsta);
	}
	return new Matrica(nova);
}

Matrica* Matrica::saberi(Matrica m1, Matrica m2){

	std::vector<std::vector<int>> mat1, mat2, nova;
	mat1 = m1.getMatrica();
	mat2 = m2.getMatrica();

	for (unsigned i=0; i<mat1.size(); i++){
		std::vector<int> vrsta;
		for (unsigned j=0; j<mat1[i].size(); j++){
			vrsta.push_back(mat1[i][j] + mat2[i][j]);
		}
		nova.push_back(vrsta);
	}
	return new Matrica(nova);
}
Matrica* Matrica::pomnozi1(Matrica M){
	std::vector<std::vector<int>> nova, mat1, mat2;
	mat1 = this->getMatrica();
	mat2 = M.getMatrica();
	unsigned n = mat2.size();
	unsigned m = mat2[0].size();


	for (unsigned l = 0; l<mat1.size(); ++l){
		std::vector<int> nova_prim;
		for (unsigned i=0; i<m; ++i){
			int prom = 0;
			for (unsigned j=0; j<n; ++j){
				prom += mat1[l][j] * mat2[j][i];
			}
			nova_prim.push_back(prom);
		}
		nova.push_back(nova_prim);
	}

	return new Matrica(nova);
}
Matrica* Matrica::transponuj(){
	std::vector<std::vector<int>> nova, pom;

	pom = this->getMatrica();
	unsigned int n = pom.size();
	unsigned int m = pom[0].size();

	for (unsigned i=0; i<n; i++){
		std::vector<int> p;
		for (unsigned j=0; j<m; j++){
			p.push_back(pom[j][i]);
		}
		nova.push_back(p);
	}
	return new Matrica(nova);
}
