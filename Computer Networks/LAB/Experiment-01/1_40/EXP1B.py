#Atharva Paliwal
#function for finding index of required text
def find(bit_map,k):
	for i in range(len(bit_map)):
		if k==bit_map[i]:
			return i

#function for encryption
def encrpt(msg,key):
    #Initialising a list of alphabets,numbers and space 
	bit_map=list(chr(i)for i in range(65,91))+list(chr(i)for i in range(97,123))+list(str(i)for i in range(0,10))+[' ']
	key=key*(len(msg)//len(key)+1)  #increasing key length if key length is smaller
	encr_msg=''
	for i in range(len(msg)):
        #modulo addition of message with key
		encr_msg=encr_msg+bit_map[(find(bit_map,msg[i])+find(bit_map,key[i]))%63]
	return encr_msg

#function for decryption
def decrpt(msg,key):
    bit_map=list(chr(i)for i in range(65,91))+list(chr(i)for i in range(97,123))+list(str(i)for i in range(0,10))+[' ']
    key=key*(len(msg)//len(key)+1)
    decr_msg=''
    for i in range(len(msg)):
        #subtraction of encrypted msg and key
        k=find(bit_map,msg[i])-find(bit_map,key[i])
        k=k+[0,63][k<0]  #if difference is negative adding 63
        decr_msg=decr_msg+bit_map[k]
    return decr_msg


#Driver Code
msg=input('Enter Your Message : ')
key=input('Enter the Key : ')
encr_msg=encrpt(msg,key)
print('Cipher Text : ',encr_msg)
decr_msg=decrpt(encr_msg,key)
print('Decrpt Text : ',decr_msg)

