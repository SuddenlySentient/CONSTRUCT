extends Node3D
## Shared by all entities with stats, an inventory, and do actions when its their turn.
class_name being

## The stats of the being.
@export var stats : statlist
## The spells of this being.
@export var spells : spellBook
## The inventory of this being.
@export var heldInventory : inventory
## The controler of this being.
@export var brain : controler
## The actions this being can do.
var actions : Array[action] = []
## The game master responsable for this being's turns
@onready var gameMaster = self.get_parent()



## Called when it is this being's turn
func turn() :
	actions = getActions()
	stats.STA += stats.maxSTA
	stats.STA = max(stats.STA, stats.maxSTA) 
	
	await brain.thinkAndDo()
	
	gameMaster.nextTurn()

func getActions() :
	var newActionList : Array[action] = []
	for inventoryItem in heldInventory.itemList :
		if inventoryItem is weapon :
			newActionList.append(inventoryItem.getWeaponAction())
	for heldSpell in spells.spellList :
		newActionList.append(heldSpell)
	return newActionList

func die() :
	gameMaster.removeFromTurnOrder(self)
	self.queue_free()
