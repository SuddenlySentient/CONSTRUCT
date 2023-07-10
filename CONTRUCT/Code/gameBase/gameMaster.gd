extends Node
##
var turnOrder : Array[being]
##
var turnCounter : int = -1
##
var miniTurnCounter : int = -1

func _ready():
	newBattle()

## starts a new battle
func newBattle():
	for child in get_children():
		if child is being:
			turnOrder.append(child)
	turnOrder.sort_custom(sort_by_authority)
	turnCounter = 1
	miniTurnCounter = 0
	turnOrder.front().turn()

# CHANGE THIS TO AUTHORITY ROLLS LATER!
# MUST BE DETERMINISTIC! SO HAVE THE ROLLS BE DONE BEFORE YOU SORT
##
func sort_by_authority(a, b):
	if a[0].SPD < b[0].SPD:
		return true
	return false

## Call this to start the next turn
func nextTurn():
	var previousActive : being = turnOrder.front()
	turnOrder.pop_front()
	turnOrder.push_back(previousActive)
	var nextActive : being = turnOrder.front()
	if miniTurnCounter == turnOrder.size() :
		turnCounter =+ 1
		miniTurnCounter = 0

## Call this to remove something from the turn order
func removeFromTurnOrder(removeThis : being):
	var indexOfThingThatMustBeRemovedAtOnce = turnOrder.find(removeThis)
	turnOrder.remove_at(indexOfThingThatMustBeRemovedAtOnce)
