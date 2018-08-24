CILJ = interpreter
CC = gcc
CFLAGS = -Wall

$(CILJ) : lex.yy.o y.tab.o lista.o
	$(CC) $(CFLAGS) -o $@ $^

y.tab.o : y.tab.c y.tab.h
	$(CC) $(CFLAGS) -c -o $@ $<

lex.yy.o : lex.yy.c y.tab.h
	$(CC) $(CFLAGS) -c -o $@ $<

y.tab.c y.tab.h : parser.y
	yacc -d $<

lex.yy.c : lexer.lex
	flex $<

lista.o : lista.c lista.h
	$(CC) $(CFLAGS) -c -o $@ $<

.PHNOY : clean

clean :
	rm *.o $(CILJ) y.tab.h y.tab.c lex.yy.c


