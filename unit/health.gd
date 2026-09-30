extends Node

var max_health = 100
var current_health = 100
@onready var health_bar = $HealthContainer/HealthBar
@onready var health_label = $HealthContainer/HealthLabel

const TEXT_RED: Texture2D = preload("res://unit/unit_res/tres/red_health.tres")
const TEXT_ORANGE: Texture2D = preload("res://unit/unit_res/tres/orange_health.tres")
const TEXT_GREEN: Texture2D = preload("res://unit/unit_res/tres/green_health.tres")

func _ready():
	update_health_bar()

func take_damage(damage):
	current_health -= round(damage)
	update_health_bar()

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
	
		
