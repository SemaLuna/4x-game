class_name UnitScene
extends VBoxContainer

signal unit_clicked(scene: UnitScene)

## The resource file that contains all of the unit statistics
@export var unit_resource: UnitResource

@onready var sprite: AnimatedSprite2D = $Model/CombatSprite
@onready var health: Control = $Health

func _enter_tree() -> void:
	if unit_resource == null: unit_resource = UnitResource.new()
	_configure()

func _configure() -> void:
	for child in get_children():
		if child.has_method('_configure'): child._configure(unit_resource)
	unit_resource.died.connect(_on_death)

func update_health(amount: int) -> void:
	health.update_health(amount)

func _on_death() -> void:
	await sprite.animation_finished
	queue_free()

func complete_action(_action: UnitActionResource) -> void:
	#TODO use the given action
	sprite.play("attack")

func get_actions() -> Array[UnitActionResource]:
	return unit_resource.actions

func _on_area_2d_input_event(viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action_pressed('LEFT_CLICK'):
		unit_clicked.emit(self)
		viewport.set_input_as_handled()
