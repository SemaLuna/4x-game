extends Node

@export var HealthNode: Node # Healthbar, healing, death
@export var ActionNode: Node # Attacks based on position, damage calc and more
@export var ExperienceNode: Node # Progress to next level, current level and more

@onready var sprite = $CombatSprite

# Potentially Relevant Stats or new nodes to consider
#var current_battle_position

func _ready():
	sprite.play("idle")

func load_unit(unit_resource, ally: bool):
	if !ally:
		sprite.flip_h = true

	#TODO assign unit name to a label




func death():
	pass
