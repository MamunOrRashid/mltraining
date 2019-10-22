
# Script 1

# Set working directory
setwd("~/Desktop/mltraining/Titanic_R/ML_workbook")

# Import the training set: train and test
train <- read.csv("~/Desktop/mltraining/Titanic_R/ML_workbook/train.csv")
test <- read.csv("~/Desktop/mltraining/Titanic_R/ML_workbook/test.csv")

# viewing the  "train" and "test" dataframe in raw format
train
test

# viewing the  "train" and "test" dataframe in table format
View(train)
View(test)

#### if dataset contains "text" then it convert to factor. "factor" is the datatype
#### of "text".
# dataframe structure
 str(train)
 
# how many people in survived column means condition like 0 or 1
 table(train$Survived)
 
# proportion of people who survived?
 prop.table(table(train$Survived))
 
# now for %
 prop.table(table(train$Survived)) * 100
 
# genderwise who servived
 table(train$Sex, train$Survived)
 prop.table(table(train$Sex, train$Survived)) * 100
 
# visual representation of survived column in train dataset
 barplot(table(train$Survived), xlab = "Servived", ylab = "People", main = "Train Data Survival")
 barplot(table(train$Sex, train$Survived), xlab = "Servived", ylab = "People", main = "Train Data Survival")
 barplot(table(train$Embarked), xlab = "port", ylab = "frequency of port", main = "Embarked number")

 # Let's everyone died in test dataset, now make our first prediction
 # "rep" command the value 0 418 (means 0 repeats 418 times) times in the newly created $Survived column
 test$Survived <- rep(0,418)
 View(test)
 
 # We need to submit a csv file with the PassengerId and Survived predictions to Kaggle
 # write.csv fuction writes the prediction dataframe out to a CSV file, excluding the row numbers
 prediction <- data.frame(PassengerId = test$PassengerId, Survived = test$Survived)
 write.csv(prediction, file = "1stprediction.csv", row.names = FALSE)
 
 
 
 
  