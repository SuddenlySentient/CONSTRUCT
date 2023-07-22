extends Resource
class_name controler
var thinker : being
var actionlist : Array[action]

func setThinker(newThinker : being) :
	thinker = newThinker
	actionlist = thinker.actions

func thinkAndDo(newThinker : being = thinker) :
	setThinker(newThinker)
	pruneUnavailableActions()
	var chosenAction : action = actionlist[getRandomActionIndex()]
	var moveInfo : Dictionary = {
	"TargetPos": thinker.position + Vector3((randf() - 0.5) * 6, 0, (randf() - 0.5) * 6),
}
	print(thinker," : ",chosenAction.actionName)
	await chosenAction.activate(thinker, moveInfo)

func getRandomActionIndex() :
	if actionlist.size() < 2 : return 0
	return randi_range(0, actionlist.size() - 1)

func checkActionCosts(actionToTest : action) :
	for actionCost in actionToTest.actionCosts :
		if (actionCost.testCost(thinker) == false) : return false
	return true

func pruneUnavailableActions() :
	for listAction in actionlist : if (checkActionCosts(listAction) == false) : actionlist.erase(listAction)
