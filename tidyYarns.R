tidyYarns <- function(){
        pur_df <- read.csv("~/Desktop/Pendleton/CSVs/Stops-PurchasedYarns.csv")
        twist_df <-read.csv("~/Desktop/Pendleton/CSVs/Stops-TwistYarns.csv")
        dyed_df <-read.csv("~/Desktop/Pendleton/CSVs/Stops-DyedYarns.csv")
        spun_df <- read.csv("~/Desktop/Pendleton/CSVs/Stops-SpunYarns.csv")
        
        library(dplyr)
        yarn_df <- suppressWarnings(bind_rows(pur_df, twist_df, dyed_df, spun_df))
        names(yarn_df) <- tolower(names(yarn_df))
        names(yarn_df) <- sub("\\.","",names(yarn_df))
        yarn_tbl <- tbl_df(yarn_df)
        yarn_tbl <- yarn_tbl %>%
                select(yarn, millstyle, pounds, type)
                #mutate a new variable of number of yarns that go into a millstyle
        
        yarn_tbl
}