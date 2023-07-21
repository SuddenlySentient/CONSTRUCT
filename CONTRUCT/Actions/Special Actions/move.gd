extends action



func _init() :
	var moveCost : cost = cost.new()
	moveCost.setCost(1, 1)
	@warning_ignore("int_as_enum_without_cast")
	setAction("Move", [moveCost], [1])

func doAction() :
	var distanceBetween = user.position.distance_to(targetPos)
	var angleNormalized = Vector3(user.position.x, user.position.y,user.position.z).direction_to(Vector3(targetPos.x, user.position.y,targetPos.z))
	var moveGoal = user.position + (angleNormalized * clamp(distanceBetween, 0, 4))
	user.setMove(user.position, moveGoal, 1)
	while (user.moveDecimal != 1) :
		await user.get_tree().process_frame
	return true
