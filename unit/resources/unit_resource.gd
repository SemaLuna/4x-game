extends Resource
class_name UnitResource

## The name of the unit
@export var unit_name: String = ''
## The maximum health points of the unit
@export var max_health: int = 0
## The current health points of the unit
@export var current_health: int = 0:
    set(new_health):
        var delta = new_health - current_health
        if (delta != 0):
            current_health = new_health
## The sprites representing the various animations of the unit
@export var animations: SpriteFrames