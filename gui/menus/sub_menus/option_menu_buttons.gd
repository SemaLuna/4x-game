extends VBoxContainer

signal back_button_pressed

@onready var _slider: HSlider = $Volume/Slider

func _ready() -> void:
	_slider.value = MusicPlayer.volume_linear * 100

func _on_back_pressed() -> void:
	back_button_pressed.emit()

func _on_slider_value_changed(value: float) -> void:
	MusicPlayer.volume_linear = value / 100