extends Control

var GUI_MAP: Dictionary[Utils.SceneNames, String] = {
	Utils.SceneNames.Main: "res://gui/menus/main_menu.tscn"
}

func change_gui(scene_name: Utils.SceneNames):
	# TODO remove this line once we have an interface for each scene
	if (GUI_MAP.has(scene_name)):
		var scene = load(GUI_MAP[scene_name])
		var instance = scene.instantiate()
		if (get_child_count() > 0):
			var current_gui = get_child(0)
			current_gui.queue_free()
		add_child(instance)