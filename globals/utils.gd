extends Node

enum SceneNames {Main, Shop, Combat}

func change_world(scene_name: SceneNames):
	return get_tree().root.get_node('Main/GameWorld').change_world(scene_name)