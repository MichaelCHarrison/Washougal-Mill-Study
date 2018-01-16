# Washougal Mill Study

## Objective
The objective of this study is to prototype a machine learning model to predict the number of failures a loom would experience 
during the course of a production cycle. 

## Data
The raw data located in the "CSVs" folder in this repository contains the following:

### M365 
Data listing of fabric woven at the Washougal mill between 07/15/15 and 12/16/16. Each record represents an individual piece, with unique 
piece numbers.  Details include loom#, woven date, and mill style (the left-most numeric string is the fabric range).
 
### Stops-Extract
Data listing of summary loom statistics including date, loom#, shift, fabric range (a numeric string), loom speed setting (picks per 
minute), picks produced (Mpx = 1000 mpicks), and loom stop summary (warp, fill, other, and combined).  Range values which 
are non-numeric should be excluded from this effort.  (The weave room deals with over 5000 loom stops per week, and 75 weeks of data 
would be a very large data set; but this data is not available at this time.)

### Stops-MillStyleYarnBOM 
Bill of material for each mill style.  The mill style key has some intermittent spaces which need to be removed in order to 
form the mill style.  The yarn BOM includes Yarn# and pounds per piece.

### Stops-xxxxYarns 
The four files discriminate among yarn types (purchased, spun, dyed and twisted) that are used in production.

## Scripts
tidyXXXX.R scripts serve as functions to clean the raw data from the sources above. The tables produced by the tidyXXXX.R scripts are then 
sourced by the joinedXXXX.R scripts which then joins them; the new data sets are then manipulated to engineer additional attributes for the bill of materials and production statistics. The productionBreakdown.R script joins the data sets produced by the joinedXXXX.R scripts 
to form the data set to be trained and tested upon. 

All .Rmd files that accompany the scripts above cover summary statistics and analysis for the data sets that each script produces. 

## Machine Learning Model Development 
The initialPredictions.Rmd file serves as the notebook that explores various methods to model the data. Data was partitioned, trained, validated, and tested using the Max Kuhn's caret package. A suite of different Machine Learning algorithms were compared to determine which best suited the objective's prediction goals based upon 10 K-fold cross validation. The impact of preprocessing the data (standardization and YeoJohnson) was also explored to optimize model output. In this notebook, a randomForest regressor model was tuned to optimal mtry and ntree values.
