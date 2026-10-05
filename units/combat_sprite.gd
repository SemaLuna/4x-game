extends AnimatedSprite2D

func _ready() -> void:
	play("idle")

func _configure(unit_resource: UnitResource) -> void:
	sprite_frames = unit_resource.animations
	unit_resource.hurt.connect(_on_hurt)
	unit_resource.died.connect(_on_death)

func _on_hurt() -> void:
	play("hurt")
	await animation_finished
	play("idle")

func _on_death() -> void:
	play("death")