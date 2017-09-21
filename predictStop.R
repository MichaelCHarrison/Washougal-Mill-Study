predictStops <- function(){
        library(caret);
        source("millstyleBreakdown.R")
        
        data <- na.omit(millstyleBreakdown())
        
        seed <- 7
        set.seed(seed)
        
        # Partitions data to create validation set for model
        inVal <- createDataPartition(data$totalstops,
                                     p = .8,
                                     list = FALSE)
        validation <- data[-inVal,]
        dataset <- data[inVal,]
        
        # Create training/testing sets
        inTrain <- createDataPartition(dataset$totalstops, 
                                       p = .8,
                                       list = FALSE)
        training <- dataset[-inTrain,]
        testing <- dataset[inTrain,]
        
        # Set training control parameters for repeated cross validation and evaluation metric
        trainControl <- trainControl(method = "repeatedCV",
                                     number = 10,
                                     repeats = 3)
        metric <- "RMSE"
        
        # 
        
        # LM
        set.seed(7)
        fit.lm <- train(medv~., data=dataset, method="lm", 
                        metric=metric, preProc=c("center", "scale"), 
                        trControl=trainControl)
        # GLM
        set.seed(7)
        fit.glm <- train(medv~., data=dataset, method="glm", 
                         metric=metric, preProc=c("center", "scale"), 
                         trControl=trainControl)
        # GLMNET
        set.seed(7)
        fit.glmnet <- train(medv~., data=dataset, method="glmnet", metric=metric,
                            preProc=c("center", "scale"), 
                            trControl=trainControl)
        # SVM
        set.seed(7)
        fit.svm <- train(medv~., data=dataset, method="svmRadial", metric=metric,
                         preProc=c("center", "scale"), 
                         trControl=trainControl)
        # CART
        set.seed(7)
        grid <- expand.grid(.cp=c(0, 0.05, 0.1))
        fit.cart <- train(medv~., data=dataset, method="rpart", metric=metric, tuneGrid=grid,
                          preProc=c("center", "scale"), 
                          trControl=trainControl)
        # KNN
        set.seed(7)
        fit.knn <- train(medv~., data=dataset, method="knn", 
                         metric=metric, preProc=c("center", "scale"), 
                         trControl=trainControl)
}