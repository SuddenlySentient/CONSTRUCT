extends item
##
class_name component

##
@export var cost : int = 1
##
enum typeEnum {
simple = 0,
complex = 1,
food = 2,
potion = 3,
}
##
@export var type : typeEnum
##
@export var properties : Array[String]
