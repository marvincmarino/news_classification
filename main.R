
#### HEADER: NEWS CLASSIFIER BASED ON TEXT #####
# Experiments on small sample: Based on text of news, this script:
# - Classifies news into a categories (multiple categories)
# - Classifies their relevancy (yes / no)
# - Classifies their priority (yes / no)

# initialise environment
source("init.R")

# load data
rawdata = read.csv("./dummy_data.csv", header = T, sep = ";", stringsAsFactors = F)

# create tdm
tdm = as.matrix(create_matrix(rawdata$news_text, language="english", removeStopwords=FALSE, removeNumbers=TRUE, stemWords=FALSE, weightTf))

#### function for training and testing document classifier ####
modelling <- function (t_var) {
  
  # create tidy dataset and add target variable
  tidyDset = as.data.frame(tdm)
  tidyDset$target = as.factor(t_var)
  
  # create train and test set
  set.seed(123)
  trainIndex = createDataPartition(tidyDset$target, p = .5, list = F, times = 1)
  
  trainSet = tidyDset[trainIndex, ]
  testSet = tidyDset[-trainIndex, ]
  
  # train naive bayes classifier
  model = naiveBayes(target ~ ., data = trainSet); model
  
  # apply model to test
  prediction = predict(model, testSet)
  
  # evaluate performance
  performance = table(prediction, testSet$target); performance
}


#### execute document classification ####
model1 = modelling(rawdata$category1) # model 1: predict news category
model2 = modelling(rawdata$relevancy_score) # model 2: predict news relevance
model3 = modelling(rawdata$high_priority) # model 3: predict news priority










