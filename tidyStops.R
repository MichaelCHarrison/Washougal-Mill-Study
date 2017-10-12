# tidyStops.R is a function that cleans data from the Stop-Extract.csv file.

tidyStops <- function(){ 
        # Load necessary libraries
        library(dplyr); library(lubridate)
        
        # Read in data and set to local variable
        stops_tbl <- tbl_df(read.csv("~/Desktop/Pendleton/CSVs/Stops-Extract.csv"))
        
        # Cleans names
        names(stops_tbl) <- tolower(names(stops_tbl))
        names(stops_tbl) <- sub("\\.", "", names(stops_tbl))
        colnames(stops_tbl)[3] <- "loom"
        
        # Set loom as factor variable
        stops_tbl$loom <- as.factor(stops_tbl$loom)
        stops_tbl$date <- mdy(stops_tbl$date)
        
        # Removes records of experimental millstyles
        stops_tbl <- stops_tbl[!grepl("[Ee][Xx]", stops_tbl$range),]
        
        # Returns table
        return(stops_tbl)
}
