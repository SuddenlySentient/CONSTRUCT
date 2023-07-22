extends item
##
class_name weapon

##
enum typeEnum {
Primary = 0,
Secondary = 1,
}
##
@export var type : typeEnum
##
@export var DMG : float
##
@export var AP : int = 1
##
@export var RNG : float
##
@export var useCost : Array[cost]
##
enum abiltyEnum {
MultiTarget = 0,
KnockShields = 1,
ReactionRNG = 2,
}
##
@export var abilities : Array[abiltyEnum]
var weaponAction : action = getWeaponAction()

func getWeaponAction() :
	return weaponAction
