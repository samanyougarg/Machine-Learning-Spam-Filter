# Machine-Learning-Spam-Filter

##A bit of Context##
We are going to implement naïve Bayes classifiers for spam filtering emails based on a UCI machine learning benchmark database named [spambase](http://archive.ics.uci.edu/ml/datasets/Spambase) where 57 features have already been extracted for each email message and all instances were labelled as “0” (normal) or “1” (spam). The purpose of this method is to use Matlab to carry out the naïve Bayes classification algorithm learned from the module to provide underpinning techniques for developing a spam filter working in different situations in order to enhance our understanding of the naïve Bayes classifier and its application to spam filtering. 

In order to apply the discrete-valued naïve Bayes classifier for spam filtering, the spambase database has been modified by the further discretisation of continuous attribute values. Also some instances have been re-labelled as “2” to indicate “uncertain”, a newly added class.

### Data Files ###

We have three data files with the suffix .mat as follows:

1. av2_c2 - a dataset for binary classification where each attribute has two discrete values.

2. av3_c2 - a dataset for binary classification where each attribute has three discrete values.

3. av7_c3 - a dataset for three-class classification where each attribute has seven discrete values.

####Each of the aforementioned datasets contains the same data format as follows:####

1. AttributeSet – a M*57 matrix where each row represents the feature vector of an training example, M is the number of training examples.

2. LabelSet –  a M*1 column vector where elements represent the labels of corresponding to training examples in AttributeSet.

3. testAttibuteSet – a N*57 matrix where each row represent the feature vector an test instance, N is the number of test instances.

4. validLabel -  a N*1 column vector where elements represent the labels corresponding to test instances in testAttributeSet (used to achieve the accuracy of a classifier).

A typical scenario for machine learning is to create a learning system by training it on a given training data set. Later on the system will be applied to different test data sets. As a result, we have written two generic functions; i.e., one for training a naïve Bayes classifier and the other for test based on the trained naïve Bayes classifier so that they can be applied to any datasets with the main function. A typical format is shown below where “Parameter List” stands for a set of data structures (e.g., vector and matrix) used to store conditional probabilities and prior probabilities to be learned.

__% for NB training__

[ “Parameter List” ] = NBTrain(AttributeSet, LabelSet) 

__% for NB test__

[predictLabel, accuracy] = NBTest(“Parameter List”, testAttributeSet, validLabel)

__Note that the accuracy of a naïve Bayes classifier is defined as follows:__

accuracy = number of correctly classified test instances / number of test instances

###Task - Implementation for discrete input attribute values###

The main task of this exercise is to implement a naïve Bayes classifier for discrete input attribute values). Our code must handle all possible situations; i.e., different attributes could have a various number of values (e.g., the first attribute has two values, the second one has four values and so on) and a problem could be either a binary or a multi-class classification task.

__In terms of functionalities, three goals are set__:

1. our code works for binary attribute values and binary classification tasks,

2. our code works for multiple attribute values and binary classification tasks

3. our code works for different attribute values and multi-class classification tasks.

##Implementation##

###1. Parameters Used###

I used the following parameters for Naïve Bayes Classifier for Spam Filtering:-

__% for NB training__

[Values, Classes, Likelihood, PriorProbability] = NBTrain(AttributeSet, LabelSet) 

__% for NB test__

[predictLabel, accuracy] = NBTest(Values, Classes, Likelihood, PriorProbability, testAttributeSet, validLabel)

Values – This is a variable with the list of values in the original data.

Classes – This is a variable with the list of classes in the original data.

Likelihood – This is a 3d matrix with probability of each features, class, value. 

PriorProbability – This a matrix of prior probability of values in any given example.

###2. Feature Extraction###

This method relies on discrete continuous features from the subject and body of each email. The above extraction produces values from each email to use the Naïve Bayes Classifier. I did some research and implemented the Markov Chain model. The Markov Chain model helps identify the context of the words used in an email.

Then, principal component analysis helps us identify the features and words from the training data that may belong to the classes we need to identify.

###3. Accuracies###

Binary Classification, each feature can take 1 of 2 values Accuracy – 89.1%

Binary Classification, each feature can take 1 of 3 values Accuracy – 89.35%

Binary Classification, each feature can take 1 of 7 values Accuracy – 86.26%

_Radhe Radhe!!_
