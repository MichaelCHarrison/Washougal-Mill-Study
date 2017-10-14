# tidyYarns.py is a function that reads in data from the 4 csvs pertaining to yarn type 
# (purchased, twist, dyed, and spun) and binds them into a single table. The function then 
# cleans the table

def tidyYarns():
	import pandas as pd

	# Read in data and concatenate into single dataframe
	pur_filename = "~/Desktop/Pendleton/CSVs/Stops-PurchasedYarns.csv"
	twist_filename = "~/Desktop/Pendleton/CSVs/Stops-TwistYarns.csv"
	dyed_filename = "~/Desktop/Pendleton/CSVs/Stops-DyedYarns.csv"
	spun_filename = "~/Desktop/Pendleton/CSVs/Stops-SpunYarns.csv"

	yarn_filename = [pur_filename, twist_filename, dyed_filename, spun_filename]
	yarns_list = []
	for yarn in yarn_filename:
		yarns_list.append(pd.read_csv(yarn))
	yarns_df = pd.concat(yarns_list)

	# Clean columns names
	yarns_df.columns = map(str.lower, yarns_df.columns)
	yarns_df = yarns_df.rename(columns = {'yarn#':'yarn'})

	# Select and order columns
	yarns_df = yarns_df[['yarn', 'type']]

	# Drop duplicate rows
	yarns_df = yarns_df.drop_duplicates(['type','yarn'], inplace = False)

	return yarns_df