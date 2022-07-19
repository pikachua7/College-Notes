import pandas as pd
import math

with open('text1.txt') as f:
    first1 = f.read()
with open('text2.txt') as s:
    second1 = s.read()
with open('text3.txt') as t:
    third1 = t.read()
first1=first1.split(" ")
second1=second1.split(" ")
third1=third1.split(" ")
total= set(first1).union(set(second1)).union(set(third1))
# print(total)

wordDictA = dict.fromkeys(total, 0) 
wordDictB = dict.fromkeys(total, 0)
wordDictC = dict.fromkeys(total, 0)

for word in first1:
    wordDictA[word]+=1
    
for word in second1:
    wordDictB[word]+=1

for word in third1:
    wordDictC[word]+=1

pd.DataFrame([wordDictA, wordDictB, wordDictC])


# import nltk
# nltk.download('stopwords')
from nltk.corpus import stopwords
stop_words = set(stopwords.words('english'))
filtered_sentence = [w for w in wordDictA if not w in stop_words]
# print(filtered_sentence)

def computeIDF(docList):
    idfDict = {}
    N = len(docList)
    
    idfDict = dict.fromkeys(docList[0].keys(), 0)
    for word, val in idfDict.items():
        idfDict[word] = math.log10(N / (float(val) + 1))
        
    return(idfDict)

#inputing our sentences in the log file
idfs = computeIDF([wordDictA, wordDictB, wordDictC])

def computeTFIDF(tfBow, idfs):
    tfidf = {}
    for word, val in tfBow.items():
        tfidf[word] = val*idfs[word]
    return(tfidf)


#running our two sentences through the IDF:
idfFirst = computeTFIDF(wordDictA, idfs)
idfSecond = computeTFIDF(wordDictB, idfs)
idfThird = computeTFIDF(wordDictC, idfs)

#putting it in a dataframe
idf= pd.DataFrame([idfFirst, idfSecond])
print(idf)