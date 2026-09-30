extends VBoxContainer

signal back_button_pressed

func _on_back_pressed() -> void:
	back_button_pressed.emit()
