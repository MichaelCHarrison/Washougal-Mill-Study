rangeSummary <- function(){ 
        range_df <- read.csv("/Users/michaelharrison/Desktop/Pendleton/CSVs/Stops-Extract.csv")
        
        library(dplyr)
        range_tbl <- tbl_df(range_df)
        range_tbl$RANGE <- as.numeric(as.character(range_tbl$RANGE))
        range_tbl %>%
                group_by()
        
        
        library(data.table)
        range_dt <- data.table(range_df)
        range_dt$RANGE <- as.numeric(as.character(range_dt$RANGE))
        range_dt <- range_dt[, .(TotalMPX = sum(MPX),
                                 TotalStops = sum(Combined.Stops),
                                 PicksPerStop = sum(MPX)/sum(Combined.Stops)),
                             by = range_dt$RANGE]
        
        pps_order <- na.omit(range_dt[order(-PicksPerStop)])
        totalMPX_order <- na.omit(range_dt[order(-TotalMPX)])
        
        top_perf_pps <- head(pps_order[which(pps_order$TotalMPX > (summary(pps_order$TotalMPX))[2])])
        bottom_perf_pps <- tail(pps_order[which(pps_order$TotalMPX > (summary(pps_order$TotalMPX))[2])])
        top_perf_MPX <- head(totalMPX_order[which(totalMPX_order$TotalMPX > (summary(totalMPX_order$TotalMPX))[2])])
        bottom_perf_MPX <- tail(totalMPX_order[which(totalMPX_order$TotalMPX > (summary(totalMPX_order$TotalMPX))[2])])
        
        list(top5pps = top_perf_pps, bottom5pps = bottom_perf_pps, 
             top5mpx = top_perf_MPX, bottom5mpx = bottom_perf_MPX)
}
