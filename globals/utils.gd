extends Node

enum SceneNames {Main, Combat}

var _main: Node

func _ready() -> void:
	_main = get_tree().root.get_node('Main')

func change_scene(scene_name: SceneNames) -> void:
	_main.change_scene(scene_name)
