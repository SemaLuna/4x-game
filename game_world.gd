extends Node2D


const MAIN_MENU_SCENE = preload("res://game_world/main_menu.tscn")

func _ready() -> void:
	var scene = MAIN_MENU_SCENE.instantiate()
	add_child(scene)
