make_dparser epsilon.g 
cc -I/usr/local/include epsilon.c epsilon.g.d_parser.c -L/usr/local/lib -ldparse

for j in {1..10}
do
./a.out ../../../source/epsilon/${j}00k.epsilon
done
