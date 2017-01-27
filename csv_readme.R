## M365 is a data listing of fabric woven at the Washougal mill between 07/15/15 and 12/16/16.  
## Each record represents an individual piece, with unique piece numbers.  Details include loom#, 
## woven date, and mill style (the left-most numeric string is the fabric range).
## 
## Stops-Extract is a data listing of summary loom statistics including date, loom#, shift, fabric 
## range (a numeric string), loom speed setting (picks per minute), picks produced 
## (Mpx = 1000 mpicks), and loom stop summary (warp, fill, other, and combined).  Range values which 
## are non-numeric should be excluded from this effort.  (The weave room deals with over 5000 loom 
## stops per week, and 75 weeks of data would be a very large data set; but this data is not 
## available at this time.)
## 
## Stops-MillStyleYarnBOM is the bill of material for each mill style.  The mill style key has some 
## intermittent spaces which need to be removed in order to form the mill style.  The yarn BOM 
## includes Yarn# and pounds per piece.
##
## Stops-xxxxYarns (4 files) are adequate to discriminate among yarn types (purchased, spun, dyed 
## and twisted).