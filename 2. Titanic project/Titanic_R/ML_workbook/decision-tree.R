# Import the training set: train
# Your working directory might vary
# Set working directory
setwd("~/Desktop/mltraining/Titanic_R/ML_workbook")

# Import the training set: train and test
train <- read.csv("~/Desktop/mltraining/Titanic_R/ML_workbook/train.csv")
test <- read.csv("~/Desktop/mltraining/Titanic_R/ML_workbook/test.csv")

install.packages('rattle')
install.packages('rpart.plot')
install.packages('RColorBrewer')

library(rpart)
library(rattle)
library(rpart.plot)
library(RColorBrewer)

mytree1 <- rpart(Survived ~ Sex, data=train, method="class")
fancyRpartPlot(mytree1)

#table(train$Survived)
#table(train$Sex, train$Survived)

round(prop.table(table(train$Survived)),2)
## 
##    0    1 
## 0.62 0.38


round(prop.table(table(train$Sex, train$Survived),margin = 1),2)
# what is margin = 1?
# https://stats.stackexchange.com/questions/172770/what-are-row-wise-and-column-wise-proportions

#round(prop.table(table(train$Sex, train$Survived)),3)
##         
##             0    1
##   female 0.26 0.74
##   male   0.81 0.19

#mytree2 <- rpart(Survived ~ Pclass + Age, data=train, method="class")
mytree2 <- rpart(Survived ~ Pclass + Age, data=train, method="class")
fancyRpartPlot(mytree2)



# not necessary but needs to learn
#t<- matrix(1:9,3)
#m <- matrix(1:4, nrow = 2, ncol = 2)
#m <- matrix(1:4, 2)
#m
#margin.table(m, 1)
#margin.table(m, 2)
#tab = margin.table(Titanic, margin=c(2,4))
