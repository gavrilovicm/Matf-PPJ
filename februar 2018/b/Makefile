CILJ = interpreter
CC = gcc
CFLAGS = -Wall

$(CILJ) : lex.yy.o y.tab.o
	$(CC) $(CFLAGS) -o $@ $^

y.tab.o : y.tab.c y.tab.h
	$(CC) $(CFLAGS) -c -o $@ $<

lex.yy.o : lex.yy.c y.tab.h
	$(CC) $(CFLAGS) -c -o $@ $<

y.tab.c y.tab.h : parser.y
	yacc -d $<

lex.yy.c : lexer.lex
	flex $<

.PHNOY : clean

clean :
	rm *.o $(CILJ) y.tab.h y.tab.c lex.yy.c


