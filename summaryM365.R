summaryM365 <- function(data, groupby){ 
        library(lubridate); library(dplyr)
        
        summaryM365 <- data
        summaryM365 %>%
                group_by_(groupby) %>%
                summarize(totalyds = sum(yds)) %>%
                arrange(desc(totalyds))
}