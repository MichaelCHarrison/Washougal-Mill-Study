joinedM365Stops <- function(){
        library(sqldf); library(dplyr)
        source("tidyM365.R"); source("tidyStops.R")
        
        tidy_m365 <- tidyM365()
        tidy_Stops <- tidyStops()
        
        sqltbl <- sqldf("SELECT date, loom, range, millstyle, ppm, mpx, yds, combinedstops 
                         FROM tidy_m365
                         JOIN tidy_Stops USING(date, loom, range)")
        
        tidySQLtbl <- sqltbl %>%
                group_by(date, range, millstyle, date, loom) %>%
                summarize(avgppm = mean(ppm),
                          totalpx = sum(mpx),
                          totalyards = sum(yds), 
                          totalstops = sum(combinedstops)) %>%
                select(date, loom, range, millstyle, avgppm, 
                       totalpx, totalyards, totalstops) %>%
                arrange(-desc(date), loom) 
        
        return(tidySQLtbl)
}

# source sqldf package:
# https://stackoverflow.com/questions/1299871/how-to-join-merge-data-frames-inner-outer-left-right
