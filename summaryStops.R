## Arrange function options: totalpicks, totalstops, mpicksperstop
## Ideally you can use this to funnel information into plot development? 
## Not sure how that works yet...

summaryStops <- function(data = tidyStops(), groupby = "range", arrangeby = "totalpicks"){
        library(dplyr)
        
        summaryStops <- data
        summary <- summaryStops %>%
                group_by_(groupby) %>%
                #add filter here
                summarize(totalpicks = sum(mpx),
                          totalstops = sum(combinedstops),
                          mpicksperstop = (totalpicks/totalstops)) %>%
                arrange_(paste("desc(", arrangeby, ")")) %>%
                print()
        #head(summary$range) #returns vector of top ranges by variable
}



# Set an option to split years? %between% 
