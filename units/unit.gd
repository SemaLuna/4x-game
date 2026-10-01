extends VBoxContainer

## The resource file that contains all of the unit statistics
@export var base_unit_resource: UnitResource
var unit_resource: UnitResource

@onready var sprite = $Model/CombatSprite
@onready var health = $Health

func _ready():
	if (base_unit_resource == null):
		unit_resource = UnitResource.new()
	else:
		unit_resource = base_unit_resource.duplicate(true)
	configure_unit()

func configure_unit():
	health.configure(unit_resource)
	sprite.configure(unit_resource)
	unit_resource.died.connect(_on_death)

func update_health(amount: int):
	health.update_health(amount)

func _on_death():
	await sprite.animation_finished
	queue_free()
