extends being



func _enter_tree():
	stats = instantiateStats()
	spells = instantiateSpells()
	heldInventory = instantiateInventory()

func instantiateStats() :
	var newCguardStats : statlist = statlist.new()
	newCguardStats.setStats(
	randi_range(6, 9),			#HP
	randi_range(4, 7),			#STA
	randi_range(2, 3),			#ARM
	)
	return newCguardStats

func instantiateSpells() :
	var newCguardspells : spellBook = spellBook.new()
	if (randi_range(1, 4) == 4) :
		pass #CHANGE THIS WHEN YOU ACTUALLY HAVE SPELLS!
	return newCguardspells

func instantiateInventory() :
	var newCguardInventory : inventory = inventory.new()
	
	var KCoin = load("res://Items/Components/KCoin.tres")
	var KCoinX8 = []
	KCoinX8.resize(8)
	KCoinX8.fill(KCoin)
	for x in randi_range(1, 4) : newCguardInventory.itemList.append_array(KCoinX8)
	var mainWeapon : weapon
	if (randi_range(0, 1) == 1) : mainWeapon = load("res://Items/Weapons/longSword.tres")
	else : mainWeapon = load("res://Items/Weapons/spear.tres")
	newCguardInventory.itemList.append(mainWeapon)
	
	#ADD A CHANCE FOR A SHIELD WHEN YOU ACTUALLY HAVE SHIELDS!
	
	return newCguardInventory
