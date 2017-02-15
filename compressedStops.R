compStops <- function(data = tidyStops()){
        library(dplyr);
        
        comp_Stops <- data
        comp_Stops %>%
                group_by(date, loom, range) %>%
                summarize(avgppm = mean(ppm),
                          mpx = sum(mpx),
                          weft = sum(weft),
                          warp = sum(warp),
                          other = sum(other),
                          combinedstops = sum(combinedstops)) %>%
                arrange(desc(date), loom) %>%
                print()
}