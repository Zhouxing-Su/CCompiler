echo '---[ Executing the program ]---'
./bin/CCompiler ./TestCase ./TestCase/in.txt >./TestCase/out.txt

echo '---[ Displaying the output ]---'
gedit ./TestCase/out.txt &> /dev/null &
gedit ./TestCase/IR.imp &> /dev/null &
gedit ./TestCase/target.asm &> /dev/null &
