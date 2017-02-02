summaryStops <- function(data, groupby){
        library(dplyr)
        
        summaryStops <- data
        summaryStops %>%
                group_by_(groupby) %>%
                summarize(totalpicks = sum(mpx),
                          totalstops = sum(combinedstops),
                          mpicksperstop = (totalpicks/totalstops)) %>%
                arrange(desc(mpicksperstop)) %>%
                print()
}
