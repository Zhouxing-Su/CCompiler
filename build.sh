#echo "Generating code with report!"
#flex -v -o ./src/lex.yy.cpp src/lex.l
#bison -v -d -o ./src/yacc.tab.cpp src/yacc.y
#flex -v -o ./src/lex.ir.cpp src/ir.l
#bison -v -d -o ./src/yacc.ir.cpp src/ir.y

echo '******[ Generating code without report ]******'
flex -o ./src/lex.yy.cpp src/lex.l
bison -d -o ./src/yacc.tab.cpp src/yacc.y
flex -o ./src/lex.ir.cpp src/ir.l
bison -d -o ./src/ir.tab.cpp src/ir.y

echo '------[ Compiling code ]------'
g++ -std=c++0x -o ./bin/CCompiler ./src/*.cpp
