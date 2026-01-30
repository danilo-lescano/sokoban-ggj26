extends PushableObject

func _ready() -> void:
	$Label.text = Game.Masks.find_key(object_color)
