def char_stuff(msg,flg):   ## Charachter Stuffing
    stf_msg=flg #initialising first char as flag
    for i in range(len(msg)):
        if msg[i]==flg:
            stf_msg=stf_msg+flg
        stf_msg=stf_msg+msg[i]
    stf_msg=stf_msg+flg
    return(stf_msg)			##return the msg with stuffed char

def char_destuff(stf_msg,flg):  ## Charachter De-stuffing
    destf_msg=''
    key=0
    stf_msg=stf_msg[1:len(stf_msg)-1]
    for i in stf_msg:
        if i==flg and key==0:
            key=1
            continue
        if i==flg:
            key=0
        destf_msg=destf_msg+i
    return(destf_msg)   ##return the msg with destuffed char
	

#Driver Code
msg=input('Enter Your Message : ')
flg=input('Enter the flag Character : ')
stf_msg=char_stuff(msg,flg)
print('Message after character stuffing : ',stf_msg)
destf_msg=char_destuff(stf_msg,flg)
print('Message after character destuffing : ',destf_msg)

