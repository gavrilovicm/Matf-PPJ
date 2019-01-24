TARGET = izraz
CXX = g++
CFLAGS = -Wall -Wextra -std=c++14

$(TARGET) : lex.yy.o parser.tab.o
	$(CXX) $(CFLAGS) -o $@ $^

lex.yy.o : lex.yy.c parser.tab.hpp
	$(CXX) $(CFLAGS) -c -o $@ $<

lex.yy.c : lexer.lex parser.tab.hpp
	flex $<

parser.tab.o : parser.tab.cpp parser.tab.hpp
	$(CXX) $(CFLAGS) -c -o $@ $<


parser.tab.cpp parser.tab.hpp : parser.ypp
	bison -v -d $<


.PHONY:clean

clean:
	rm *output* parser.tab.o parser.tab.hpp parser.tab.cpp lex.yy.o lex.yy.c $(TARGET)


