extends MovableObject2D

func _on_top_collision_body_entered(body: Node2D) -> void:
	if check_move(Vector2.DOWN):
		move_to(Vector2.DOWN)


func _on_bottom_collision_body_entered(body: Node2D) -> void:
	if check_move(Vector2.UP):
		move_to(Vector2.UP)


func _on_left_collision_body_entered(body: Node2D) -> void:
	if check_move(Vector2.RIGHT):
		move_to(Vector2.RIGHT)


func _on_right_collision_body_entered(body: Node2D) -> void:
	if check_move(Vector2.LEFT):
		move_to(Vector2.LEFT)
