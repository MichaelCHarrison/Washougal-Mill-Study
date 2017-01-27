loomSummary <- function(){
        loom_df <- read.csv("/Users/michaelharrison/Desktop/Pendleton/CSVs/Stops-Extract.csv")

        library(data.table)
        loom_dt <- data.table(loom_df)
        LoomNum <- loom_dt$LM.
        loom_dt <- loom_dt[, .(TotalMPX = sum(MPX),
                             TotalStops = sum(Combined.Stops),
                           PicksPerStop = (sum(MPX)/sum(Combined.Stops))),
                                     by = LoomNum]
        
        loom_order_pps <- loom_dt[order(-PicksPerStop)]
        loom_order_MPX <- loom_dt[order(-TotalMPX)]

        list(MPXPerStop = loom_order_pps,
               TotalMPX = loom_order_MPX,
                Summary = summary(loom_dt[2:4]))
}

