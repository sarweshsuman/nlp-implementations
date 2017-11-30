from sklearn.feature_extraction.text import CountVectorizer , TfidfTransformer
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder
from sklearn.naive_bayes import MultinomialNB 
from sklearn.pipeline import Pipeline
from sklearn.metrics import classification_report

""" Reading a sample dataset """

fh = open('dataset.txt','r')
lines = fh.readlines()
fh.close()

""" Assuming this dataset is cleansed """

x=[]
y=[]

for ln in lines:
	ln = ln.replace('\n','')
	data,target = ln.split('|')
	x.append(data)
	y.append(target)

label_encoder = LabelEncoder()

y_transformed = label_encoder.fit_transform(y)

x_train,x_test,y_train,y_test=train_test_split(x,y_transformed,test_size=0.2)

text_classifier = Pipeline([('vect', CountVectorizer()),('tfidf', TfidfTransformer()),('clf', MultinomialNB()),])

text_classifier.fit(x_train,y_train)

y_predicted = text_classifier.predict(x_test)

print("Classification Report {}".format(classification_report(y_test,y_predicted)))
