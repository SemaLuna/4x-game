extends CenterContainer

func _on_options_pressed() -> void:
	$MainMenuButtons.visible = false
	$OptionMenuButtons.visible = true

func _on_option_menu_buttons_back_button_pressed() -> void:
	$OptionMenuButtons.visible = false
	$MainMenuButtons.visible = true

func _on_start_combat_pressed() -> void:
	Utils.change_world(Utils.SceneNames.Combat)

func _on_start_shopping_pressed() -> void:
	Utils.change_world(Utils.SceneNames.Shop)
