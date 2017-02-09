#config:utf-8
f = open("./epsilon.sablecc","w")

for line in open("./file1.txt","r"):
    f.write(line)

for x in range(0,100):
    index = "";
    if(x in range(0,10)):
        index = "{x}".format(x=x)
    else:
        index = x;
    f.write  ("else{i} =  \'else{i}\'; ".format(i=index))
    f.write('\n')

for line in open("./file2.txt","r"):
    f.write(line)

for x in range(0,100):
    index = "";
    if(x in range(0,10)):
        index = "{x}".format(x=x)
    else:
        index = x;
    f.write  ("| {{if{i}}} if left_paren expression right_paren [b1]:block \'else{i}\'[b2]:block ".format(i=index))
    f.write('\n')

for line in open("./file3.txt","r"):
    f.write(line)

f.close()
