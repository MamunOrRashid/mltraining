# Set working directory and import datafiles
# Your working directory might vary
# Set working directory
setwd("~/Desktop/mltraining/Titanic_R/ML_workbook")

# Import the training set: train and test
train <- read.csv("~/Desktop/mltraining/Titanic_R/ML_workbook/train.csv")
test <- read.csv("~/Desktop/mltraining/Titanic_R/ML_workbook/test.csv")

# library load, "rpart" is the decision tree 
# (rpart: Recursive Partitioning and Regression Trees)
library(rpart)

# predicting our classifcation model to "model" object
model <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + 
                   Fare + Embarked, data=train, method="class")
                   
# Now let's make a prediction and dump it to a dataframe
my_predict <- predict(model, test, type = "class")
my_predict_df <- data.frame(PassengerId = test$PassengerId, Name= test$Name, Survived = my_predict) 
