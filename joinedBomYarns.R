# joinedBomYarns.R is a function that joins the tables returned by the functions
# tidyBom.R and tidyYarns.R and manipulates the data to create an expanded bill of materials
# for each millstyle. The fields generated through manipulation include:  
#
#       totallbsperpiece - total pounds of yarn used in a piece of a given millstyle
#       num_yarns - total number of yarns used in millstyle  
#       num_spun -  number of spun yarns used in millstyle
#       num_pur - number of purchased yarns used in millstyle
#       num_dyed - number of dyed yarns used in millstyle
#       lbs_spun - pounds of spun yarns use in millstyle 
#       lbs_pur - pounds of purchased yarn used in millstyle
#       lbs_dyed - pounds of dyed yarn used in millstyle
#       perc_spun - percentage of spun yarns in millstyle
#       perc_pur - percentage of purchased yarns in millstyle
#       perc_dyed - percentage of dyed yarns in millstyle


joinedBomYarns <- function(){
        # Load necessary library; sources functions needed to return tables tables to be joined
        library(dplyr)
        source("tidyYarns.R"); source("tidyBom.R")
        
        # Set returned tables to local variable
        tidy_yarns <- tidyYarns()
        tidy_Bom <- tidyBom()
        
        # Join Bill of Materials and Yarn list
        tidy_BomYarns <- merge(tidy_Bom, 
                               tidy_yarns, 
                               by = "yarn",
                               all = TRUE)
        
        # Calculate pounds and number of yarns used per in millstyle
        totalLbs <- 
                tidy_BomYarns %>%
                group_by(millstyle) %>%
                summarise(totallbsperpiece = sum(lbsperpiece),
                          #changed field name from "totallbsper; potential bug,
                          num_yarns = n_distinct(yarn))
        
        
        # Calculates pounds of yarn type per piece
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
        joined_LbsPerc <- na.omit(joined_LbsPerc)
        ## NOTE: The process of omitting NAs eliminates any type == "Twist" from the 
        ## table; consequent table manipulations involving the "Twist" type will be
        ## commented out

        
        # Field mutations to generate number, pounds, and percentages of type of yarns
        # in millstyle
        added_Perc <- 
                joined_LbsPerc %>%
                group_by(millstyle, type) %>%
                mutate(perc_present = sumyarntype/totallbsperpiece,
                       # Calculates the number of each yarn type in millstyle
                       num_spun = ifelse(test = (type == "Spun"), 
                                         yes = n(),
                                         no = 0),
                       # num_twist = ifelse(test = (type == "Twist"), 
                       #                    yes = n(),
                       #                    no = 0),
                       num_pur = ifelse(test = (type == "Pur"), 
                                        yes = n(),
                                        no = 0),
                       num_dyed = ifelse(test = (type == "Dye"), 
                                         yes = n(),
                                         no = 0),
                       # Calculates the weight of each yarn type in millstyle
                       lbs_spun = ifelse(test = (type == "Spun"), 
                                          yes = sumyarntype,
                                          no = 0),
                       # lbs_twist = ifelse(test = (type == "Twist"), 
                       #                     yes = sumyarntype,
                       #                     no = 0),
                       lbs_pur = ifelse(test = (type == "Pur"), 
                                         yes = sumyarntype,
                                         no = 0),
                       lbs_dyed = ifelse(test = (type == "Dye"), 
                                          yes = sumyarntype,
                                          no = 0),
                       # Calculates the percentage of each yarn type in millstyle
                       perc_spun = ifelse(test = (type == "Spun"), 
                                          yes = perc_present,
                                          no = 0),
                       # perc_twist = ifelse(test = (type == "Twist"), 
                       #                     yes = perc_present,
                       #                     no = 0),
                       perc_pur = ifelse(test = (type == "Pur"), 
                                         yes = perc_present,
                                         no = 0),
                       perc_dyed = ifelse(test = (type == "Dye"), 
                                          yes = perc_present,
                                          no = 0))
        
        
        # Removes unnecessary fields
        joined_BomYarns <- 
                added_Perc %>%
                ungroup() %>% 
                select(-yarn, -lbsperpiece, -type, -sumyarntype, -perc_present)
        
        # Reorders table fields
        joined_BomYarns <-
                joined_BomYarns %>%
                ungroup() %>%
                group_by(millstyle) %>%
                mutate(lbs_spun = max(lbs_spun),
                       #lbs_twist = max(lbs_twist),
                       lbs_pur = max(lbs_pur),
                       lbs_dyed = max(lbs_dyed),
                       num_spun = max(num_spun),
                       #num_twist = max(num_twist),
                       num_pur = max(num_pur),
                       num_dyed = max(num_dyed),
                       perc_spun = max(perc_spun),
                       #perc_twist = max(perc_twist),
                       perc_pur = max(perc_pur),
                       perc_dyed = max(perc_dyed))
        
        
        joined_BomYarns <- unique(joined_BomYarns)
        return(joined_BomYarns)
}