extends Resource
class_name statlist

## The max health points of the being.
@export var maxHP : int = 1
## The health points of the being.
## Is set to the max hp on ready.
var HP : float = maxHP
## The max stamina of the being.
@export var maxSTA : int = 6
## The stamina of the being.
## Is set to maxHP on ready.
var STA : float = maxSTA
## The armor of the being.
## Reduces damage taken if the armor piercing of the attack is lower than this.
## Damage reduction = min(AP / ARM, 1).
@export var ARM : int = 1
## The speed of the being.
## The being can spend 1 stamina to move SPD meters.
@export var SPD : float = 1
## The available tokens of the being.
## Can be used to take up any singlular cost.
var token : int = 0
## The bonuses of this being 
@export var bonuses : Array[bonus]

func setStats(newMaxHP : int, newMaxSTA : int, newARM : int, newSPD : float, newBonuses : Array[bonus] = bonuses) :
	maxHP = newMaxHP
	maxSTA = newMaxSTA
	ARM = newARM
	SPD = newSPD
	bonuses = newBonuses
