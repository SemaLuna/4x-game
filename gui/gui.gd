extends Control

const MAIN_MENU_SCENE = preload("res://gui/menus/main_menu.tscn")

func _ready() -> void:
	var scene = MAIN_MENU_SCENE.instantiate()
	add_child(scene)
	scene.start_combat.connect(_on_start_combat)
	scene.start_shop.connect(_on_start_shop)

func _on_start_combat() -> void:
	print("Combat has started!")

func _on_start_shop() -> void:
	print("Shop has started!")