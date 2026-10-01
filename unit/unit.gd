@tool
extends Node

## The resource file that contains all of the unit statistics
@export var base_unit_resource: UnitResource
var unit_resource: UnitResource

func _ready():
	if (base_unit_resource != null):
		unit_resource = base_unit_resource.duplicate(false)
		configure_unit()

func configure_unit():
	$Health.configure(unit_resource)
	configure_sprite()

func configure_sprite():
	$CombatSprite.sprite_frames = unit_resource.animations
	$CombatSprite.play("idle")

func update_health(delta: int):
	$Health.update_health(delta)

func _on_survive() -> void:
	$CombatSprite.play("hurt")
	await $CombatSprite.animation_finished
	$CombatSprite.play("idle")

func _on_death() -> void:
	$CombatSprite.play("death")
	await $CombatSprite.animation_finished
	queue_free()

func _get_configuration_warnings():
	var warnings = []

	if base_unit_resource is not UnitResource:
		warnings.append("Must specify a valid resource for this unit")

	return warnings


func _on_timer_timeout() -> void:
	update_health(-5)
