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
        
        # Orders millstyle breakdown fields
        breakdown <- 
                na.omit(breakdown) %>%
                select(millstyle,
                       loom, 
                       lbsperstyle,
                       numberofyarns,
                       perc_spun,
                       perc_twist,
                       perc_pur,
                       perc_dyed,
                       avgppm,
                       totalpx,
                       totalstops,
                       totalyards)

        return(breakdown)
}