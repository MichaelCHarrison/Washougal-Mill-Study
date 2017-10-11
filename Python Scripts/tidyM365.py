# tidyM365.py is a function that cleans data from the Stops-MillStyleYarnBOMs.csv file.

def tidyM365():
	# Load Libraries
	import pandas as pd

	# Read in data and set to local variable
	M365_filename = "~/Desktop/Pendleton/CSVs/M365.csv"
	M365_df = pd.read_csv(M365_filename)

	# Cleans column names
	M365_df.columns = map(str.lower, M365_df.columns)
	M365_df.columns = M365_df.columns.str.replace(" ", "")

	# Removes experimental millstyles
	M365_df = M365_df[M365_df['millstyle'].str.contains("EX") == False]

	# Add range field
	M365_df['range'] = pd.Series()
	M365_df['range'] = M365_df['millstyle'].str.extract('^(.*?)(-|[A-Z]).*', expand = True)

	# Sets date field as datetime data type
	M365_df['date'] = pd.to_datetime(M365_df['date'])

	# Selects and orders dataframe fields
	M365_df = M365_df[['range', 'millstyle', 'order', 'duedate', 'date', 'yds', 'loom']]

	return M365_df