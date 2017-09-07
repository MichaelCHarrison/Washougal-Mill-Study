millstyleBreakdown <- function(){
        library(dplyr);
        source(tidyYarns.R); source(tidyBom.R); source(tidyStops())
        
        tidy_yarns <- tidyYarns()
        tidy_m365 <- tidyBom()
        tidy_stops <- tidyStops()
        
        #create empty dataframe
        breakdown <- data.frame(millstyle = character(0),
                                percent_pur = numeric(0),
                                percent_twist = numeric(0),
                                percent_dyed = numeric(0),
                                percent_spun = numeric(0),
                                num_yarns = integer(0),
                                totalLbs = numeric(0))
        
        
        millstyles <- unique(tidy_yarns$millstyle)
        
        # uniqueMill <- 
        # uniqueMill <- 

        # As the dataframe is compiled, will need to think about how to deal with NA values
        
        
        library(sqldf)
        breakdown <- sqldf("SELECT
                           FROM 
                           JOIN ")
        #https://stackoverflow.com/questions/1299871/how-to-join-merge-data-frames-inner-outer-left-right
        
}