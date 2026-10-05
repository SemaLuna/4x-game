extends CenterContainer

signal resume_pressed

func _on_options_pressed() -> void:
	$CombatMenuButtons.visible = false
	$OptionMenuButtons.visible = true

func _on_option_menu_buttons_back_button_pressed() -> void:
	$OptionMenuButtons.visible = false
	$CombatMenuButtons.visible = true

func _on_exit_pressed() -> void:
	Utils.change_scene(Utils.SceneNames.Main)

func _on_resume_pressed() -> void:
	resume_pressed.emit()
