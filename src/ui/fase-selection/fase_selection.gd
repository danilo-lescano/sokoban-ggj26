extends Control

var fase_node: PackedScene = preload("res://src/gerente_fase/gerente_fase.tscn")


func switch_to_fase(fase_number: int) -> void:
	var fase: FaseManager = fase_node.instantiate()
	fase.numero_fase = fase_number
	if get_tree().change_scene_to_node(fase) != OK:
		push_error("Error chaging scene to fase" + fase.to_string())


func _on_fase_1_pressed() -> void:
	switch_to_fase(1)


func _on_fase_2_pressed() -> void:
	switch_to_fase(2)
