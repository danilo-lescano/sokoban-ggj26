extends MovableObject2D

func _physics_process(_delta: float) -> void:
	if current_state == State.IDLE:
		if Input.is_action_just_pressed("up") and can_push_to(Vector2.UP, RayUP):
			move_to(Vector2.UP)
		elif Input.is_action_just_pressed("down") and can_push_to(Vector2.DOWN, RayDown):
			move_to(Vector2.DOWN)
		elif Input.is_action_just_pressed("left") and can_push_to(Vector2.LEFT, RayLeft):
			move_to(Vector2.LEFT)
		elif Input.is_action_just_pressed(&"right") and can_push_to(Vector2.RIGHT, RayRight):
			move_to(Vector2.RIGHT)


func can_push_to(direction: Vector2, ray: RayCast2D) -> bool:
	var obj: MovableObject2D = ray.get_collider() as MovableObject2D

	if obj == null:
		if check_move(direction):
			return true
		else:
			return false
	elif obj.check_move(direction):
		return true
	else:
		return false
