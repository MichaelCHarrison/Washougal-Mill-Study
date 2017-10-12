# tidyM365.R is a function that cleans data from the Stops-MillStyleYarnBOMs.csv file.

tidyM365 <- function(){ 
        # Load necessary libraries
        library(dplyr); library(lubridate)

        # Read in data and set to local variable        
        m365_tbl <- tbl_df(read.csv("~/Desktop/Pendleton/CSVs/M365.csv", 
                           na.strings = "N/A"))
        
        # Cleans column names of dataset
        names(m365_tbl) <- tolower(names(m365_tbl))
        names(m365_tbl) <- sub("\\.", "", names(m365_tbl))
        
        # Format date 
        m365_tbl$duedate <- mdy(m365_tbl$duedate)
        m365_tbl$date <- mdy(m365_tbl$date)
        m365_tbl$millstyle <- as.character(m365_tbl$millstyle)
        
        # Removes records of experimental millstyles
        m365_tbl <- m365_tbl[!grepl("EX", m365_tbl$millstyle),]
        
        # Creates range feature by pulling range sequence contained in millstyle
        m365_tbl$range <- gsub("(^[^1-9]*)(\\d+)((-|[A-Z]).+$)", "\\2", m365_tbl$millstyle)

        # Selects and orders fields from the table
        m365_tbl %>% 
                select(range, millstyle, order, duedate, date, yds, loom) %>%
                print()
        
        # Returns table
        return(m365_tbl)
}


