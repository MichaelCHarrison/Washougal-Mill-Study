joinedM365Stops <- function(){
        library(sqldf); library(dplyr)
        source(tidyM365.R); source(tidyStops())
        
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
                arrange(desc(date)) 
        
        return(tidySQLtbl)
}