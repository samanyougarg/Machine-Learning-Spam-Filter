function [ Values, Classes, Likelihood, PriorProbability ] = NBTrain(AttributeSet, LabelSet)

% variables 

PriorProbability = [];

%count the number of features
featurecount = size(AttributeSet,2);

%total number of examples
totalexamples = size(LabelSet,1);

%unique values
values = unique(AttributeSet);

%unique classes
classes = unique(LabelSet);

classsize = size(classes,1);

for class = 1:classsize
    classfind = find(LabelSet == classes(class));
    classtotal = size(classfind,1);
    PriorProbability = [PriorProbability; classtotal / totalexamples];

    attributeProbs = [];

  for feature = 1:featurecount
    totalvalue = histc(AttributeSet(classfind,feature),values)';
    attributeProb = totalvalue ./ classtotal;
    attributeProbs = [attributeProbs; attributeProb];
  end

  Likelihood(class,:,:) = attributeProbs;
end

Classes = classes;
Values = values;

end