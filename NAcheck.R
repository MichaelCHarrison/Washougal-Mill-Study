#Function to check for NAs in dataframes

NAcheck <- function(data){
        sapply(data, function(x) sum(is.na(x)))
}