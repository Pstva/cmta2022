# Homework 2: Topic Modelling

In this homework, you are proposed to perform topic modelling to some corpus of texts in order to highlight 
main themes presented in your documents.

## Organizational issues

You can prepare this homework **individually or in any groups (2-4 people)** using **any corpus of texts you want**. 
But *I strongly advise* you to prepare it *within groups you prepare you final projects* on a *corpus you will analyse in a final project*.
First, it will help you to work with texts preprocessing, so you will have code for working with texts and for topic modelling.
Secondly, you will already have some knowledge about your texts, so it will be easier to come up with some analysis ideas for final project.
What is more, I may give you some advice on analysis looking at this homework and your data :)

**Deadline: 18.12.2022 23:59**, send me your works to e-mail **aspestova@hse.ru** in **html** format.

But, again, I advise you to send me your work earlier.
(!!!) The sooner you send it, the more likely it is that I will have time to look before the session week and be able to 
give you advice on preprocessing and ideas for analysis (if you work with the data for final project).

Some other notes:
+ Model training itself is a fairly fast process and does not require much code work, since in fact you just need to copy the code from practice and run it.
More questions and problems may arise with the preparation of data. Therefore, start parsing / searching and preparing data in advance.
+ If you have pieces of code with data preparation that take a long time to complete, you can save intermediate results, show the code in html (but not run it), but use the prepared data right away.
  (look at the argument *eval* in chunk options, if you specify eval=FALSE, code will not run when compiling html, but it will be seen in html)

## Task

### 1. Data Preparation (3 points)

+ Describe your data - what are these texts? Where did you take them? What useful columns do you have?
Show corpus statistics - corpus size and vocabulary size, documents length (in tokens).
+ Work with document segmentation if need. Remember discussion from the lecture about too short/too long documents and unity of context. 
Your texts should not necessary be of lenght written on the slide, but one text should represent some adequate unit of analysis for topic modelling.
+ Preprocess your texts - delete some noisy characters, perform lemmatization. 
You can also select only lemmas of particular part of speech (as we do in practice), it will probably make your topics more interpretable, though it is not necessary.
+ Make sure you have the data in the right format - rows represent documents, where you have a column in which the lemmatized cleared data is merged. And there is doc_id - a unique document identifier.

### 2. Building LDA model (2 points)
+ Build LDA model with the code used in practice. You can just choose some random number of topics and use it.
Or you can try to run model with different number of topics, look at the top-words for topics and then select the model which 
seems better for you (based on the topics interpretability)
+ obtain doc.topics matrix and word.topics matrix (the same code as on practice). Print top-words for each topic.

### 3. Interpretation (5 points)
+ interpret each topic you obtain in a couple of words, give them short names. You will also may see noisy topics/too general topics and smth like this, so just write it and do not try to interpet smth, that is not interpetable.
It is also useful to look at the most representative docs for each topic, when you interpet them. Do not print them all the html file, show them only if you find smth interesting there. 
+ show topics distribution across the collection of documents.
+ try to make some conclusions about your corpus based on the interpreted topics and their distribution.

Note: there are many examples what you can do with topics and all obtained matrices in the practice. In this homework, 
you need to perform the most basic things only - training the model, looking at the topics top-words and interpret them and to look at the topics distribution.
You can add any other things you want, but it is not necessary. This can be helpful in the case when you have some idea for final project and you want to show it to me 
in order to hear my advice. But, again, if you send me your hw on the last day of the deadline, I'm unlikely to have time to check the work and give feedback before your presentation.
