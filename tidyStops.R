# This function reads in data from Stop-Extract.csv and cleans the data so that it can
# be joined with the returned table from tidyM365.R function.

tidyStops <- function(){ 
        library(dplyr); library(lubridate)
        
        # In future, access data from database 
        stops_tbl <- tbl_df(read.csv("~/Desktop/Pendleton/CSVs/Stops-Extract.csv"))
        
        names(stops_tbl) <- tolower(names(stops_tbl))
        names(stops_tbl) <- sub("\\.", "", names(stops_tbl))
        colnames(stops_tbl)[3] <- "loom"
        stops_tbl$loom <- as.factor(stops_tbl$loom)
        stops_tbl$date <- mdy(stops_tbl$date)
        stops_tbl <- stops_tbl[!grepl("[Ee][Xx]", stops_tbl$range),]
        
        stops_tbl
}
