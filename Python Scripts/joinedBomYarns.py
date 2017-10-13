# joinedBomYarns.py is a function that joins the tables returned by the functions
# tidyBom.py and tidyYarns.py and manipulates the data to create an expanded bill of materials
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


def joinedBomYarns():
	# Load libraries and functions
	import pandas as pd 
	from tidyBom import  tidyBom
	from tidyYarns import tidyYarns

	# Set returned dataframe to local variables
	tidy_Bom = tidyBom() 
	tidy_Yarns = tidyYarns()

	# Merge Bom and Yarns
	tidy_BomYarns = pd.merge(tidy_Bom, tidy_Yarns, on = 'yarn', how = 'outer')


	# Create fields for pounds and number of yarns used per millstyle 
	millstyles = tidy_BomYarns.groupby('millstyle')
	totalLbs = (millstyles.agg({'totallbsperpiece' : 'sum',
								'yarn' : 'count'})
		    			  .rename(columns = {"lbsperpiece" : "totallbsperpiece",
		    			  					 "yarn" : "num_yarns"}))

	# Creates field for sum of yarn by type
	millstylesyarns = tidy_BomYarns.groupby('millstyle','type')
	sumtotal = (millstylesyarns.agg({'lbsperpiece': 'sum'})
							   .rename(columns = {"lbsperpiece" : "sumyarntype"))

	# Merge Fields 
	joined_lbsType = pd.merge(totalLbs, sumtype, left_index = True, right_index = True).reset_index()

	# Creates Perctange Field
	joined_lbsType = joined_lbsType.assign(perc_present = joined_lbsType.sumyarntype / joined_lbsType.totallbsperpiece)



	return joined_BomYarns 