extends CenterContainer

func _on_options_pressed() -> void:
	$MainMenuButtons.visible = false
	$OptionMenuButtons.visible = true

func _on_back_pressed() -> void:
	$OptionMenuButtons.visible = false
	$MainMenuButtons.visible = true