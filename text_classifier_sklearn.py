from sklearn.feature_extraction.text import CountVectorizer , TfidfTransformer
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder
from sklearn.naive_bayes import MultinomialNB 
from sklearn.pipeline import Pipeline
from sklearn.metrics import classification_report

""" 
	Reading a sample dataset.
	Change the file name as per need.
	dataset is of format text|class
"""

fh = open('dataset.txt','r')
lines = fh.readlines()
fh.close()

""" Assuming this dataset is already cleansed """

x=[]
y=[]

for ln in lines:
	ln = ln.replace('\n','')
	data,target = ln.split('|')
	x.append(data)
	y.append(target)
"""
	Using label encoder to convert class names like SECURITY UX_ANALYST to 0 1 which model can work with.
"""
	
label_encoder = LabelEncoder()

y_transformed = label_encoder.fit_transform(y)

x_train,x_test,y_train,y_test=train_test_split(x,y_transformed,test_size=0.2)

"""
	Using Naive Bayes Multinomial model, however any other model can be used here as per requirement.
"""

text_classifier = Pipeline([('vect', CountVectorizer()),('tfidf', TfidfTransformer()),('clf', MultinomialNB()),])

text_classifier.fit(x_train,y_train)

y_predicted = text_classifier.predict(x_test)

print("Classification Report {}".format(classification_report(y_test,y_predicted)))
