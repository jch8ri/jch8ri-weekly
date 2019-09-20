
all:test

lex.yy.c: test.l
	lex test.l

y.tab.c: test.y
	yacc -d test.y

test: lex.yy.c y.tab.c
	gcc -Wall lex.yy.c y.tab.c -o test
