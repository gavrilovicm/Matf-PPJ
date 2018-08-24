CILJ = vektor
CC = gcc
CFLAGS = -Wall 

$(CILJ) : y.tab.o lex.yy.o vektor.o
	$(CC) $(CFLAGS) -o $@ $^ -lm

lex.yy.o : lex.yy.c y.tab.h
	$(CC) $(CFLAGS) -c -o $@ $<

y.tab.o : y.tab.c y.tab.h
	$(CC) $(CFLAGS) -c -o $@ $<

vektor.o : vektor.c vektor.h
	$(CC) $(CFLAGS) -c -o $@ $<

lex.yy.c : lexer.lex
	flex $<

y.tab.c y.tab.h : parser.y
	yacc -d $<

.PHONY : clean
clean:
	rm *.o $(CILJ) y.tab.c y.tab.h lex.yy.c 


