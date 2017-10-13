# productionBreakdown.py is a function that joins the tables returned by joinedBomYarns.py 
# and joinedM365Stops.py. The product of the join is to be used for predictive analysis 
# where the goal will be to predict total stops for a bill of materials.

def productionBreakdown():
	# Load libraries and functions
	import pandas as pd 
	from joinedBomYarns import joinedBomYarns
	from joinedM365Stops import joinedM365Stops

	# Set returned tables to local variable
	joined_BomYarns = joinedBomYarns()
	joined_M365Stops = joinedM365Stops()

	# Join tables
	breakdown = pd.merge(joined_BomYarns, joined_M365Stops, on = "millstyle", how = "outer")

	# Drop range column ## Does this need to be dropped? Is there uniformity across range?
	breakdown = breakdown.drop('range', 1)



	return breakdown