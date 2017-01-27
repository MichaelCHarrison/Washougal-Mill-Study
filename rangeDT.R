rangeDT <- function(){ 
        range_df <- read.csv("/Users/michaelharrison/Desktop/Pendleton/CSVs/Stops-Extract.csv")
        
        library(data.table)
        range_dt <- data.table(range_df)
        
        range_dt
}