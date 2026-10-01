class_name GeneralActions
extends Resource

@export var action_name: String
@export_enum("move", "attack", "defend") var action_type = "attack"
#TODO @export_enum("rearguard", "middleguard", "vanguard") var battle_position