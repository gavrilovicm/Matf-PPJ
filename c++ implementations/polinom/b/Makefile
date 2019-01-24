TARGET = polinom
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++14


$(TARGET) : lex.yy.o parser.tab.o poli.o
	$(CXX) $(CXXFLAGS) -o $@ $^

poli.o : poli.cpp poli.hpp
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
	rm parser.tab.* lex.yy.c lex.yy.o poli.o $(TARGET) *output*
