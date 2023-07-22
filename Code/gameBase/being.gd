extends Node3D
## Shared by all entities with stats, an inventory, and do actions when its their turn.
class_name being

var UUID : StringName = "0"

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
	stats.STA = clamp(stats.STA, 0, stats.maxSTA) 
	
	await brain.thinkAndDo(self)
	
	print(self," : TURN FINISH")
	
	gameMaster.nextTurn()

func getActions() :
	var newActionList : Array[action] = []
	
	newActionList.append(getMoveAction())
	for inventoryItem in heldInventory.itemList :
		if inventoryItem is weapon :
			newActionList.append(inventoryItem.getWeaponAction())
	for heldSpell in spells.spellList :
		newActionList.append(heldSpell)
	
	return newActionList

func die() :
	gameMaster.removeFromTurnOrder(self)
	self.queue_free()

func getMoveAction():
	var moveInstance = load("res://Actions/Special Actions/move.gd")
	return moveInstance.new()

func setMove(newMoveStart : Vector3, newMoveGoal : Vector3, moveTime : float = 1) :
	moveStart = newMoveStart
	moveGoal = newMoveGoal
	moveIncrement = 1.0 / moveTime
	moveDecimal = 0
	moveDone = false

var moveStart : Vector3
var moveGoal : Vector3
var moveDecimal : float
var moveIncrement : float
var moveDone : bool = true

func _process(delta):
	if (moveDone == false) :
		position = lerp(moveStart, moveGoal, moveDecimal)
		moveDecimal += moveIncrement * delta
		moveDecimal = clamp(moveDecimal, 0, 1)
		if (moveDecimal == 1) : 
			moveDone = true
