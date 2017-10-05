close all;
clear all;
fname = input('Enter a filename to load data for training/testing: 1,2,3');
files = cellstr(['av2_c2.mat'; 'av3_c2.mat'; 'av7_c3.mat']);
load(files{fname});

% Put your NB training function below
[ Values, Classes, Likelihood, PriorProbability ] = NBTrain(AttributeSet, LabelSet);
% Put your NB test function below
[predictLabel, accuracy] = NBTest(Values, Classes, Likelihood, PriorProbability, testAttributeSet, validLabel);

fprintf('********************************************* \n');
fprintf('Overall Accuracy on dataset %s: %f \n', files{fname}, accuracy);
fprintf('********************************************* \n');