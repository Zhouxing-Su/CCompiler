# makefile for CCompiler. 

VPATH = src:obj

all : CCompiler 

CCompiler :	main.o  CodeGenerator.o  FileWraper.o  ir.tab.o \
			lex.ir.o  lex.yy.o  Symbol.o  SymbolTable.o  yacc.tab.o
	g++ -std=c++11 -o bin/CCompiler  obj/*.o

	main.o : src/main.cpp \
		src/FileWraper.h  src/Log.h  src/SymbolTable.h  src/Symbol.h  src/CodeGenerator.h
		g++ -std=c++11 -c -o ./obj/main.o src/main.cpp

    CodeGenerator.o : src/CodeGenerator.cpp \
		src/CodeGenerator.h  src/Symbol.h  src/SymbolTable.h  src/Log.h
		g++ -std=c++11 -c -o ./obj/CodeGenerator.o src/CodeGenerator.cpp

	FileWraper.o : src/FileWraper.cpp \
		src/FileWraper.h
		g++ -std=c++11 -c -o ./obj/FileWraper.o src/FileWraper.cpp

	ir.tab.o : src/ir.tab.cpp \
		src/ir.tab.hpp
		g++ -std=c++11 -c -o ./obj/ir.tab.o src/ir.tab.cpp

	lex.ir.o : src/lex.ir.cpp \
		src/ir.tab.hpp
		g++ -std=c++11 -c -o ./obj/lex.ir.o src/lex.ir.cpp

	lex.yy.o : src/lex.yy.cpp \
		src/FileWraper.h  src/SymbolTable.h  src/Symbol.h  src/yacc.tab.hpp  src/Log.h
		g++ -std=c++11 -c -o ./obj/lex.yy.o src/lex.yy.cpp

	Symbol.o : src/Symbol.cpp \
		src/SymbolTable.h  src/Symbol.h
		g++ -std=c++11 -c -o ./obj/Symbol.o src/Symbol.cpp

	SymbolTable.o : src/SymbolTable.cpp \
		src/SymbolTable.h  src/Symbol.h
		g++ -std=c++11 -c -o ./obj/SymbolTable.o src/SymbolTable.cpp

	yacc.tab.o : src/yacc.tab.cpp \
		src/SymbolTable.h  src/Symbol.h  src/FileWraper.h  src/CodeGenerator.h  src/Log.h  src/yacc.tab.hpp
		g++ -std=c++11 -c -o ./obj/yacc.tab.o src/yacc.tab.cpp
	
	src/lex.yy.cpp : src/lex.l 
		flex -o ./src/lex.yy.cpp src/lex.l
		
	src/yacc.tab.cpp : src/yacc.tab.cpp
		bison -d -o ./src/yacc.tab.cpp src/yacc.y

	src/lex.ir.cpp : src/ir.l
		flex -o ./src/lex.ir.cpp src/ir.l

	src/ir.tab.cpp : src/ir.y 
		bison -d -o ./src/ir.tab.cpp src/ir.y

	.PHONY : clean
    clean : 
		-rm obj/*.o 
