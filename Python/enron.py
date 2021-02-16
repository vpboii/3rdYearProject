import os
import re
import nltk
import string
from nltk.tokenize import word_tokenize
from nltk.corpus import stopwords



from email.parser import Parser
rootdir = "D:\\Program Files\\Coding_to_project\\Project\\allen-p\\straw"

#https://www.w3schools.com/python/gloss_python_function_passing_list.asp
#sending list as an argumentto be able to read in matlab
def funkcija(list):
    with open("email_body.txt", "w") as f:
        for x in list:
            f.write(x)
            f.write("\n")

            
def email_analyse(inputfile, email_body):
    with open(inputfile, "r") as f:
        data = f.read() 
        
        email = Parser().parsestr(data)
        
    #to_email_list.append(email['to'])
    #from_email_list.append(email['from'])
    
    email_body.append(email.get_payload())
    
#to_email_list = []
#from_email_list = []
email_body = []

# This file will contain the lengths of the parsed emails
def test(sequence):
    with open("email_len.txt","w") as fn:
            N0 = 0
            Dn = N - N0
            N0 = N
            fn.write('%d ' %N)

	
for directory, subdirectory,filenames in os.walk(rootdir):
    for filename in filenames:
        email_analyse(os.path.join(directory, filename), email_body)
        

            
with open("email_body.txt", "w") as f:
    for email_bod in email_body:
        if email_bod:
            f.write(email_bod)
            f.write("\n")


           
#https://machinelearningmastery.com/clean-text-machine-learning-python/
#reading the list and striping out punctuation and not alphabetic.
#after calling the function which transfers list to a string as         
with open("email_body.txt", "r") as f:
    data = f.read()
    #convert to lower case
    tokens = word_tokenize(data)
    tokens = [w.lower() for w in tokens]
    #remove punctuation from each word
    table = str.maketrans('','',string.punctuation)
    stripped = [w.translate(table) for w in tokens]
    # remove remaining tokens that are not alphabetic
    words = [word for word in stripped if word.isalpha()]
    stop_words = set(stopwords.words('english'))

    words = [w for w in words if not w in stop_words]
    
    N = len(words)

    
funkcija(words)
test(N)

