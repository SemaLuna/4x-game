@tool
extends Node

var unit_resource: UnitResource
var hovered: bool = false
@onready var health_bar = $HealthContainer/HealthBar
@onready var health_label = $HealthContainer/HealthLabel

# Map variables from resource for easier access
var current_health: int:
	get: return unit_resource.current_health
	set(value): unit_resource.current_health = value
var max_health: int:
	get: return unit_resource.max_health
var unit_name: String:
	get: return unit_resource.unit_name

const TEXT_RED: Texture2D = preload("res://unit/resources/tres/red_health.tres")
const TEXT_ORANGE: Texture2D = preload("res://unit/resources/tres/orange_health.tres")
const TEXT_GREEN: Texture2D = preload("res://unit/resources/tres/green_health.tres")

signal survive
signal death

func configure(_unit_resource: UnitResource):
	unit_resource = _unit_resource
	update_health_bar()
	update_label()

func update_health(delta: int):
	var new_health = current_health + delta
	if (new_health < 0): new_health = 0
	else: if (new_health > max_health): new_health = max_health
	current_health = new_health

	update_health_bar()
	update_label()
	if current_health == 0: death.emit()
	else: survive.emit()

func update_health_bar():
	health_label.text = str(current_health)
	var percent_health = float(current_health) / max_health * 100
	health_bar.value = percent_health
	print(percent_health)
	if percent_health < 30.0:
		health_bar.set_progress_texture(TEXT_RED)
	elif percent_health < 60.0:
		health_bar.set_progress_texture(TEXT_ORANGE)
	else:
		health_bar.set_progress_texture(TEXT_GREEN)

func update_label():
	health_label.text = unit_name if hovered else str(current_health)

func _on_health_label_mouse_entered() -> void:
	hovered = true
	update_label()

func _on_health_label_mouse_exited() -> void:
	hovered = false
	update_label()
