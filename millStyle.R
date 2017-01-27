millStyle <- function(){
        millStyle_df <- read.csv("/Users/michaelharrison/Desktop/Pendleton/CSVs/M365 for Micheal's Project 161228.csv")
        
        library(dplyr)
        millStyle_tbl <- tbl_df(millStyle_df)
        millStyle_tbl$Date <- as.Date(millStyle_tbl$Date,
                                     format = guess_formats(millStyle_tbl$Date, c('mdy')))
        millStyle_tbl%>%
                group_by(MILL.STYLE, ORDER, Loom)%>%
                summarize(productionTime = difftime(max(Date), min(Date)))%>%
                arrange(desc(productionTime))%>%
                #select(MILL.STYLE, Date, Loom)%>%
                       print
        
        # library(data.table, lubridate)
        # millStyle_dt <- data.table(millStyle_df)
        # 
        # millStyle_dt$Date <- as.Date(millStyle_dt$Date, 
        #                              format = guess_formats(millStyle_dt$Date, c('mdy')))
        # millStyle_dt
}       