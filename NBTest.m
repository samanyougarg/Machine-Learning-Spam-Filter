function [ predictLabel, accuracy ] = NBTest(Values, Classes, Likelihood, PriorProbability, testAttributeSet, labelSet)

%count the number of features
features = size(testAttributeSet,2);

accuracy = [];

predictLabel = [];

samplecount = size(testAttributeSet,1);
classsize = size(Classes,1);
valuec = 1:size(Values,1);

for sample = 1:samplecount
    classProbabilities = [];
    for class = 1:classsize
        classProbability = PriorProbability(class);
        for feature = 1:features
            for value = valuec
                if Values(value) == testAttributeSet(sample, feature)
                  classProbability = Likelihood(class, feature, value) * classProbability;
                end
            end
        end
        classProbabilities = [classProbabilities; classProbability];
    end
    Predict = Classes(find(max(classProbabilities)==classProbabilities));
    predictLabel = [predictLabel; Predict];
end
    
accuracy = sum(predictLabel==labelSet)/size(labelSet,1);
end