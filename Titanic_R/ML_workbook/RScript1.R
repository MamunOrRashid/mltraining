
# Script 1

# Set working directory
setwd("~/Desktop/mltraining/Titanic_R/ML_workbook")

# Import the training set: train
train <- read.csv("~/Desktop/mltraining/Titanic_R/ML_workbook/train.csv")

# viewing the  "train" dataframe in raw format
train

# viewing the  "train" dataframe in table format
View(train)

#### if dataset contains "text" then it convert to factor. "factor" is the datatype
#### of "text".
# dataframe structure
 