tidyBom <- function(){
        library(dplyr); library(lubridate)
        
        bom_tbl <- tbl_df(read.csv("~/Desktop/Pendleton/CSVs/Stops-MillStyleYarnBOMs.csv"))
        
        names(bom_tbl) <- tolower(names(bom_tbl))
        names(bom_tbl) <- sub("\\.", "", names(bom_tbl))
        colnames(bom_tbl)[1] <- "millstyle"
        #millstyle set to factor to get intersect() to work; 09/06
        bom_tbl$millstyle <- trimws(bom_tbl$millstyle)
        bom_tbl$millstyle <- as.factor(bom_tbl$millstyle)
        bom_tbl$datelastused <- mdy(bom_tbl$datelastused)
        
        bom_tbl %>%
                select(millstyle, yarn, lbsperpiece, datelastused)
        return(bom_tbl)        
}