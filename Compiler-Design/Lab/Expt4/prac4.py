#Driver Code
Non_Terminal,Terminal,Rules,parse_table=list(),list(),dict(),dict()

# Input Non Terminal
print('Enter Non Terminals : ')
Non_Terminal=list(str(i) for i in input().split())
for x in Non_Terminal:
    Rules[x]=[]

# Input Terminal
print('Enter Terminals:')
Terminal=list(str(i) for i in input().split())+['$']

rule_index=[]
# Input Production Rules
print('Enter rules in format A : BC|D and 0 for null : ')
for _ in range(len(Non_Terminal)):
    rule=input().split(':')
    for i in rule[1].split('|'):
        Rules[rule[0].strip()].append(i.strip())
        rule_index.append((rule[0],i))

print(rule_index)

print('Enter Parsing Table state,NT/T:action/Goto (-1 to exit): ')
while(True):
    s=input()
    if s=='-1':
        break
    s=s.split(':')
    s1=s[0].split(',')
    parse_table[(s1[0],s1[1])]=s[1]


for i,j in parse_table.items():
    print(i,' -> ',j)

stack='00'
string=input('Enter string to validate : ')
buffer=string+'$'
result='0'
flag=True
print('Stack\tBuffer\tAction')
while result!='Accept':
    print(stack,end='\t')
    print(buffer,end='\t')
    try:
        result=parse_table[(stack[-2]+stack[-1],buffer[0])]
    except:
        flag=False
        break
    print(result)
    if result=='Accept':
        print('String Accepted')
    elif result[0]=='S':
        stack=stack+buffer[0]+'0'+result[1]
        buffer=buffer[1:]
    elif result[0]=='R':
        rule=rule_index[int(result[1:])-1]
        l=3*len(rule[1])
        stack=stack[:len(stack)-l]
        stack=stack+rule[0]
        stack=stack+parse_table[(stack[-3]+stack[-2],stack[-1])]
if flag==False:
    print('String is not Accepted.')