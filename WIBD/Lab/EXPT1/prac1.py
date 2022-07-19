from nltk.tokenize import word_tokenize
from nltk.corpus import stopwords
from nltk.stem import PorterStemmer

ps = PorterStemmer()


print("============================= PART-1 =========================================")
def readfile(filename,dict,cnt,dict_for_cnt):
    #reading filename
    file = open(filename, encoding='utf8')
    read = file.read() #extracting the file contents
    file.seek(0)  #pointer from where the data has to be written/read
    line = 1 #line number
    for word in read: #extracting each word from the file contents
        if word == '\n': #if new line occurs increment the line
            line += 1 
    array = []
    for i in range(line):
        array.append(file.readline()) #appending every line in an array
    
    #1.REMOVE PUNCTUATIONS
    punc = '''!()-[]{};:'"\, <>./?@#$%^&*_~''' #string of punctuations
    #checking whether there is any punctuation present,if any then replacing it with a space
    for ele in read:  
        if ele in punc:  
            read = read.replace(ele, " ")
    read=read.lower() #doing all elements lowercase

    #2.REMOVING STOPWORDS
    for i in range(1):
        text_tokens = word_tokenize(read)  #tokenizing every word ex -> form becomes 'form'
  
    tokens_without_sw = [word for word in text_tokens if not word in stopwords.words()] #list of tokenized words without stopwords
  
    #3. STORING IN DICTIONARY
    for i in range(line):
        check = array[i].lower()
        for w in tokens_without_sw:
            # print(dict_for_cnt)
            if w in check:
                item=ps.stem(w)     #This line gives us the root word for the current word 
                if item not in dict:
                    dict[item] = [] #creating a list for storing count if the word is not present in dict

                if item in dict:
                    dict[item].append(cnt) #appending the file number where the word is present
                    dict[item]=list(set(dict[item]))#using set so that if any word is present multiple times in a file 
                                                    #then it is not written multiple times
                
                #Part-3
                if (item,cnt) not in dict_for_cnt:
                    dict_for_cnt[(item,cnt)]=0

                if (item,cnt) in dict_for_cnt:
                    dict_for_cnt[(item,cnt)]+=1

#DRIVER CODE
dict={} #dictionary for storing the file numbers
dict_for_cnt ={} #dict for part3
for i in range(1,11):
    readfile('text'+str(i)+'.txt',dict,i,dict_for_cnt) #reading each file once

#Displaying all the words along with there occurence in which file
for word,list_of_files in dict.items():
    print(word,' : ',list_of_files)

print("============================= PART-2 =========================================")
query = input("Enter String to be searched : ")
qword = query.split()
qwords=[]
for q in qword:
    qroot=ps.stem(q) #getting the root word for the current word
    if qroot not in qwords:
        qwords.append(qroot)  #appending the root words


#Displaying in which file the string is present
word_list=[]  #list for displaying part 3 
for q in qword:
    word=ps.stem(q) #taking out the root word for the current word
    for doc_id in dict[word]: 
        word_list.append((dict_for_cnt[(word,doc_id)],doc_id,q)) #appending for every doc_id the count the word appears in the doc
    


print("============================= PART-3 =========================================")
word_list.sort(reverse=True)
for word in word_list:
    print(word[2],'appears',word[0],'times in file number =>',word[1])
