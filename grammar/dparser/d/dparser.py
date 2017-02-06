#config:utf-8
f = open("./epsilon.g","w")

for line in open("./header.txt","r"):
    f.write(line)

for x in range(0,0):
    index = "";
    if(x in range(0,10)):
        index = "0{x}".format(x=x)
    else:
        index = x;
    f.write  ("|  \'if\' \'(\' expression \')\' block ( \'else{i}\' block ) ".format(i=index))
    f.write('\n')

for line in open("./footer.txt","r"):
    f.write(line)

f.close()
