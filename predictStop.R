predictStops <- function(){
        library(caret);
        source("millstyleBreakdown.R")
        
        data <- na.omit(millstyleBreakdown())
        data <- data[c(-millstyle, -date)]

        data <- subset(data, select = -c(millstyle, date))
        
        
        seed <- 7
        set.seed(seed)
        
        # Partitions data to create validation set for model
        inVal <- createDataPartition(data$totalstops,
                                     p = .85,
                                     list = FALSE)
        validation <- data[-inVal,]
        traing_test <- data[inVal,]
        
        # Create training/testing sets
        inTrain <- createDataPartition(dataset$totalstops, 
                                       p = .85,
                                       list = FALSE)
        training <- traing_test[inTrain,]
        testing <- traing_test[-inTrain,]
        
        
        # Set training control parameters for repeated cross validation and evaluation metric
        trainControl <- trainControl(method = "repeatedCV",
                                     number = 10,
                                     repeats = 3)
        metric <- "RMSE"
        
        
        #Models
        
        #Linear Model
        set.seed(seed)
        fit.lm <- train(totalstops~.,
                        data = training,
                        method = "lm",
                        metric = metric,
                        trControl = trainControl)
        
        
        #Generalized Linear Model
        set.seed(seed)
        fit.glm <- train(totalstops~.,
                         data = training,
                         method = "glm",
                         metric = metric,
                         trControl = trainControl)
        
        #GLMNET
        set.seed(seed)
        fit.glmnet <- train(totalstops~.,
                            data = training,
                            method = "glmnet",
                            metric = metric,
                            trControl = trainControl)
        
        # SVM
        set.seed(seed)
        fit.svm <- train(totalstops~.,
                         data = training,
                         method = "svmRadial",
                         metric = metric,
                         trControl = trainControl)
        
        # CART
        set.seed(seed)
        grid <- expand.grid(.cp=c(0, 0.05, 0.1))
        fit.cart <- train(totalstops~.,
                          data = training,
                          method = "rpart",
                          metric = metric,
                          tuneGrid=grid,
                          trControl = trainControl)
                

        # KNN
        set.seed(seed)
        fit.knn <- train(totalstops~.,
                         data = training,
                         method = "knn",
                         metric = metric,
                         trControl = trainControl)
        
        # Random Forest
        set.seed(seed)
        fit.rf <- train(totalstops~.,
                        data = training,
                        method = "rf",
                        metric = metric,
                        trControl = trainControl)
        
         
        # Results
        results <- resamples(list(LM=fit.lm, 
                                  GLM=fit.glm, 
                                  GLMNET=fit.glmnet, 
                                  SVM=fit.svm,
                                  CART=fit.cart, 
                                  KNN=fit.knn,
                                  RF=fit.rf))
        
        
}