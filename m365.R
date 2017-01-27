m365Summary <- function(){
        m365_df <- read.csv("/Users/michaelharrison/Desktop/Pendleton/CSVs/M365 for Micheal's Project 161228.csv")
        
        library(data.table)
        m365_dt <- data.table(m365_df)
        m365_dt$MILL.STYLE <- as.character(m365_dt$MILL.STYLE)
        m365_dt$MILL.STYLE <- as.numeric(sub("(-|[A-Z]).*", "", m365_dt$MILL.STYLE))
        ##Regex is causing mill.style to go NA
        ##Also missing mill styles starting with letters
        
        range <- m365_dt$MILL.STYLE
        m365Summary <- m365_dt[,.(totalYds = sum(Yds),
                            totalPCS = sum(PCS),
                           YdsPerPCS = sum(Yds)/sum(PCS)),
                                  by = range]
        m365Summary
}