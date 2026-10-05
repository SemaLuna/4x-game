extends Control

func _configure(unit_resource: UnitResource) -> void:
	for child in get_children():
		if child.has_method('_configure'): child._configure(unit_resource)