# Homework 1

**Deadline**: 06.11.2022 23:59

**!!!** Send me your work in **html** format, **Rmd files not knitted to html will be graded as zero points**.


You will work with the data that contains tweets about coronavirus. Each tweet has label about its sentiment.
You need to perform some Explorative Descriptive Analysis (EDA) of the tweets and then to build classification model 
for sentiment analysis.

Data can be loaded [here](https://www.kaggle.com/datasets/datatattle/covid-19-nlp-text-classification).
There are two parts of the data, you should use "Corona_NLP_train.csv".

You can get 8 points for completing compulsory tasks (1-5). To get the maximum score, you should also complete task 6.


## Task

In general, your task is to compare tweets with negative and positive sentiment and build the model for classifying them.
In the data, there are 5 labels available:

+ Extremely Positive
+ Positive
+ Neutral
+ Negative
+ Extremely Negative

Just for simplification, I propose you to drop neutral tweets, and to group remaining labels to 2 classes - positive and negative.
So, you just need to filter out neutral tweets and then assign the label 'positive' to 'Extremely Positive' and 'Positive' tweets;
and similar for negative ones. Then, you will have 2 groups of tweets that you will need to compare and classify.


### 1. Text Preprocessing (1 point)
Perform full text preprocessing - tokenization, working with stop-words, lemmatization, cleaning from digits/punctuation etc.
When preforming each step, explain why you need/need not to do this for this task.

Note: look at the documentation of the function `unnest_tokens` - it provides a tokenizer for tweets, so it can be more suitable for this data.

### 2. EDA (2 points)

+ Show some basic statistics of the corpus: corpus size, vocabulary size, class distribution

+ Perform some explorative analysis and look for the differences between word usage in two groups.
Remember the practice on contrastive analysis. Using some of the methods we used, look at the words most specific to each group.
Describe the differences you found.


### 3. Preparing data for classification (1 point)
+ prepare document-term matrix for classification with filtering out some words by term-frequency/document frequency
+ describe how many docs (rows) and words (columns) you have in your final document-term matrix
+ split yout data to train-test sets. If you use only Naive Bayes algorithm, it is okay to split only to train and test sets.
If you use some other algorithms where you need to tune hyperparameters, you should either split to train-valid-test or 
to split to train and test and use cross-validation on the first part for tuning hyperparameters.
+ show the sizes of obtained data sets

Notes: 
+ for Naive Bayes classification, it is okay to use just document-term matrix with frequencies. 
But you can try to use TF-IDF. For some other algorithms, TF-IDF may work better.
+ the aim of filtering out some words is to decrease the number of features. 
Make sure that you do not drop too many words.
+ Make sure you fix random seed when splitting your data for reproducibility of the results.

### 4. Building classification model and evaluating model performance (2 points)
+ choose the main metric of model performance that you will use for evaluating the models. 
Explain why it is suitable for this task.
+ train Naive Bayes classifier on train set
+ evaluate it on the test set - print full classification report, the main evaluation metric, 
compare model performance for both classes.


### 5. Analysis of predictors (2 points)
+ show the most significant predictors for both classes. Try to find some insights from these words - 
how do positive and negative tweets differ? Are these words similar to the lists you see in EDA step?
+ show examples of wrongly clasified tweets from the test set. 
Try to find some explanation why they were misclassified.


### (*)6.  Experiments with other classification models (2 points)
+ Use some other classification model, train it on train set, tune the hyperparameters on validation set (or with cross-validation)
if it is necessary, and test final model on test set.
+ compare the results with the previous model.
+ if there are such methods for the algorithm you choose, analyze the most significant predictors, 
describe how they differ from those obtained from the previous model.

## Notes

+ you do not need to use all the methods we learn. 
For example, in EDA step you can try different things and just show the most interesting results.
DO NOT just copy all the code from the corresponding practices, show only significant and useful things. 
+ summarize what you have done and why after/before each part of the task.
+ when showing some lists/dataframes, use the function `head` for printing them.
I will reduce the grade for printing a huge dataset by half an html file, 
because it is terribly inconvenient to check such files.
+ I may give extra points for the most interesting differences found between the two groups and for interesting explanations/hypotheses for such differences.
+ I can also give additional points for good design of html file. Good design will be judged by my subjective opinion:) 
