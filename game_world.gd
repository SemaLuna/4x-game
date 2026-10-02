extends Node2D

signal gameworld_changed(scene_name: Utils.SceneNames)

var SCENE_TO_WORLD: Dictionary[Utils.SceneNames, String] = {
	Utils.SceneNames.Main: "res://game_world/main_menu.tscn",
	Utils.SceneNames.Shop: "res://game_world/shop.tscn",
	Utils.SceneNames.Combat: "res://game_world/combat.tscn"
}

func _ready() -> void:
	change_world(Utils.SceneNames.Main)

func change_world(scene_name: Utils.SceneNames):
	var scene = load(SCENE_TO_WORLD[scene_name])
	var instance = scene.instantiate()
	if (get_child_count() > 0):
		var current_world = get_child(0)
		current_world.queue_free()
	add_child(instance)
	gameworld_changed.emit(scene_name)
