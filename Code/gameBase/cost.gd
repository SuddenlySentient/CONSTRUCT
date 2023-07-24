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

var debugMode : bool = false

## Sets the type and amount of this cost.
## You can optionally set the component.
## returns itself
func _init(setType : int, setAmount : float, setComponent : component = null):
	@warning_ignore("int_as_enum_without_cast")
	costType = setType
	requiredAmount = setAmount
	requiredComponent = setComponent

## Tests to see if the being specified in the parameter can pay this cost.
func testCost(costee : being):
	match costType :
		typeEnum.HP : 
			if costee.stats.HP >= requiredAmount : 
				if (debugMode) : print(costee," : HP test passed!")
				return true
			else :
				if (debugMode) : print(costee," : HP test failed!")
		typeEnum.STA : 
			if costee.stats.STA >= requiredAmount : 
				if (debugMode) : print(costee," : STA test passed!")
				return true
			else :
				if (debugMode) : print(costee," : HP test failed!")
		typeEnum.Token : 
			if costee.stats.token >= requiredAmount : 
				if (debugMode) : print(costee," : Token test passed!")
				return true
			else :
				if (debugMode) : print(costee," : HP test failed!")
		typeEnum.Component :
			var componentAmount = 0
			for invetoryItem in costee.inventory : if invetoryItem == requiredComponent : componentAmount += 1
			if componentAmount >= requiredAmount : 
				if (debugMode) : print(costee," : component test passed!")
				return true
			else :
				if (debugMode) : print(costee," : HP test failed!")
	
	return false

func takeCost(costee : being) :
	match typeEnum :
		typeEnum.HP : costee.stats.HP -= requiredAmount
		typeEnum.STA : costee.stats.STA -= requiredAmount
		typeEnum.Token : costee.stats.token -= requiredAmount
		typeEnum.Component :
			for x in requiredAmount : costee.heldInventory.itemList.erase(requiredComponent)
