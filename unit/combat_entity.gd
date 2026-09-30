extends Node

#TODO Review if these exports are necessary
@export var Health: Node # Healthbar, healing, death
@export var Action: Node # Attacks based on position, damage calc and more
@export var Experience: Node # Progress to next level, current level and more

@onready var sprite = $CombatSprite

# Relevant Stats
#var name
var initiative: int
#var current_battle_position
var valid_targets: Array

func _ready():
	sprite.play("idle")

#TODO Review Code to see if there are alternative ways to load the resource
func load_unit(unit_resource, ally: bool):
	if !ally:
		sprite.flip_h = true

	# Health Node
	$Health.unit_name = unit_resource.unit_name
	$Health.max_health = unit_resource.max_health
	#TODO adjust to load a unit that has less than max hp from previous battles?
	$Health.current_health = unit_resource.max_health

	# Action Node 
	$Action.load_actions(unit_resource.actions)

# Redundant function but uncertain if it is better this way for easier readability
func receive_damage(damage):
	$Health.take_damage(damage)

func _on_survive() -> void:
	sprite.play("hurt")
	await sprite.animation_finished
	sprite.play("idle")

func _on_death() -> void:
	sprite.play("death")
	await sprite.animation_finished
	queue_free()
