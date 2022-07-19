from math import sqrt
#USER ITEM RATING AND DICTIONARY OF USER ITEM 

user_dict={}
user_set=set()
item_user_dict={}
item_set=set()
inputs=int(input("Enter no. of inputs : - "))
for i in range(1,inputs+1):
    user,item,rating=map(int,input("Enter space seperated input for USER ITEM RATING : ").split())
    user_set.add(user)
    item_set.add(item)
    if item in item_user_dict:
        item_user_dict[item].append(user)
    else:
        item_user_dict[item] = [user]
    user_dict[(user,item)]=rating
# print(user_dict)
# print(item_set)

#COSINE FORMULA
len_item_set=len(item_set)
list_item_set=list(item_set)
item_matrix=[[1 for _ in range(len_item_set)] for _ in range(len_item_set)]
# print(item_matrix)
for i in range(1,len_item_set):
    for j in range(i+1,len_item_set+1):
        set_common_users=set(item_user_dict[i]).intersection(set(item_user_dict[j]))
        list_set_common_users=list(set_common_users)
        # print(list_set_common_users)
        numerator=0
        denominator1=0
        denominator2=0
        for k in range(len(set_common_users)):
            numerator+=user_dict[(list_set_common_users[k],i)]*user_dict[(list_set_common_users[k],j)]
            denominator1+=user_dict[(list_set_common_users[k],i)]**2
            denominator2+=user_dict[(list_set_common_users[k],j)]**2
        # print(i,j,item_matrix)
        item_matrix[i-1][j-1]=numerator/(sqrt(denominator1)*sqrt(denominator2))
        item_matrix[j-1][i-1]=numerator/(sqrt(denominator1)*sqrt(denominator2))
# print(item_matrix)

#RECOMMENDER SYSTEM
predicted_rating_dict={}
for item in range(1,len_item_set+1):
    user_not_rated = list(user_set - set(item_user_dict[item]))
    # print(item,user_not_rated)
    for user in user_not_rated:
        numerator=0
        denominator=0
        for i in range(1,len_item_set+1):
            if i!=item and (user,i) in user_dict:
                numerator+=user_dict[(user,i)]*item_matrix[i-1][item-1]
                denominator+=item_matrix[i-1][item-1]
        predicted_rating_dict[(user,item)]=numerator/denominator

#DISPLAY
for user,rating in predicted_rating_dict.items():
    print("Predicted Rating of Item ",user[1]," by USER ",user[0]," is : ",rating)
            

# input 
# 1 1 2
# 1 3 3
# 2 1 5
# 2 2 3
# 3 1 3
# 3 2 3
# 3 3 1
# 4 2 2
# 4 3 2


