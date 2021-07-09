#Atharva Paliwal
def transposition(msg,rows,cols):             #Encryption and Decryption Function
    k=0
    arr = [[0]*cols for j in range(rows)]  #matrix initialisation
    for i in range(rows):
        for j in range(cols):
            if k>=len(msg):      #if matrix size exceeds length of message
                arr[i][j]=' '    #giving spaces
                continue
            arr[i][j]=msg[k]
            k=k+1
    print('Matrix :')            #printing matrix
    for i in range(rows):
        print(*arr[i])
    newmsg=''
    for i in range(cols):        #adding message columnwise
        for j in range(rows):
            newmsg=newmsg+arr[j][i]
    return newmsg

#Driver Code
msg=input('Enter Your Message : ')
rows, cols =map(int,input('Enter size of row and column : ').split())
encrmsg=transposition(msg,rows,cols)
print('Encrepted Message:',encrmsg)
decrprmsg=transposition(encrmsg,cols,rows)
print('Decrepted Message:',decrprmsg)