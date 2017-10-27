# tidyBom.R is a function that cleans data from the Stops-MillStyleYarnBOMs.csv file.

tidyBom <- function(){
        # Load necessary packages
        library(dplyr)
        
        # Read in data and set to local variable 
        bom_tbl <- tbl_df(read.csv("~/Washougal-Mill-Study/CSVs/Stops-MillStyleYarnBOMs.csv"))
        
        # Cleans names of fields
        names(bom_tbl) <- tolower(names(bom_tbl))
        names(bom_tbl) <- sub("\\.", "", names(bom_tbl))
        colnames(bom_tbl)[1] <- "millstyle"
        
        # Removes whitespace and sets millstyle to factor variable
        bom_tbl$millstyle <- gsub(" ", "", bom_tbl$millstyle, fixed = TRUE)
        bom_tbl$millstyle <- as.factor(bom_tbl$millstyle)
        
        # Selects and orders fields from table
        bom_tbl <- 
                bom_tbl %>%
                select(millstyle, yarn, lbsperpiece) 
        
        # Returns table
        return(bom_tbl)
}