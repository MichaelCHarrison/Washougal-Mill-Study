plotStops <- function (){
        library(ggplot2)
        source("tidyStops.R")
        stops_df <- tidyStops()
        
        #loom utilization
        qplot(loom, data = stops_df)

        
        #ppm breakdown
        qplot(ppm, data = stops_df)
        
        
        #range breakdown: 
        # ~ with qplot ~
        qplot(range, data = stops_df) 
        # ~ with ggplot ~
        range <- ggplot(stops_df, aes(range))
        range + geom_histogram(stat = "count")
        
        #to set order of factor variable so that histogram is ordered by count
        # stops_df <- within(stops_df, 
        #                    range <- factor(range, 
        #                                       levels=range(sort(table(range), 
        #                                                         decreasing=TRUE))))        
        
        #explanation of outliers
        library(plyr)
        splits <- dlply(stops_df, .(stops_df$range))   
        lapply(splits, nrow)
        counts_list <- lapply(splits, nrow)
        which.max(counts_list)
        detach(package:plyr)
        #possible to split into facets based on ranges of range
        
        
        #breaktypes
        qplot(mpx, data = stops_df)
        
        #an attempt to break up the df into more manageable pieces for plotting
        stoptype <- stops_df %>%
                group_by(range) %>%
                summarize(totalweft = sum(weft),
                          totalwarp = sum(warp),
                          totalother = sum(other))

        #ppm vs combinedstops
        combstops <- ggplot(stops_df, aes(ppm, combinedstops))
        combstops + geom_point(color = "red", size = .5, alpha = 1/3) + xlim(190,450) 
        
        #ppm vs weft
        weftstops <- ggplot(stops_df, aes(ppm, weft))
        weftstops + geom_point(color = "blue", size = 1, alpha = 1/2) + facet_grid(.~loom)
        
        #plotting ppm vs. warp based on specific range value
        warpstops <- ggplot(stops_df[stops_df$range == 1000,], aes(ppm, warp))
        warpstops2 <- ggplot(subset(stops_df, range = 1000), aes(ppm, warp)) #more readable
        library(dplyr) #dplyr option
        warpstops3 <- ggplot(filter(stops_df, range == 1000), aes(ppm, warp))
        warpstops + geom_point()
        warpstops2 + geom_point()
        warpstops3 + geom_point()
        
        #other stops
        otherstops
                
        #plotting against the date
        qplot(date, data=stops_df, geom="bar", weight = combinedstops)
        
        
        
        
        
}