# Function to check the number of NAs for a given field in the data

checkNA <- function(data){
        sapply(data, function(x) sum(is.na(x)))
}

# returnNARows() returns the rows for which NAs are present
returnNARows <- function(data){
        data[rowSums(is.na(data)) > 0,]
}