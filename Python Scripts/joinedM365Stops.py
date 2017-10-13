# joinedM365Stops.py is a function that joins the tables returned from the tidyM365.py  and 
# tidyStops.py. The joined table is then grouped by date, range, millstyle, and loom to 
# engineer 4 features and the prediction target based on the production data from tidyM365.R: 
#
#       avgppm - average picks per minute
#       totalpx - total picks
#       totalyards - total yards
#       yardsperpx - yards per pick
#       totalstops - total stops (prediction target)


def joinedM365Stops():
	# Load libraries and functions
	import pandas as pandas
	from tidyM365 import tidyM365
	from tidyStops import tidyStops

	# Set returned dataframe to local variables
	tidy_M365 = tidyM365()
	tidy_stops = tidyStops()

	# Merge dataframes
	tidy_M365Stops = pd.merge(tidy_M365, tidy_stops, on = ['date', 'loom', 'range'], how = 'inner')

	# calculate fields
	groupby = tidy_M365Stops.groupby(['date', 'range', 'millstyle', 'loom'])
	joined_M365Stops = (groupby.agg({'ppm' : 'mean',
									'mpx' : 'sum',
									'yds' : 'sum',
									'combinedstops' : 'sum'})
							.rename(columns = {'ppm' : 'avgppm',
											'mpx' : 'totalpx',
											'yds' : 'totalyards',
											'combinedstops' : 'totalstops'}))
	joined_M365Stops = joined_M365Stops.assign(yardsperpx = joined_M365Stops['totalyards'] / joined_M365Stops['totalpx'])

	# Select and order fields
	joined_M365Stops = joined_M365Stops[['date','loom','range','millstyle','avgppm','totalpx','totalyards', 'yardsperpx', 'totalstops']]

	return joined_M365Stops.reset_index()


