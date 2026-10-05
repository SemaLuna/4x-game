extends Control

var gw: CombatGameworld

func _ready() -> void:
	if (gw != null):
		gw.unit_selected.connect(_on_unit_clicked)

func _shortcut_input(event: InputEvent) -> void:
	if event.is_action_pressed('ESC'):
		$CombatMenu.show()
		get_viewport().set_input_as_handled()

func _on_combat_menu_resume_pressed() -> void:
	$CombatMenu.hide()

func _on_unit_clicked(node: UnitScene):
	print("I know that a unit has been selected!")
	print(node.unit_resource.unit_name)
