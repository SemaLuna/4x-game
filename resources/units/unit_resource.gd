class_name UnitResource
extends Resource

signal died
signal hurt

## The name of the unit
@export var unit_name: String = 'Placeholder'
## The maximum health points of the unit
@export var max_health: int = 999
## The current health points of the unit
@export var current_health: int = 999:
    set(new_health):
        var amount = new_health - current_health
        current_health = new_health
        if (amount > 0):
            #TODO healing signal
            pass
        elif (amount < 0):
            if (current_health <= 0): died.emit()
            else: hurt.emit()

## The sprites representing the various animations of the unit
@export var animations: SpriteFrames = preload('res://resources/units/squire/squire_animations.tres')
## The actions this unit can take
@export var actions: Array[UnitActionResource]


# TODO
# @export var current_level: int
# @export var xp_to_level: int
# @export var xp_on_death: int
# @export var initiative: int
