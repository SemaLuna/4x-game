extends CenterContainer

signal start_combat
signal start_shop

func _on_options_pressed() -> void:
	$MainMenuButtons.visible = false
	$OptionMenuButtons.visible = true

func _on_option_menu_buttons_back_button_pressed() -> void:
	$OptionMenuButtons.visible = false
	$MainMenuButtons.visible = true

func _on_start_combat_pressed() -> void:
	start_combat.emit()

func _on_start_shopping_pressed() -> void:
	start_shop.emit()
