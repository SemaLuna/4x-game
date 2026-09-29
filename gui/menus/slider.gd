extends HSlider

func _ready() -> void:
	value = MusicPlayer.volume_linear * 100

func _on_value_changed(updated_value: float) -> void:
	MusicPlayer.volume_linear = updated_value / 100
