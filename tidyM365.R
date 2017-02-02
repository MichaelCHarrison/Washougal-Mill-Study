tidyM365 <- function(){ 
        library(lubridate, dplyr)
        
        m365_tbl <- tbl_df(read.csv("~/Desktop/Pendleton/CSVs/M365.csv", 
                           na.strings = "N/A"))
        
        names(m365_tbl) <- tolower(names(m365_tbl))
        names(m365_tbl) <- sub("\\.", "", names(m365_tbl))
        m365_tbl$duedate <- mdy(m365_tbl$duedate)
        m365_tbl$date <- mdy(m365_tbl$date)
        
        #m365_tbl$millstyle <- gsub("(^.+[1-9]+")
        
        m365_tbl
}       
        
        # range_tbl <- tbl_df(range_df)
        # range_tbl$RANGE <- as.numeric(as.character(range_tbl$RANGE))
        # tolower(names(range_tbl))
        # range_tbl
                # select()
                # group_by(range_tbl$RANGE)%>%


        
        # library(data.table)
        # range_dt <- data.table(range_df)
        # range_dt$RANGE <- as.numeric(as.character(range_dt$RANGE))
        # range_dt <- range_dt[, .(TotalMPX = sum(MPX),
        #                          TotalStops = sum(Combined.Stops),
        #                          PicksPerStop = sum(MPX)/sum(Combined.Stops)),
        #                      by = range_dt$RANGE]
        # 
        # pps_order <- na.omit(range_dt[order(-PicksPerStop)])
        # totalMPX_order <- na.omit(range_dt[order(-TotalMPX)])
        # 
        # top_perf_pps <- head(pps_order[which(pps_order$TotalMPX > (summary(pps_order$TotalMPX))[2])])
        # bottom_perf_pps <- tail(pps_order[which(pps_order$TotalMPX > (summary(pps_order$TotalMPX))[2])])
        # top_perf_MPX <- head(totalMPX_order[which(totalMPX_order$TotalMPX > (summary(totalMPX_order$TotalMPX))[2])])
        # bottom_perf_MPX <- tail(totalMPX_order[which(totalMPX_order$TotalMPX > (summary(totalMPX_order$TotalMPX))[2])])
        # 
        # list(top5pps = top_perf_pps, bottom5pps = bottom_perf_pps, 
        #      top5mpx = top_perf_MPX, bottom5mpx = bottom_perf_MPX)

