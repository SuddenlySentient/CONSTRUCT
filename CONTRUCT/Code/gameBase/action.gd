extends Resource
## An action.
## It has a name, and array of costs, and an activation period.
class_name action

## The name of the action.
var actionName : String
## The costs of the action.
@export var actionCosts : Array[cost]
## Enum for activation periods.
enum activePeriodEnum {
Turn = 0,
Reaction = 1,
OutOfCombat = 2,
Passive = 3
}

## The period that the action is able to be used.
## defaults to turn.
@export var activePeriod : activePeriodEnum = activePeriodEnum.Turn

# NO LONGER NEEDED, 
# YOU CAN EXPORT OBJECTS NOW
#func prepareCosts(): 
#	# this turns the actionCostsExport array into actual cost objects
#	# call this when you make a new action 
#	
#	for x in actionCostsExport.size():
#		
#		var newCost = cost.instantiate()
#		newCost.type = actionCostsExport[x].type
#		newCost.amount = actionCostsExport[x].amount
#		if newCost.type == 3 : newCost.requiredComponent = actionCostsExport[x].component
#		actionCosts[x] = newCost

## Use this to do this action.
## Be sure to take away the costs first!
func activate():
	pass
