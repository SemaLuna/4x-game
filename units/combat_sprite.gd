extends AnimatedSprite2D

func configure(unit_resource: UnitResource):
	sprite_frames = unit_resource.animations
	unit_resource.hurt.connect(_on_hurt)
	unit_resource.died.connect(_on_death)
	play("idle")

func _on_hurt() -> void:
	play("hurt")
	await animation_finished
	play("idle")

func _on_death() -> void:
	play("death")