millstyleBreakdown <- function(){
        library(dplyr);
        source("joinedBomYarns.R"); source("joinedM365Stops.R")
        
        # Set returned dataframe to variable
        joined_BomYarns <- joinedBomYarns()
        joined_M365Stops <- joinedM365Stops()

        # Join the joined dataframes
        breakdown <- merge(joined_BomYarns, 
                           joined_M365Stops, 
                           by = "millstyle", 
                           all=TRUE)
        breakdown <-
                breakdown %>%
                select(-range)

        breakdown$loom <- as.factor(breakdown$loom)
        
        return(breakdown)
}