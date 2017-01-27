loomDT <- function(){
        loom_df <- read.csv("/Users/michaelharrison/Desktop/Pendleton/CSVs/Stops-Extract.csv")
        
        library(data.table)
        loom_dt <- data.table(loom_df)
        loom_dt
}


