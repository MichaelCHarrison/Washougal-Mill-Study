tidyBom <- function(){
        library(dplyr, lubridate)
        
        bom_tbl <- tbl_df(read.csv("~/Desktop/Pendleton/CSVs/Stops-MillStyleYarnBOMs.csv"))
        
        names(bom_tbl) <- tolower(names(bom_tbl))
        names(bom_tbl) <- sub("\\.", "", names(bom_tbl))
        colnames(bom_tbl)[1] <- "millstyle"
        bom_tbl$datelastused <- mdy(bom_tbl$datelastused)
        
        bom_tbl %>%
                select(millstyle, yarn, lbsperpiece, datelastused)
                
}