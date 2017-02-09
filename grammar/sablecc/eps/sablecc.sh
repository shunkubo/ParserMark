java -jar sablecc.jar ./epsilon.sablecc
javac ./epsilon/Compiler.java
for j in {1..10}
do
java epsilon.Compiler ../../../source/epsilon/${j}00k.epsilon
done
