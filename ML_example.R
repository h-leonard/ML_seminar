### making data to use
library(dplyr)
library(caret)
library(randomForest)


ml_data <- read.table("data_for_ML_sem.tab", header = T)


control <- trainControl(method = "cv", number = 10, classProbs = TRUE, summaryFunction = twoClassSummary, search = "random")

tree <- train(PHENO ~., data = ml_data, method = "rf", trControl = control, tuneLength = 40, metric = "ROC")


print(tree)


plot(tree)


varImp(tree)

imp <- varImp(tree)
plot(imp)


