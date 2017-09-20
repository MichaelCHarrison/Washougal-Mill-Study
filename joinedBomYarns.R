joinedBomYarns <- function(){
        library(dplyr)
        source("tidyYarns.R"); source("tidyBom.R")
        
        # Set returned dataframe to variable
        tidy_yarns <- tidyYarns()
        tidy_Bom <- tidyBom()
        
        # Join Bill of Materials and Yarn list
        tidy_BomYarns <- merge(tidy_Bom, 
                               tidy_yarns, 
                               by = "yarn",
                               all = TRUE)
        
        # Calculate pounds per style and number of yarns in style
        totalLbs <- 
                tidy_BomYarns %>%
                group_by(millstyle) %>%
                summarise(num_yarns = n_distinct(yarn),
                          totallbsper = sum(lbsperpiece))
        
        
        # Calculates percentage of yarn type per piece
        sumtotal <-
                tidy_BomYarns %>%
                group_by(millstyle, type) %>%
                mutate(sumyarntype = sum(lbsperpiece))
        
        
        # Joins Percentages and yarn information
        joined_LbsPerc <- 
                merge(totalLbs,
                      sumtotal,
                      by = "millstyle",
                      all.x = TRUE)
        
        added_Perc <- 
                joined_LbsPerc %>%
                group_by(millstyle, type) %>%
                mutate(perc_present = sumyarntype/totallbsper,
                       perc_spun = ifelse(test = (type == "Spun"), 
                                          yes = perc_present,
                                          no = 0),
                       perc_twist = ifelse(test = (type == "Twist"), 
                                           yes = perc_present,
                                           no = 0),
                       perc_pur = ifelse(test = (type == "Pur"), 
                                         yes = perc_present,
                                         no = 0),
                       perc_dyed = ifelse(test = (type == "Dye"), 
                                          yes = perc_present,
                                          no = 0),
                       perc_na = ifelse(test = (is.na(type)),
                                        yes = perc_present,
                                        no = 0),
                       num_spun = ifelse(test = (type == "Spun"), 
                                          yes = perc_present,
                                          no = 0),
                       num_twist = ifelse(test = (type == "Twist"), 
                                           yes = perc_present,
                                           no = 0),
                       num_pur = ifelse(test = (type == "Pur"), 
                                         yes = perc_present,
                                         no = 0),
                       num_dyed = ifelse(test = (type == "Dye"), 
                                          yes = perc_present,
                                          no = 0),
                       num_na = ifelse(test = (is.na(type)),
                                        yes = perc_present,
                                        no = 0))
        
        
}