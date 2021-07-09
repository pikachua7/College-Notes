print("Enter condition for while:")
wc=[]
wc.insert(0,input())
t=[]
n=int(input("No. of statements inside while:"))
s=0
start=100
addr=100
arr=[]
m1=start
t2=[]

if wc[0].find("and")!=-1:
    e=wc[0].split("and")
    exp=str(start)+": if "+str(e[0])+" goto "+str(start+2)
    t.append(exp)
    exp=str(start+1)+": goto EXIT"
    t.append(exp)
    start=start+2

    exp=str(start)+": if "+str(e[1])+" goto "+str(start+2)
    t.append(exp)
    exp=str(start+1)+": goto EXIT"
    t.append(exp)
    start=start+2

elif wc[0].find("or")!=-1:
    e=wc[0].split("or")
    exp=str(start)+": if "+str(e[0])+" goto "+str(start+4)
    t.append(exp)
    exp=str(start+1)+": goto "+str(start+2)
    t.append(exp)
    start=start+2

    exp=str(start)+": if "+str(e[1])+" goto "+str(start+2)
    t.append(exp)
    exp=str(start+1)+": goto "+" EXIT"
    t.append(exp)
    start=start+2

elif wc[0].find("not")!=-1:
    e=wc[0].split("not")
    t.append(str(start)+": if "+str(e[1])+" goto EXIT")
    t.append(str(start+1)+" goto "+str(start+2))
    start=start+2

else:
    exp='    '+str(start)+": if "+wc[0]+" goto "+str(start+2)
    t.append(exp)
    exp='    '+str(start+1)+": goto EXIT"
    t.append(exp)
    start=start+2

m2=start
s=len(t)
while s<20:
    print("Enter statements: ")
    for i in range(1,n+1):
        wc.append(input())
        arr=wc[i].split("=")
        exp='    '+str(start)+": T"+str(i)+"="+arr[1]
        t.append(exp)
        exp='    '+str(start+1)+": "+str(arr[0])+"="+"T"+str(i)
        t.append(exp)
        start=start+2
        s=len(t)
    s=20
    t.append('    '+str(start)+": EXIT")

print("-----------------------------------------")
print("THREE ADDRESS CODE =>")
print("-----------------------------------------")
for i in range(0,len(t)):
    print(t[i])
print("-----------------------------------------")

