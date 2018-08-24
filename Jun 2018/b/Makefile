CILJ = matlab
CC = gcc
CFLAGS = -Wall 

$(CILJ) : y.tab.o lex.yy.o matrice.o
	$(CC) $(CFLAGS) -o $@ $^

y.tab.o : y.tab.c y.tab.h
	$(CC) $(CFLAGS) -c -o $@ $<

lex.yy.o : lex.yy.c y.tab.h
	$(CC) $(CFLAGS) -c -o $@ $<

lex.yy.c : lexer.lex
	flex $<

matrice.o : matrice.c matrice.h
	$(CC) $(CFLAGS) -c -o $@ $<


y.tab.c y.tab.h : parser.y
	yacc -d $<

.PHONY : clean

clean:
	rm *.o $(CILJ) y.tab.h y.tab.c lex.yy.c

