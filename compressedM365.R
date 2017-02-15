compM365 <- function(data = tidyM365()){
        library(dplyr);
        
        comp_m365 <- data
        comp_m365 %>%
                group_by(date, range, millstyle, order, loom) %>%
                summarize(totalyards = sum(yds)) %>%
                arrange(desc(date)) %>%
                print() 
}       