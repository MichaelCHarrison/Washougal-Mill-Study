# tidyYarns.R is a function that reads in data from the 4 csvs pertaining to yarn type 
# (purchased, twist, dyed, and spun) and binds them into a single table. The function then 
# cleans the table

tidyYarns <- function(){
        # Load necessary library
        library(dplyr)
        
        # Read in data sets to local variable
        pur_df <- read.csv("~/Washougal-Mill-Study/CSVs/Stops-PurchasedYarns.csv",
                           stringsAsFactors=FALSE)
        twist_df <-read.csv("~/Washougal-Mill-Study/CSVs/Stops-TwistYarns.csv",
                            stringsAsFactors=FALSE)
        dyed_df <-read.csv("~/Washougal-Mill-Study/CSVs/Stops-DyedYarns.csv",
                           stringsAsFactors=FALSE)
        spun_df <- read.csv("~/Washougal-Mill-Study/CSVs/Stops-SpunYarns.csv",
                            stringsAsFactors=FALSE)
        
        # Binds the four yarn tables into a single table
        yarn_df <- bind_rows(pur_df, twist_df, dyed_df, spun_df)
        
        # Cleans table names and millstyles listed twist
        names(yarn_df) <- tolower(names(yarn_df))
        names(yarn_df) <- sub("\\.","",names(yarn_df))
        
        # Sets millstyle field to character variable and removes whitespace
        yarn_df$millstyle <- as.character(yarn_df$millstyle)
        yarn_df$millstyle <- gsub(" ", "", yarn_df$millstyle, fixed = TRUE)
        
        # Sets yarn and type fileds as character variables
        yarn_df$yarn <- as.character(yarn_df$yarn)
        yarn_df$type <- as.character(yarn_df$type)
        
        # Selects only unique yarns and respective type
        yarn_tbl <- tbl_df(yarn_df)
        yarn_tbl <- yarn_tbl %>%
                select(yarn, type) 
        yarn_tbl <- unique(yarn_tbl)
        
        # Returns table
        return(yarn_tbl)
}