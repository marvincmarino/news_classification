
# load libraries
library(tm) # text-mining tools
library(RTextTools) # text-mining tools
library(wordcloud) # word-cloud
# library(ggplot2) # plot
library(e1071) # naive-bayes

# get data
rawdata = read.csv("./dummy_data.csv", header = T, sep = ";", stringsAsFactors = F)

# create tdm
tdm = as.matrix(create_matrix(rawdata$news_text, language="english", removeStopwords=FALSE, removeNumbers=TRUE, stemWords=FALSE, weightTf))


