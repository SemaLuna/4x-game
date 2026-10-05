class_name CombatGameworld
extends Node2D

signal unit_selected(scene: UnitScene)

## Attacking army
@export var ally_army_resources: Array[UnitResource]
## Defending army
@export var enemy_army_resources: Array[UnitResource]

var ally_army: Array
var enemy_army: Array

var unit_scene = load("res://units/unit.tscn")

func _ready():
	configure_army(ally_army_resources, true)
	configure_army(enemy_army_resources, false)

func add_combat_unit(unit_resource: UnitResource, is_ally: bool):
	var unit = unit_scene.instantiate()
	unit.unit_resource = unit_resource
	unit.unit_clicked.connect(unit_clicked)
	add_child(unit)
	# TODO add logic to place them in the battlegrid according to position
	if is_ally:
		unit.position = Vector2(200, 200)
		ally_army.append(unit)
	else:
		unit.position = Vector2(1000, 200)
		unit.sprite.set_flip_h(true)
		enemy_army.append(unit)


func configure_army(army_resources: Array[UnitResource], is_ally_army: bool):
	for resource in army_resources:
		add_combat_unit(resource, is_ally_army)

func unit_clicked(scene: UnitScene):
	unit_selected.emit(scene)