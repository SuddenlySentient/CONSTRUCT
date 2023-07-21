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
@export var activePeriods : Array[activePeriodEnum] = [activePeriodEnum.Turn]

var user : being 
var actionInfo : Dictionary

func setAction(newName : String, newCosts : Array[cost], newPeriod : Array[activePeriodEnum]) :
	actionName = newName
	actionCosts = newCosts
	activePeriods = newPeriod

## Use this to do this action.
func activate(newUser : being, actionInfo : Dictionary):
	user = newUser
	if (takeCosts()) :
		if (await doAction()) : return true
		else : return false
	else :
		return false

func takeCosts():
	var successful : bool = true
	for x in actionCosts : if (x.testCost(user) == false) : successful = false
	if (successful) : 
		for x in actionCosts : x.takeCost(user)
		return true
	else : 
		print(user , " : ", actionName," : failed to take costs!")
		return false

func doAction() :
	return true
