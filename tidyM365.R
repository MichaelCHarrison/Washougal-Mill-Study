tidyM365 <- function(){ 
        library(dplyr); library(lubridate)
        
        m365_tbl <- tbl_df(read.csv("~/Desktop/Pendleton/CSVs/M365.csv", 
                           na.strings = "N/A"))
        
        #cleans column names of dataset
        names(m365_tbl) <- tolower(names(m365_tbl))
        names(m365_tbl) <- sub("\\.", "", names(m365_tbl))
        #formats date correctly with lubridate package
        m365_tbl$duedate <- mdy(m365_tbl$duedate)
        m365_tbl$date <- mdy(m365_tbl$date)
        m365_tbl$millstyle <- as.character(m365_tbl$millstyle)
        m365_tbl <- m365_tbl[!grepl("EX", m365_tbl$millstyle),]
        m365_tbl$range <- gsub("(^[^1-9]*)(\\d+)((-|[A-Z]).+$)", "\\2", m365_tbl$millstyle)

        m365_tbl %>% 
                select(range, millstyle, order, duedate, date, yds, loom) %>%
                print()
}


