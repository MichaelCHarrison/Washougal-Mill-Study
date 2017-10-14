# productionModel.py is a 

def predictStops():
	# Load libraries and functions
	from sklearn.model_selection import KFold
	from sklearn.model_selection import cross_val_score
	from sklearn.ensemble import RandomForestClassifier
	from productionBreakdown import productionBreakdown

	# Set returned table to local variable
	production = productionBreakdown()

	# 
	num_cols = len(production.columns)
	predictors = array[:, 0:num_cols]
	target = array[:, num_cols]

	# Random Forest
	seed = 7
	num_trees = 2300
	max_features = 3
	kfold = KFold(n_splits=10, random_state = seed)
	model = RandomForestClassifier(n_estimators = num_trees,
		max_features = max_features)
	results = cross_val_score(model, predictors, target, cv=kfold)

	