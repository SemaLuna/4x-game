extends Node2D

var gui: MainMenuGUI
@onready var main_camera = $MainCamera
@onready var options_camera = $OptionsCamera

func _ready() -> void:
	if (gui != null):
		gui.options_pressed.connect(show_options_camera)
		gui.option_menu_buttons_back_button_pressed.connect(show_default_camera)

func show_options_camera():
	options_camera.make_current()

func show_default_camera():
	main_camera.make_current()
