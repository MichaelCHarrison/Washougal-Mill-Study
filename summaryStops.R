## Arrange function options: totalpicks, totalstops, mpicksperstop
## Ideally you can use this to funnel information into plot development? 
## Not sure how that works yet...

summaryStops <- function(data, groupby = range, arrangeby = totalpicks){
        library(dplyr)
        
        summaryStops <- data
        summaryStops %>%
                group_by_(groupby) %>%
                #add filter here
                summarize(totalpicks = sum(mpx),
                          totalstops = sum(combinedstops),
                          mpicksperstop = (totalpicks/totalstops)) %>%
                arrange_(paste("desc(", arrangeby, ")")) %>%
                print()
}

# Set an option to split years? %between% 
