compM365 <- function(data = tidyM365()){
        library(dplyr);
        
        comp_m365 <- data
        comp_m365 %>%
                group_by(millstyle, range, order, duedate, date, loom) %>%
                summarize(totalyards = sum(yds)) %>%
                arrange(desc(date)) %>%
                #add select feature to return columns as desired
                print() 
}       