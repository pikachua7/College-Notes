def find_first(Non_Terminal,Terminal,Rules,First,NT):
    li=[]
    for i in Rules[NT]:
        li1=[]
        if i[0] in Terminal:
            li=li+[i[0]]
        elif i[0] in Non_Terminal:
            li1=li1+(find_first(Non_Terminal,Terminal,Rules,First,i[0]))
            k=1
            while ('0' in li1) and k<len(i):
                li1.remove('0')
                if i[k] in Terminal:
                    li1=li1+[i[k]]
                    break
                elif i[k] in Non_Terminal:
                    li1=li1+find_first(Non_Terminal,Terminal,Rules,First,i[k])
                k=k+1
        else :
            li1=li1+['0']
        li=li+li1
    return list(set(li))


def find_follow(Follow,First,Terminal,Non_Terminal,Rules):
    for i in Non_Terminal:
        for j in Rules[i]:
            l=len(j)
            for k in range(l):
                if j[k] in Non_Terminal:
                    if l==1:
                        Follow[j[k]]=Follow[j[k]]+Follow[i]
                    elif k+1==l:
                        Follow[j[k]]=Follow[j[k]]+Follow[i]
                    elif j[k+1] in Terminal:
                        Follow[j[k]]=list(set(Follow[j[k]]+[j[k+1]]))
                    elif j[k+1] in Non_Terminal:
                        m=k+2
                        li=First[j[k+1]]
                        while '0' in li and m<l:
                            if j[m] in Terminal :
                                li.remove('0')
                                li=li+[j[m]]
                                break
                            elif j[m] in Non_Terminal:
                                li=li+Follow[l[m]]
                                m=m+1
                        Follow[j[k]]=Follow[j[k]]+list(set(li))
    return Follow

#Driver Code
Non_Terminal,Terminal,Rules,First,Follow=list(),list(),dict(),dict(),dict()

# Input Non Terminal
print('Enter Non Terminals : ')
Non_Terminal=list(str(i) for i in input().split())
for x in Non_Terminal:
    Rules[x]=[]
    First[x]=[]
    Follow[x]=[]

# Input Terminal
print('Enter Terminals:')
Terminal=list(str(i) for i in input().split())

# Input Production Rules
print('Enter rules in format A : BC|D and 0 for null : ')
for _ in range(len(Non_Terminal)):
    rule=input().split(':')
    for i in rule[1].split('|'):
        Rules[rule[0].strip()].append(i.strip())

# Finding First
for NT,rule in Rules.items():
    First[NT]=find_first(Non_Terminal,Terminal,Rules,First,NT)

print('\n--------First Sets--------\n')
for k,v in First.items():
    print(k,' : ',set(v),'\n')
    
Follow[Non_Terminal[0]]=['$']
Follow=find_follow(Follow,First,Terminal,Non_Terminal,Rules)
print('\n--------Follow Sets--------\n')
for k,v in Follow.items():
    print(k,' : ',set(v),'\n')