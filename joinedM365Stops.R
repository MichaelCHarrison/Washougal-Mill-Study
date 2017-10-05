# This function joins the returned tables from the tidyM365.R and tidyStops.R functions. 
# After the merge, data is grouped by date, range, millstyle, and loom to engineer 4 features 
# and the prediction target based on the production data from tidyM365.R: 
#
#       avgppm = average picks per minute
#       totalpx = total picks
#       totalyards = total yards
#       yardsperpx = yards per pick
#       totalstops = total stops (prediction target)
#
# The table returned by this function is to be joined with the table returned by 
# joinedBomYarns.R on the millstyle feature 

joinedM365Stops <- function(){
        library(sqldf); library(dplyr)
        source("tidyM365.R"); source("tidyStops.R")
        
        tidy_m365 <- tidyM365()
        tidy_Stops <- tidyStops()
        
        sqltbl <- sqldf("SELECT date, loom, range, millstyle, ppm, mpx, yds, combinedstops 
                         FROM tidy_m365
                         JOIN tidy_Stops USING(date, loom, range)")
        
        tidySQLtbl <- sqltbl %>%
                group_by(date, range, millstyle, loom) %>%
                summarize(avgppm = mean(ppm),
                          totalpx = sum(mpx),
                          totalyards = sum(yds),
                          yardsperpx = totalyards/totalpx,
                          totalstops = sum(combinedstops)) %>%
                select(date, loom, range, millstyle, avgppm, 
                       totalpx, totalyards, yardsperpx, totalstops) %>%
                arrange(-desc(date), loom) 
        
        return(tidySQLtbl)
}

# source sqldf package:
# https://stackoverflow.com/questions/1299871/how-to-join-merge-data-frames-inner-outer-left-right
