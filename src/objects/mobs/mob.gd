extends PushableObject

var cores: Dictionary = {
	"red": 0,
	"blue": 1,
	"yellow": 2,
	"green": 3,
}


func _ready() -> void:
	$Label.text = cores.find_key(object_color)
