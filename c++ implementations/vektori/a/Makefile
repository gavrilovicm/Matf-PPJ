TARGET = vektor
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++14


$(TARGET) : lex.yy.o parser.tab.o vektor.o
	$(CXX) $(CXXFLAGS) -o $@ $^

vektor.o : vektor.cpp vektor.hpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

lex.yy.o : lex.yy.c parser.tab.hpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

lex.yy.c : lexer.lex parser.tab.hpp
	flex $<

parser.tab.o : parser.tab.cpp parser.tab.hpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

parser.tab.cpp parser.tab.hpp : parser.ypp
	bison -vd $<


.PHONY:clean

clean:
	rm *.o lex.yy.c parser.tab.* *output* $(TARGET) 

