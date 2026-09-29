extends Control

const MAIN_MENU_SCENE = preload("res://gui/menus/main_menu.tscn")

func _ready() -> void:
	add_child(MAIN_MENU_SCENE.instantiate())
