library(relaimpo)
library(randomForest)

# Read data
train_blood <- read.csv("~/Downloads/blood donation_drivendata/train_blood.csv", header= TRUE)
View(train_blood)
test_blood <- read.csv("~/Downloads/blood donation_drivendata/test_blood.csv")
View(test_blood)

# create a simple linear model for testing the linearity
simple_lm <- lm(Made.Donation.in.March.2007~., data = train_blood)
summary(simple_lm)

# pre-processing & data cleaning
train_blood$Total.Volume.Donated..c.c.. <- NULL
train_blood$X <- NULL
test_blood$Total.Volume.Donated..c.c.. <- NULL
test_blood$X <- NULL

# checking relative importance
calc.relimp(simple_lm, type = c("lmg"), rela = TRUE)
simple_lm <- lm(Made.Donation.in.March.2007~., data = train_blood)

# feature engineering
donation_freq <- (train_blood$Months.since.First.Donation - train_blood$Months.since.Last.Donation)/
                                   (train_blood$Number.of.Donations)

train_blood$donation_freq <- donation_freq

donation_freq_test <- (test_blood$Months.since.First.Donation - test_blood$Months.since.Last.Donation)/
  (test_blood$Number.of.Donations)

test_blood$donation_freq <- donation_freq_test

# Normalising the data using R's built-in "scale" function
train_blood <- scale(train_blood)
test_blood <- scale(test_blood)

# Model
model_rf <- randomForest(as.factor(Made.Donation.in.March.2007)~. , data = train_blood,
                         ntree = 200, norm.votes = TRUE, mtry = 3)
prediction_rf <- predict(model_rf, test_blood, type = "prob")
prediction_rf

# write data to CSV file:
rr <- cbind(test_blood$X, prediction_rf)
write.csv(rr, file = "/home/nouroz/Desktop/dd.csv" , row.names = TRUE)










