

# Data managing

# Set working directory
setwd("~/Desktop/mltraining/Titanic_R/ML_workbook")

# Import the training set: train and test
train <- read.csv("~/Desktop/mltraining/Titanic_R/ML_workbook/train.csv")
test <- read.csv("~/Desktop/mltraining/Titanic_R/ML_workbook/test.csv")

install.packages("Amelia")
install.packages("naniar")
library(naniar)

# missmap function considers "NA" values as missing values but
# it does not consider empty values as missing values.

train[train==""]<-NA
# missing.types <- c("", "NA")

# Need to see the missing data
library(Amelia)
missmap(train, main = "Titanic Training Data - Missing Map",
        col = c("yellow", "black"), legend = TRUE)
missmap(train, main = "Titanic Training Data - Missing Map",
        col = c("yellow", "black"), legend = FALSE)

# barplot for all variables
# how many passenger survived?
barplot(table(train$Survived), 
        names.arg = c("Parished", "Survived"),
        main = "Survived (passenger fate)", 
        col = "black")

# Passengers travelling in different classes
barplot(table(train$Pclass), 
        names.arg = c("first", "second", "third"),
        main="Pclass (passenger traveling class)", col="firebrick")
# how many survived gender-wise?
barplot(table(train$Sex),
        main = "Gender", col = "firebrick")

# Age distribution in the Titanic
hist(train$Age, main="Age", xlab = NULL, col="brown")

# How in group people (sibling+spouse) were traveling?
barplot(table(train$SibSp), main="SibSp (siblings + spouse aboard)", col="darkblue")

# How parents and children were traveling? 
barplot(table(train$Parch), main="Parch (parents + kids aboard)", col="gray50")

# What was the fair most people paid for Titanic?
hist(train$Fare, main="Fare (fee paid for ticket[s])", xlab = NULL, col="darkgreen")

# where most people embarked?
barplot(table(train$Embarked), xlab = "port", ylab = "frequency of port", main = "Embarked number")
# names.arg = c(what should be the sequence, find this from above line output)
barplot(table(train$Embarked), 
        names.arg = c("Missing","Cherbourg", "Queenstown", "Southampton"),
        main="Embarked (port of embarkation)", col = "darkgreen")
