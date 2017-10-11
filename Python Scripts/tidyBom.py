# tidyBom.py is a function that cleans data from the Stops-MillStyleYarnBOMs.csv file.

def tidyBom():
	# Load libraries
	import pandas as pd

	# Read in data and set to local variable
	bom_filename = "~/Desktop/Pendleton/CSVs/Stops-MillStyleYarnBOMs.csv"
	bom_df = pd.read_csv(bom_filename)

	# Clean names of fields
	bom_df.columns = map(str.lower, bom_df.columns)

	# Renames millstyle field
	bom_df = bom_df.rename(columns = {'millstylekey' : 'millstyle', 'yarn#' : 'yarn'})

	# Remove Whitespace
	bom_df['millstyle'] = bom_df['millstyle'].str.replace(" ", "")

	# Drop Date column
	bom_df = bom_df.drop('datelastused', axis = 1)

	return bom_df