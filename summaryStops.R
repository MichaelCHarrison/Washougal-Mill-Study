## Arrange function options: totalpicks, totalstops, mpicksperstop
## Ideally you can use this to funnel information into plot development? 
## Not sure how that works yet...

summaryStops <- function(data, groupby, arrangeby){
        library(dplyr)
        
        summaryStops <- data
        summaryStops %>%
                group_by_(groupby) %>%
                summarize(totalpicks = sum(mpx),
                          totalstops = sum(combinedstops),
                          mpicksperstop = (totalpicks/totalstops)) %>%
                arrange_(paste("desc(", arrangeby, ")")) %>%
                print()
}
