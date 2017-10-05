# This function reads in data from M365.csv and cleans it so that it can be joined with 
# the table returned from the tidyStops.R function

tidyM365 <- function(){ 
        library(dplyr); library(lubridate)

        # In future, access data from database        
        m365_tbl <- tbl_df(read.csv("~/Desktop/Pendleton/CSVs/M365.csv", 
                           na.strings = "N/A"))
        
        #cleans column names of dataset
        names(m365_tbl) <- tolower(names(m365_tbl))
        names(m365_tbl) <- sub("\\.", "", names(m365_tbl))
        #format date 
        m365_tbl$duedate <- mdy(m365_tbl$duedate)
        m365_tbl$date <- mdy(m365_tbl$date)
        m365_tbl$millstyle <- as.character(m365_tbl$millstyle)
        # Removes experimental millstyles
        m365_tbl <- m365_tbl[!grepl("EX", m365_tbl$millstyle),]
        # Creates range feature by pulling range sequence contained in millstyle
        m365_tbl$range <- gsub("(^[^1-9]*)(\\d+)((-|[A-Z]).+$)", "\\2", m365_tbl$millstyle)

        # Selects desired features from the dataframe to be used in analysis
        m365_tbl %>% 
                select(range, millstyle, order, duedate, date, yds, loom) %>%
                print()
}


