extends Control

const TEXT_RED: Texture2D = preload("res://resources/health_bar/red_health.tres")
const TEXT_ORANGE: Texture2D = preload("res://resources/health_bar/orange_health.tres")
const TEXT_GREEN: Texture2D = preload("res://resources/health_bar/green_health.tres")

var _unit_resource: UnitResource
var hovered: bool = false
var current_health: int:
	get: return _unit_resource.current_health
	set(value): _unit_resource.current_health = value
var max_health: int:
	get: return _unit_resource.max_health
	set(value): assert(false, "should not set max_health directly")
var unit_name: String:
	get: return _unit_resource.unit_name
	set(value): assert(false, "should not set unit_name directly")
@onready var health_bar = $HealthContainer/HealthBar
@onready var health_label = $HealthContainer/HealthLabel

func configure(unit_resource: UnitResource):
	_unit_resource = unit_resource
	update_health_bar()
	update_label()

func update_health(amount: int):
	var new_health = current_health + amount
	if (new_health < 0): new_health = 0
	else: if (new_health > max_health): new_health = max_health
	current_health = new_health
	update_health_bar()
	update_label()

func update_health_bar():
	health_label.text = str(current_health)
	var percent_health = (float(current_health) / max_health) * 100
	health_bar.value = percent_health
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
