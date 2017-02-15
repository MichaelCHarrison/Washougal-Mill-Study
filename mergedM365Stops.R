mergedM365Stops <- function(df1 = compStops(), df2 = compM365()){
        library(dplyr);
        
        stops_df <- df1
        m365_df <- df2
        
        merged_df <- merge(x = stops_df, 
                           y = m365_df, 
                           by = c("date", "range", "loom"))
        merged_df %>%
                select(date, range, millstyle, order, loom, 
                       avgppm, mpx, weft, warp, other, 
                       combinedstops, totalyards) %>%
                arrange(date, loom)
}