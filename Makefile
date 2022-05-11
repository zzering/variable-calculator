cc = gcc
ccopts = -ly
lex = lex
lexopts =
lexgens = lex.yy.c
yacc = yacc
yaccopts = -d
yaccgens = y.tab.c y.tab.h
ydot=*.dot
TARGET = calc

$(TARGET): $(lexgens) $(yaccgens)
	$(cc) -g $(lexgens) $(yaccgens) $(ccopts) -o $(TARGET)
	@echo "Build completed successfully"

clean:
	rm $(lexgens) $(yaccgens) $(TARGET) $(ydot)
	@echo "Clean completed successfully"

$(yaccgens): $(TARGET).y sym.h
	$(yacc) -g $(yaccopts) $(TARGET).y

$(lexgens): $(TARGET).l $(yaccgens) sym.h
	$(lex) $(lexopts) $(TARGET).l
