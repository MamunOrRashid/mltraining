# all females are alive and all males are died

# Set working directory
setwd("~/Desktop/mltraining/Titanic_R/ML_workbook")

# Import the training set: train and test
train <- read.csv("~/Desktop/mltraining/Titanic_R/ML_workbook/train.csv")
test <- read.csv("~/Desktop/mltraining/Titanic_R/ML_workbook/test.csv")


barplot(table(train$Pclass), 
        names.arg = c("first", "second", "third"),
        main="Pclass (passenger traveling class)", col="firebrick")

# What was the fair most people paid for Titanic?
hist(train$Fare, main="Fare (fee paid for ticket[s])", xlab = NULL, col="darkgreen")


# Need to create subsets of Fare

train$Fare2[train$Fare >= 30] <- '30+'
train$Fare2[train$Fare < 30 & train$Fare >= 20] <- '20-30'
train$Fare2[train$Fare < 20 & train$Fare >= 10] <- '10-20'
train$Fare2[train$Fare < 10] <- '<10'

# some tests, do as you feel like

table(train$Sex, train$Survived)

summary(train$Sex)

aggregate(Survived ~ Sex, data = train, FUN = sum)
aggregate(Survived ~ Sex, data = train, FUN = length)
aggregate(Survived ~ Sex, data = train, FUN = function(x){sum(x)/length(x)})


# back to 3rd prediction

# Comparing more than two subsets, we need to use command "aggregate"

aggregate(Survived ~ Fare2 + Pclass + Sex, data=train, FUN=sum)

# Let's look at actually how many were they in each subset

aggregate(Survived ~ Fare2 + Pclass + Sex, data=train, FUN=length)

# comparing subsets in terms of FUN=function(x) {sum(x)/length(x)}

aggregate(Survived ~ Fare2 + Pclass + Sex, data=train, FUN=function(x) {sum(x)/length(x)}) 

# In percentage

aggregate(Survived ~ Fare2 + Pclass + Sex, data=train, FUN=function(x) {sum(x)/length(x) * 100})
          
aggregate(Survived ~ Fare2 + Pclass + Sex, data=train, FUN=function(x) {sum(x)/length(x)})

# Create new column in test set with our prediction that everyone dies
test$Survived <- 0
# Update the prediction to say that all females will survive
test$Survived[test$Sex == 'female'] <- 1
# Update once more to say that females who pay more for a third class fare also perish
test$Survived[test$Sex == 'female' & test$Pclass == 3 & test$Fare >= 20] <- 0




# send the dataframe with two columns   

prediction3rd <- data.frame (test$PassengerId, test$Survived)

# naming the columns

names (prediction3rd) <- c("PassengerId","Survived")

# no rownames

rownames (prediction3rd) <- NULL

# Finally, time to submit it to Kaggle.com

write.csv (prediction3rd, file = "prediction3.csv", row.names=FALSE)

#or

  prediction3 <- data.frame(PassengerId = test$PassengerId, Survived = test$Survived)
  write.csv(prediction3, file = "3rdprediction.csv", row.names = FALSE)
