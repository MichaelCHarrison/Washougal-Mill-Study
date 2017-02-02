m365Summary <- function(){
        m365_df <- read.csv("/Users/michaelharrison/Desktop/Pendleton/CSVs/M365 for Micheal's Project 161228.csv")
        
        library(dplyr)
        m365_tbl <- tbl_df(m365_df)
        m365_tbl$MILL.STYLE <- as.character(m365_tbl$MILL.STYLE)
        m365_tbl$MILL.STYLE <- as.numeric(sub("(-|[A-Z]).*", "", m365_tbl$MILL.STYLE))
        
        ##Regex is causing mill.style to go NA
        ##Also missing mill styles starting with letters
        
        m365_tbl%>%
                select()
                group_by()
        
        range <- m365_tbl$MILL.STYLE
        m365Summary <- m365_dt[,.(totalYds = sum(Yds),
                            totalPCS = sum(PCS),
                           YdsPerPCS = sum(Yds)/sum(PCS)),
                                  by = range]
        m365Summary
}