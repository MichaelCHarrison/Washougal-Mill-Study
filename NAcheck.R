#Function to check for NAs in dataframes

checkNA <- function(data){
        sapply(data, function(x) sum(is.na(x)))
}

# for NAs in tidy_m365$duedate, determine whether to remove rows, 
# disregard value, or remove entirely
#
# for NAs in tidy_m365$order, determine whether this affects the ability to compress the 
# data in compressedM365.R and if that has an relevance on how 

returnNARows <- function(data){
        data[rowSums(is.na(data)) > 0,]
}