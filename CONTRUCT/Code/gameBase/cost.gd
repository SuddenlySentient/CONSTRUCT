extends Resource
## A cost with 5 available types. Usually for actions
class_name cost

## Enum for cost types.
enum typeEnum {
HP = 0,
STA = 1,
Token = 2,
Component = 3,
Delay = 4
}
## The type of this cost. defaults to stamina.
@export var costType : typeEnum = typeEnum.STA
## The amount of the cost type needed.
@export var requiredAmount : float = 1
## The required component if this cost requires a component
@export var requiredComponent : component

## Sets the type and amount of this cost.
## You can optionally set the component.
## returns itself
func setCost(setType : int, setAmount : float, setComponent : component = requiredComponent):
	costType = setType
	requiredAmount = setAmount
	requiredComponent = setComponent
	return self

## Tests to see if the being specified in the parameter can pay this cost.
func testCost(costee : being):
	
	var costeeStats = costee.stats
	match typeEnum :
		typeEnum.HP : if costeeStats.HP >= requiredAmount : return true
		typeEnum.STA : if costeeStats.STA >= requiredAmount : return true
		typeEnum.Token : if costeeStats.token >= requiredAmount : return true
		typeEnum.Component :
			var componentAmount = 0
			for invetoryItem in costee.inventory : if invetoryItem == requiredComponent : componentAmount + 1
			if componentAmount >= requiredAmount : return true
	
	return false
