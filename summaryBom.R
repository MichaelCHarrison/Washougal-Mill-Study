summaryBom <- function(data, style){
        library(dplyr)
        
        summaryBom <- data
        summaryBom %>%
                filter(grepl(style, millstyle)) %>%
                print()
}