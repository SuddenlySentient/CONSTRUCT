extends Resource
##
class_name item

##
@export var itemName : String
##
enum weightEnum {
veryLight = 0,
light = 1,
medium = 2,
heavy = 3,
veryHeavy = 4,
}
##
@export var weight : weightEnum = weightEnum.medium
