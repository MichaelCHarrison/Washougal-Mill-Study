# tidyStops.py is a function that cleans data from the Stop-Extract.csv file.

def tidyStops():
	import pandas as pd 

	# Read in data and set to local variable
	stops_filename = '~/Desktop/Pendleton/CSVs/Stops-Extract.csv'
	stops_df = pd.read_csv(stops_filename)

	# Clean column names
	stops_df.columns = map(str.lower, stops_df.columns)
	stops_df.columns = stops_df.columns.str.replace(" ", "")

	# Rename column name to 'loom'
	stops_df = stops_df.rename(columns = {'lm#':'loom'})

	# Remove Experimental Values
	stops_df = stops_df[stops_df['range'].str.contains("EX|ex") == False]

	# Set date field to date time data type
	stops_df['date'] = pd.to_datetime(stops_df['date'])

	return stops_df