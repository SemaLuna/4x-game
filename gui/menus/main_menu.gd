class_name MainMenuGUI
extends CenterContainer

signal options_pressed
signal option_menu_buttons_back_button_pressed

func _on_options_pressed() -> void:
	$MainMenuButtons.visible = false
	$OptionMenuButtons.visible = true
	options_pressed.emit()

func _on_option_menu_buttons_back_button_pressed() -> void:
	$OptionMenuButtons.visible = false
	$MainMenuButtons.visible = true
	option_menu_buttons_back_button_pressed.emit()

func _on_quit_pressed() -> void:
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit(0)

func _on_start_combat_pressed() -> void:
	change_scene(Utils.SceneNames.Combat)

func _on_start_shopping_pressed() -> void:
	change_scene(Utils.SceneNames.Shop)

func change_scene(scene_name: Utils.SceneNames):
	Utils.change_scene(scene_name)