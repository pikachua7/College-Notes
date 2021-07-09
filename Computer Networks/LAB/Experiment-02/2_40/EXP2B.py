def createBitString(message):		##to create bit sequence from a string
	bit_string = ''
	for c in message:
		#In order to balance the sequence of 7 , '0' bit is added if ascii value < 64 
		if ord(c) < 64:			
			bit_string += '0'
        #format() function returns 6-bit binary sequence if ascii value is less than 64.
		bit_string += ''.join(format(ord(c),'b'))
	return bit_string
	
def createAsciiString(bit_string):	##to create string from a bit sequence
	result = ''
	for i in range(0,len(bit_string),7):
		c = chr(int(bit_string[i:i+7], 2))
		result += c
	#print(result)
	return result
	
def stuffBit(message):		#to stuff bit as an esc bit where ever needed
	msg = list(message)
	count = 0
	i = 0
	while i != len(msg):
		if msg[i] == '1':
			count += 1
		else : count = 0
		if count == 5:
			msg.insert(i+1,'0')
			count = 0
		i += 1
		
	return (''.join(msg))

def destuffBit(message):	#to destuff the stuffed bits
	msg = list(message)
	count = 0
	i = 0
	while i != len(msg):
		if msg[i] == '1':
			count += 1
		else : count = 0
		if count == 5:
			msg.pop(i+1)
			count = 0
		i += 1
		
	return (''.join(msg))


#Driver Code

message = input('Input Data to send: ')
bit_string = createBitString(message)
print('Bit String: '+bit_string+'\n')
stuffed_bit_msg = stuffBit(bit_string)
print('Bit String after Bit Stuffing: '+stuffed_bit_msg+'\n')
print('Data after Bit Stuffng:',createAsciiString(stuffed_bit_msg))
destuffed_bit_msg = destuffBit(stuffed_bit_msg)
print('Bit String after Bit destuffing: '+destuffed_bit_msg+'\n')
print('Data after De-stuffing:',createAsciiString(destuffed_bit_msg))

 