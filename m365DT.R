m365DT <- function(){
        m365_df <- read.csv("~/Desktop/Pendleton/CSVs/M365 for Micheal's Project 161228.csv")
        
        library(data.table)
        m365_dt <- data.table(m365_df)
        
        m365_dt
}