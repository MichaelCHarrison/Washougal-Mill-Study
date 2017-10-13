# joinedm365Stops.R is a function that joins the tables returned from the tidyM365.R and 
# tidyStops.R. The joined table is then grouped by date, range, millstyle, and loom to 
# engineer 4 features and the prediction target based on the production data from tidyM365.R: 
#
#       avgppm - average picks per minute
#       totalpx - total picks
#       totalyards - total yards
#       yardsperpx - yards per pick
#       totalstops - total stops (prediction target)


joinedM365Stops <- function(){
        # Load packages and functions
        library(sqldf); library(dplyr)
        source("tidyM365.R"); source("tidyStops.R")
        
        # Set returned tables to local variable
        tidy_m365 <- tidyM365()
        tidy_Stops <- tidyStops()
        
        # Merge the two tables
        tidy_M365Stops <- merge(tidy_m365, 
                               tidy_Stops, 
                               by = c("date", "loom", "range"))
        
        # Group by fields and calculate new fields
        joined_M365Stops <- tidy_M365Stops %>%
                group_by(date, range, millstyle, loom) %>%
                summarize(avgppm = mean(ppm),
                          totalpx = sum(mpx),
                          totalyards = sum(yds),
                          yardsperpx = totalyards/totalpx,
                          totalstops = sum(combinedstops)) %>%
                select(date, loom, range, millstyle, avgppm, 
                       totalpx, totalyards, yardsperpx, totalstops) %>%
                arrange(-desc(date), loom) 
        
        return(joined_M365Stops)
}