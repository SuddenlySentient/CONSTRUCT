extends action
## A variation of an action.
## Has several types.
class_name spell

## Enum for spell types.
enum spellTypeEnum {
Ranged = 0,
Strategic = 1,
Support = 2,
Physical = 3,
Utility = 4,
Summoning = 5,
Other = 6
}
## The type of this spell.
## Defaults to other.
@export var spellType : spellTypeEnum = spellTypeEnum.Other
