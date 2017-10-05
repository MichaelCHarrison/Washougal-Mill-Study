# This function reads in data from the 4 csvs pertaining to yarn type (purchased, twist,
# dyed, and spun) and binds them into a single table to be merged with the table returned 
# from the tidyBom.R function.

tidyYarns <- function(){
        library(dplyr)
        
        # Reads in yarn information from csv files
        # In future, access data from database
        pur_df <- read.csv("~/Desktop/Pendleton/CSVs/Stops-PurchasedYarns.csv",
                           stringsAsFactors=FALSE)
        twist_df <-read.csv("~/Desktop/Pendleton/CSVs/Stops-TwistYarns.csv",
                            stringsAsFactors=FALSE)
        dyed_df <-read.csv("~/Desktop/Pendleton/CSVs/Stops-DyedYarns.csv",
                           stringsAsFactors=FALSE)
        spun_df <- read.csv("~/Desktop/Pendleton/CSVs/Stops-SpunYarns.csv",
                            stringsAsFactors=FALSE)
        
        # Binds the four types of yarns into a single table
        yarn_df <- bind_rows(pur_df, twist_df, dyed_df, spun_df)
        
        # Cleans table names and millstyles listed 
        names(yarn_df) <- tolower(names(yarn_df))
        names(yarn_df) <- sub("\\.","",names(yarn_df))
        
        yarn_df$millstyle <- as.character(yarn_df$millstyle)
        yarn_df$millstyle <- gsub(" ", "", yarn_df$millstyle, fixed = TRUE)
        
        yarn_df$yarn <- as.character(yarn_df$yarn)
        yarn_df$type <- as.character(yarn_df$type)
        
        # Selects only unique yarns and their corresponding types
        yarn_tbl <- tbl_df(yarn_df)
        yarn_tbl <- yarn_tbl %>%
                select(yarn, type) 
        yarn_tbl <- unique(yarn_tbl)
        
        return(yarn_tbl)
}

# Consider storing script in database to be called during analysis