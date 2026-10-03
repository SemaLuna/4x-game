extends VBoxContainer

## The resource file that contains all of the unit statistics
@export var unit_resource: UnitResource

@onready var sprite = $Model/CombatSprite
@onready var health = $Health

func _enter_tree():
	if unit_resource == null: unit_resource = UnitResource.new()
	_configure()

func _configure():
	for child in get_children():
		if child.has_method('_configure'): child._configure(unit_resource)
	unit_resource.died.connect(_on_death)

func update_health(amount: int):
	health.update_health(amount)

func _on_death():
	await sprite.animation_finished
	queue_free()
