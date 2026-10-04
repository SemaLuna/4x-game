extends Node

const SCENE_TO_WORLD_MAP: Dictionary[Utils.SceneNames, String] = {
	Utils.SceneNames.Main: "res://gameworld/default_gameworld.tscn",
	Utils.SceneNames.Combat: "res://gameworld/combat.tscn"
}
const SCENE_TO_GUI_MAP: Dictionary[Utils.SceneNames, String] = {
	Utils.SceneNames.Main: "res://gui/menus/main_menu.tscn"
}
var _player: PlayerResource

@onready var gw = $GameWorld
@onready var gui = $GUI

func _ready() -> void:
	change_scene(Utils.SceneNames.Main)

func change_scene(scene_name: Utils.SceneNames) -> void:
	initialize_resources(scene_name)
	var gw_scene = initialize_scene(SCENE_TO_WORLD_MAP, scene_name)
	var gui_scene = initialize_scene(SCENE_TO_GUI_MAP, scene_name)
	if (gw_scene != null) && (gui_scene != null):
		configure_communication(gw_scene, gui_scene)
	if (gw_scene != null): swap_child(gw, gw_scene)
	if (gui_scene != null): swap_child(gui, gui_scene)

func initialize_resources(scene_name: Utils.SceneNames) -> void:
	match scene_name:
		Utils.SceneNames.Main:
			_player = null
		_:
			_player = PlayerResource.new()

func initialize_scene(mapping: Dictionary[Utils.SceneNames, String], scene_name: Utils.SceneNames) -> Node:
	var instance: Node = null
	if (mapping.has(scene_name)):
		var scene = load(mapping[scene_name])
		instance = scene.instantiate()
	return instance

func configure_communication(gw_scene: Node, gui_scene: Node):
	if ('gui' in gw_scene): gw_scene.gui = gui_scene
	if ('gw' in gui_scene): gui_scene.gw = gw_scene

func swap_child(parent_node: Node, child_node: Node):
	if (parent_node.get_child_count() > 0):
		var current_child = parent_node.get_child(0)
		current_child.queue_free()
	parent_node.add_child(child_node)
