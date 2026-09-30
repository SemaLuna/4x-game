extends Node2D

@export var HealthNode: Node # Healthbar, healing, death
@export var ActionNode: Node # Attacks based on position, damage calc and more
@export var ExperienceNode: Node # Progress to next level, current level and more

# Potentially Relevant Stats or new nodes to consider
#var current_battle_position

func _ready():
	

func load_unit(unit_resource, ally):
	pass

func death():
	pass
