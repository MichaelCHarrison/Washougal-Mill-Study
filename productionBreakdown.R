# This function joins the returned tables from the joinedBomYarns.R and joinedM365Stops.R 
# functions. The product of the join is to be used for predictive analysis. 

productionBreakdown <- function(){
        # load necessary library; sources functions needed to return tables to be joined
        library(dplyr);
        source("joinedBomYarns.R"); source("joinedM365Stops.R")
        
        # Set returned dataframe to variable
        joined_BomYarns <- joinedBomYarns()
        joined_M365Stops <- joinedM365Stops()

        # Join the returned tables
        breakdown <- merge(joined_BomYarns, 
                           joined_M365Stops, 
                           by = "millstyle", 
                           all=TRUE)
        # Removes range feature; unnecessary for predictive analysis
        breakdown <-
                breakdown %>%
                select(-range)
        
        # Sets loom as factor variable for predictive analysis
        breakdown$loom <- as.factor(breakdown$loom)
        
        return(breakdown)
}