distributionCheck <- function(X){
        dataset <- X
        
        for(i in 1:9){
                png(paste("./Attribute Histogram/", "hist", "0", toString(i),
                          colnames(validation)[i], ".png", sep = ""),
                    width = 480,
                    height = 480,
                    units = "px")
                
                hist(dataset[,i], main = paste(toString(i), "-", names(validation)[i]),
                     xlab = names(validation)[i])
                dev.off()
        }
        for(i in length(X)){
                png(paste("./Attribute Histogram/", "hist", toString(i),
                          colnames(validation)[i], ".png", sep = ""),
                    width = 480,
                    height = 480,
                    units = "px")
                
                hist(dataset[,i], main = paste(toString(i), "-", names(validation)[i]),
                     xlab = names(validation)[i])
                dev.off()
        }
}


#folder <- "./Attribute Histogram/name.png"
#dir.create(dirname(folder), showWarnings = FALSE)
