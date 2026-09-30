extends Node

var unit_name = "Squire"
var max_health = 100
var current_health = 100
var hovered: bool = false
@onready var health_bar = $HealthContainer/HealthBar
@onready var health_label = $HealthContainer/HealthLabel

const TEXT_RED: Texture2D = preload("res://unit/unit_res/tres/red_health.tres")
const TEXT_ORANGE: Texture2D = preload("res://unit/unit_res/tres/orange_health.tres")
const TEXT_GREEN: Texture2D = preload("res://unit/unit_res/tres/green_health.tres")

signal survive
signal death

func _ready():
	update_health_bar()
	update_label()

func take_damage(damage):
	current_health -= round(damage)
	update_health_bar()
	update_label()
	if current_health <= 0:
		death.emit()
	else:
		survive.emit()

func update_health_bar():
	health_label.text = str(current_health)
	var percent_health = float(current_health)/max_health * 100
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
