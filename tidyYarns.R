tidyYarns <- function(){
        library(dplyr)
        # in future, access data from db and run through pre-processing below
        
        # reads in yarn information from csv files
        pur_df <- read.csv("~/Desktop/Pendleton/CSVs/Stops-PurchasedYarns.csv",
                           stringsAsFactors=FALSE)
        twist_df <-read.csv("~/Desktop/Pendleton/CSVs/Stops-TwistYarns.csv",
                            stringsAsFactors=FALSE)
        dyed_df <-read.csv("~/Desktop/Pendleton/CSVs/Stops-DyedYarns.csv",
                           stringsAsFactors=FALSE)
        spun_df <- read.csv("~/Desktop/Pendleton/CSVs/Stops-SpunYarns.csv",
                            stringsAsFactors=FALSE)

        yarn_df <- bind_rows(pur_df, twist_df, dyed_df, spun_df)
        
        names(yarn_df) <- tolower(names(yarn_df))
        names(yarn_df) <- sub("\\.","",names(yarn_df))
        
        yarn_df$millstyle <- as.character(yarn_df$millstyle)
        yarn_df$millstyle <- gsub(" ", "", yarn_df$millstyle, fixed = TRUE)
        
        yarn_df$yarn <- as.character(yarn_df$yarn)
        yarn_df$type <- as.character(yarn_df$type)
        
        yarn_tbl <- tbl_df(yarn_df)
        yarn_tbl <- yarn_tbl %>%
                select(yarn, type) 
        yarn_tbl <- unique(yarn_tbl)
        
        return(yarn_tbl)
}

# Consider storing script in database to be called during analysis