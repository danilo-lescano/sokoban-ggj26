class_name MovableObject2D
extends AnimatableBody2D

enum State { IDLE, MOVING }

@export var current_state: State = State.IDLE

@export var MOVEMENT_DURATION: float = 0.5
@export var MOVEMENT_DISTANCE: float = 64.0

@export_group("Ray Cast")
@export var RayUP: RayCast2D
@export var RayDown: RayCast2D
@export var RayLeft: RayCast2D
@export var RayRight: RayCast2D


func move_to(direction: Vector2) -> void:
	var tween: Tween = create_tween()

	current_state = State.MOVING

	@warning_ignore("return_value_discarded")
	tween.tween_property(self, "position", direction * MOVEMENT_DISTANCE, MOVEMENT_DURATION).as_relative().set_trans(Tween.TRANS_SINE)

	@warning_ignore("return_value_discarded")
	tween.connect("finished", _set_state_idle)


func _set_state_idle() -> void:
	current_state = State.IDLE
