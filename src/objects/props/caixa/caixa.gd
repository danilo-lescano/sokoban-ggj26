class_name PushableObject
extends MovableObject2D

@export var object_color: Game.MaskColor = Game.MaskColor.NO_COLOR


func can_be_pushed_by(player: Player) -> bool:
	var is_no_color: bool = object_color == Game.MaskColor.NO_COLOR
	var is_matching_color: bool = player.equipped_mask == object_color

	return is_no_color or is_matching_color


func is_direction_empty(direction: Vector2) -> bool:
	match direction:
		Vector2.UP:
			if RayUP.get_collider() == null:
				return true
		Vector2.DOWN:
			if RayDown.get_collider() == null:
				return true
		Vector2.LEFT:
			if RayLeft.get_collider() == null:
				return true
		Vector2.RIGHT:
			if RayRight.get_collider() == null:
				return true

	return false


func try_pushing(player: Player, direction: Vector2) -> bool:
	if can_be_pushed_by(player) and is_direction_empty(direction):
		move_to(direction)
		return true
	else:
		return false
