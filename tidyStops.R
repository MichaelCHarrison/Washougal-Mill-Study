tidyStops <- function(){ 
        library(dplyr); library(lubridate)
        
        stops_tbl <- tbl_df(read.csv("~/Desktop/Pendleton/CSVs/Stops-Extract.csv"))
        
        names(stops_tbl) <- tolower(names(stops_tbl))
        names(stops_tbl) <- sub("\\.", "", names(stops_tbl))
        colnames(stops_tbl)[3] <- "loom"
        stops_tbl$shift <- as.factor(stops_tbl$shift)
        stops_tbl$loom <- as.factor(stops_tbl$loom)
        stops_tbl$date <- mdy(stops_tbl$date)
        stops_tbl <- stops_tbl[!grepl("[Ee][Xx]", stops_tbl$range),]
        
        #stops_tbl$range <- gsub("(^[^1-9]*)(\\d+)((-|[A-Z]).+$)", "\\2", stops_tbl$range)
        
        stops_tbl
}