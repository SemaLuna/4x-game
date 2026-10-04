extends Node

enum SceneNames {Main, Combat, Shop}

var _main: Node

func _ready() -> void:
	_main = get_tree().root.get_node('Main')

func change_scene(scene_name: SceneNames):
	return _main.change_scene(scene_name)
