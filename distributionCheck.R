distributionCheck <- function(X){
        dataset <- X
        
        for(i in 1:9){
                png(paste("./Attribute Histogram/", "hist", "0", toString(i),
                          colnames(training)[i], ".png", sep = ""),
                    width = 480,
                    height = 480,
                    units = "px")
                
                hist(dataset[,i], main = paste(toString(i), "-", names(training)[i]),
                     xlab = names(training)[i])
                dev.off()
        }
        for(i in 10:85){
                png(paste("./Attribute Histogram/", "hist", toString(i),
                          colnames(training)[i], ".png", sep = ""),
                    width = 480,
                    height = 480,
                    units = "px")
                
                hist(training[,i], main = paste(toString(i), "-", names(training)[i]),
                     xlab = names(training)[i])
                dev.off()
        }
}


#folder <- "./Attribute Histogram/name.png"
#dir.create(dirname(folder), showWarnings = FALSE)
